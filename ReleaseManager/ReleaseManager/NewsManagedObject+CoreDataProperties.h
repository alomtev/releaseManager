//
//  NewsManagedObject+CoreDataProperties.h
//  ReleaseManager
//
//  Created by Lomtev on 11.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//
//

#import "NewsManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface NewsManagedObject (CoreDataProperties)

+ (NSFetchRequest<NewsManagedObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *newsDate;
@property (nullable, nonatomic, copy) NSString *newsHeader;
@property (nullable, nonatomic, copy) NSString *newsId;
@property (nullable, nonatomic, copy) NSString *newsText;

@end

NS_ASSUME_NONNULL_END
