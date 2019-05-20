//
//  FeatureManagedObject+CoreDataProperties.h
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//
//

#import "FeatureManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FeatureManagedObject (CoreDataProperties)

+ (NSFetchRequest<FeatureManagedObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *feature_description;
@property (nullable, nonatomic, copy) NSString *feature_id;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *status_reason;
@property (nullable, nonatomic, copy) NSString *release_id;
@property (nullable, nonatomic, copy) NSString *command_name;
@property (nullable, nonatomic, retain) ReleaseManagedObject *ref_release_id;

@end

NS_ASSUME_NONNULL_END
