//
//  DTOFeature.h
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTOFeature : NSObject

@property (nullable, nonatomic, copy) NSString *featureDescription;
@property (nonnull, nonatomic, copy) NSString *featureId;
@property (nonnull, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *statusReason;
@property (nonnull, nonatomic, copy) NSString *releaseId;
@property (nullable, nonatomic, copy) NSString *commandName;

@end

NS_ASSUME_NONNULL_END
