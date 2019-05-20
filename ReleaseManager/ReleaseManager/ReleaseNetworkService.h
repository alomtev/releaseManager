//
//  ReleaseNetworkService.h
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols/ReleaseNetworkServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/**
 Класс - сетевой слой для получения списка релизов 
 */
@interface ReleaseNetworkService : NSObject

@property (nonatomic, weak) id<ReleaseNetworkServiceDelegate> delegate; /**< Делегат для обработки ответа */

- (void)loadReleases;    /**< Метод загрузки списка релизов */

@end

NS_ASSUME_NONNULL_END
