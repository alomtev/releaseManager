//
//  NewsManagedObject+CoreDataProperties.m
//  ReleaseManager
//
//  Created by Lomtev on 11.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//
//

#import "NewsManagedObject+CoreDataProperties.h"

@implementation NewsManagedObject (CoreDataProperties)

+ (NSFetchRequest<NewsManagedObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"NewsManagedObject"];
}

@dynamic newsDate;
@dynamic newsHeader;
@dynamic newsId;
@dynamic newsText;

@end
