//
//  Feature+CoreDataProperties.h
//  ReleaseManager
//
//  Created by Lomtev on 06.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//
//

#import "Feature+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Feature (CoreDataProperties)

+ (NSFetchRequest<Feature *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *feature_key;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *feature_description;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *status_reason;

@end

NS_ASSUME_NONNULL_END
