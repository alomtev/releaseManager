//
//  FeatureModel.h
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeatureNetworkService.h"

NS_ASSUME_NONNULL_BEGIN

/**
 Класс - слой модель для получения списка фичей
 */
@interface FeatureModel : NSObject<FeatureNetworkServiceDelegate>

@property (nonatomic, strong) FeatureNetworkService *networkService;     /**< Провайдер работы с сетью */

/**
 Загружает список фичей по id релиза
 */
- (void)loadFeaturesBy:(NSString *)releaseId;

@end

NS_ASSUME_NONNULL_END
