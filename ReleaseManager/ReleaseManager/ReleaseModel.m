//
//  ReleaseModel.m
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "ReleaseModel.h"
#import "ReleaseManagedObject+CoreDataClass.h"

@import UserNotifications;

@implementation ReleaseModel

- (void)loadReleases
{
    if(!self.networkService)
    {
        return;
    }
    self.networkService.delegate = self;
    [self.networkService loadReleases];
}

- (void)clearReleases
{
    NSError *err;
    [self.fetchedReleaseController performFetch:&err];
    if(err)
    {
        NSLog(@"%@", err);
    }
    if(self.fetchedReleaseController.fetchedObjects.count > 0)
    {
        for(ReleaseManagedObject *releaseMO in self.fetchedReleaseController.fetchedObjects)
        {
            [self.coreDataContext deleteObject:releaseMO];
            if (![releaseMO isDeleted])
            {
                NSLog(@"Не удалось удалить объект");
            }
        }
        [self.coreDataContext save:nil];
    }
}

#pragma mark - Push

- (void)removeNotificationRequests
{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center removeAllPendingNotificationRequests];
}

- (void)sheduleFeatureFreezeNotificationFromDate:(NSDate *)dateFeatureFreeze
{
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = @"Внимание завтра Feature Freeze!";
    content.body = @"Коллега завтра наступит Feature Freeze. Закрой DOR!!";
    content.sound = [UNNotificationSound defaultSound];
    
    content.badge = @([self giveNewBadgeNewNumber] + 1);
    
    content.categoryIdentifier = @"LCTReminderCategory";
    
    NSString *identifier = @"NotificationId";
    
    UNNotificationTrigger *wt = [self dateTriggerWithDate:dateFeatureFreeze];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:wt];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error){
        if (error)
        {
            NSLog(@"ЧТо-то не так!");
        }
    }];
}

- (NSInteger)giveNewBadgeNewNumber
{
    return [UIApplication sharedApplication] .applicationIconBadgeNumber;
}

- (UNCalendarNotificationTrigger *)dateTriggerWithDate:(NSDate *)dateFeatureFreeze
{
    NSDate *date = [dateFeatureFreeze dateByAddingTimeInterval:-1*24*60*60];;
    NSDateComponents *triggerDate = [[NSCalendar currentCalendar] components:NSCalendarUnitYear + NSCalendarUnitMonth + NSCalendarUnitDay + NSCalendarUnitHour + NSCalendarUnitMinute + NSCalendarUnitSecond fromDate:date];
    
    return [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:triggerDate repeats:NO];
}

#pragma mark - CoreData

- (NSFetchedResultsController *)fetchedReleaseController
{
    
    if (_fetchedReleaseController)
    {
        return _fetchedReleaseController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:NSStringFromClass([ReleaseManagedObject class])
                                   inManagedObjectContext:self.coreDataContext];
    [fetchRequest setEntity:entity];
    [fetchRequest setSortDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES]]];
    [fetchRequest setFetchBatchSize:100];
    
    NSFetchedResultsController *newFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:self.coreDataContext sectionNameKeyPath:nil
                                                   cacheName:@"Root"];
    _fetchedReleaseController = newFetchedResultsController;
    _fetchedReleaseController.delegate = self;
    
    return _fetchedReleaseController;
}

- (NSManagedObjectContext *)coreDataContext
{
    UIApplication *application = [UIApplication sharedApplication];
    NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    return context;
}

#pragma mark - ReleaseNetworkServiceDelegate

- (void)prosessResponse:(NSData *)data
{
    NSArray<NSDictionary *> *releaseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if(releaseArray.count > 0)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self clearReleases];
            
            for (NSDictionary *release in releaseArray)
            {
                NSString *releaseId = release[@"release_id"];
                NSString *name = release[@"name"];
                NSString *version = release[@"version"];
                NSString *platform = release[@"platform"];
                
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"dd.MM.yyyy"];
                [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
                NSDate *dateCheck = [dateFormatter dateFromString: release[@"date_check"]];
                NSDate *dateFF = [dateFormatter dateFromString: release[@"date_ff"]];
                NSDate *datePublish = [dateFormatter dateFromString: release[@"date_publish"]];
                
                ReleaseManagedObject *release = [NSEntityDescription insertNewObjectForEntityForName:
                                                 @"ReleaseManagedObject" inManagedObjectContext:self.coreDataContext];
                
                release.release_id = releaseId;
                release.name = name;
                release.version = version;
                release.platform = platform;
                release.date_check = dateCheck;
                release.date_ff = dateFF;
                release.date_publish = datePublish;
            }
            NSError *error = nil;
            if (![self.coreDataContext save:&error])
            {
                NSLog(@"Не удалось сохранить объект");
                NSLog(@"%@, %@", error, error.localizedDescription);
            }  
        });
    }
}

# pragma mark - NSFetchedResultsControllerDelegate


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.delegate releaseListChanged];
    
    // Очищаем уведомления ожидающие отправки
    [self removeNotificationRequests];
    
    if(controller.fetchedObjects.count > 0)
    {
        // Устанавливаем уведомление о ближайшем Feature Freeze
        ReleaseManagedObject *release = controller.fetchedObjects[0];
        [self sheduleFeatureFreezeNotificationFromDate:release.date_ff];
    }
}

@end
