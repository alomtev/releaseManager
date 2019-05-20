//
//  DTORelease.h
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTORelease : NSObject

@property (nullable, nonatomic, copy) NSDate *dateCheck;
@property (nullable, nonatomic, copy) NSDate *dateFeatureFreeze;
@property (nullable, nonatomic, copy) NSDate *datePublish;
@property (nonnull, nonatomic, copy) NSString *name;
@property (nonnull, nonatomic, copy) NSString *platform;
@property (nonnull, nonatomic, copy) NSString *releaseId;
@property (nonnull, nonatomic, copy) NSString *version;

@end

NS_ASSUME_NONNULL_END
