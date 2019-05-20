//
//  NewsModel.m
//  ReleaseManager
//
//  Created by Lomtev on 07.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "NewsModel.h"
#import "AppDelegate.h"
#import "NewsManagedObject+CoreDataClass.h"
#import "NewsNetworkService.h"

@interface NewsModel ()

@end


@implementation NewsModel

- (void)loadNews
{
    if(!self.networkService)
    {
        return;
    }
    self.networkService.delegate = self;
    [self.networkService loadNews];
}

- (void)clearNews
{
    NSError *err;
    [self.fetchedNewsController performFetch:&err];
    if(err)
    {
        NSLog(@"%@", err);
    }
    if(self.fetchedNewsController.fetchedObjects.count > 0)
    {
        for(NewsManagedObject *news in self.fetchedNewsController.fetchedObjects)
        {
            [self.coreDataContext deleteObject:news];
            if (![news isDeleted])
            {
                NSLog(@"Не удалось удалить объект");
            }
        }
        [self.coreDataContext save:nil];
    }
}

#pragma mark - CoreData

- (NSFetchedResultsController *)fetchedNewsController
{
    
    if (_fetchedNewsController)
    {
        return _fetchedNewsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:NSStringFromClass([NewsManagedObject class]) inManagedObjectContext:self.coreDataContext];
    [fetchRequest setEntity:entity];
    [fetchRequest setSortDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"newsDate" ascending:YES]]];
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:self.coreDataContext sectionNameKeyPath:nil
                                                   cacheName:@"Root"];
    _fetchedNewsController = theFetchedResultsController;
    _fetchedNewsController.delegate = self;
    
    return _fetchedNewsController;
}

- (NSManagedObjectContext *)coreDataContext
{
    UIApplication *application = [UIApplication sharedApplication];
    NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    return context;
}

#pragma mark - NewsNetworkServiceDelegate

- (void)prosessResponse:(NSData *)data
{
    NSDictionary *newsJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray<NSDictionary *> *newsArray = [newsJson valueForKeyPath:@"news"][0];
    if(newsArray.count > 0)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            //  Очищаем старые новости перед загрузкой новых
            [self clearNews];
            
            for (NSDictionary *news in newsArray)
            {
                NSString *news_id = news[@"news_id"];
                NSString *news_header = news[@"news_header"];
                NSString *news_text = news[@"news_text"];
                
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
                NSDate *news_date = [dateFormatter dateFromString: news[@"news_date"]];
                
                NewsManagedObject *news = [NSEntityDescription insertNewObjectForEntityForName:@"NewsManagedObject" inManagedObjectContext:self.coreDataContext];
                
                news.newsId = news_id;
                news.newsHeader = news_header;
                news.newsText = news_text;
                news.newsDate = news_date;
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
    [self.delegate newsListChanged];
}

@end
