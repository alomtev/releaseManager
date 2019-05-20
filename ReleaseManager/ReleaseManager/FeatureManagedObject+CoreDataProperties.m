//
//  FeatureManagedObject+CoreDataProperties.m
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//
//

#import "FeatureManagedObject+CoreDataProperties.h"

@implementation FeatureManagedObject (CoreDataProperties)

+ (NSFetchRequest<FeatureManagedObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"FeatureManagedObject"];
}

@dynamic feature_description;
@dynamic feature_id;
@dynamic name;
@dynamic status;
@dynamic status_reason;
@dynamic release_id;
@dynamic command_name;
@dynamic ref_release_id;

@end
