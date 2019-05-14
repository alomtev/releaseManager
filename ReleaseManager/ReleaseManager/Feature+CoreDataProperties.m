//
//  Feature+CoreDataProperties.m
//  ReleaseManager
//
//  Created by Lomtev on 06.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//
//

#import "Feature+CoreDataProperties.h"

@implementation Feature (CoreDataProperties)

+ (NSFetchRequest<Feature *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Feature"];
}

@dynamic feature_key;
@dynamic name;
@dynamic feature_description;
@dynamic status;
@dynamic status_reason;

@end
