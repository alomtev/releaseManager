//
//  ReleaseManagedObject+CoreDataProperties.h
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//
//

#import "ReleaseManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ReleaseManagedObject (CoreDataProperties)

+ (NSFetchRequest<ReleaseManagedObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *date_check;
@property (nullable, nonatomic, copy) NSDate *date_ff;
@property (nullable, nonatomic, copy) NSDate *date_publish;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *platform;
@property (nullable, nonatomic, copy) NSString *release_id;
@property (nullable, nonatomic, copy) NSString *version;

@end

NS_ASSUME_NONNULL_END
