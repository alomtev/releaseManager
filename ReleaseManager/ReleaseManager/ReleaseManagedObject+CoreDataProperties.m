//
//  ReleaseManagedObject+CoreDataProperties.m
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//
//

#import "ReleaseManagedObject+CoreDataProperties.h"

@implementation ReleaseManagedObject (CoreDataProperties)

+ (NSFetchRequest<ReleaseManagedObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"ReleaseManagedObject"];
}

@dynamic date_check;
@dynamic date_ff;
@dynamic date_publish;
@dynamic name;
@dynamic platform;
@dynamic release_id;
@dynamic version;

@end
