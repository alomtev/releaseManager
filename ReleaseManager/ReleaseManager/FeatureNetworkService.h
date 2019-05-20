//
//  FeatureNetworkService.h
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols/FeatureNetworkServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/**
 Класс - сетевой слой для получения списка фичей
 */
@interface FeatureNetworkService : NSObject

@property (nonatomic, weak) id<FeatureNetworkServiceDelegate> delegate; /**< Делегат для обработки ответа */

- (void)loadFeaturesBy:(NSString *)releaseId;    /**< Метод загрузки списка фичей по id релиза */

@end

NS_ASSUME_NONNULL_END
