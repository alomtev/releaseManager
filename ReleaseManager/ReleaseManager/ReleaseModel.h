//
//  ReleaseModel.h
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReleaseNetworkService.h"
#import "ReleaseViewDelegate.h"
#import "AppDelegate.h"

@import CoreData;

NS_ASSUME_NONNULL_BEGIN

/**
 Класс - слой модели для получения списка релизов
 */
@interface ReleaseModel : NSObject<ReleaseNetworkServiceDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) ReleaseNetworkService *networkService;     /**< Провайдер работы с сетью */
@property (nonatomic, strong) NSFetchedResultsController *fetchedReleaseController;
@property (nonatomic, weak) id<ReleaseViewDelegate> delegate; /**< Делегат слоя UI */

/**
 Загружает список релизов
 */
- (void)loadReleases;

@end

NS_ASSUME_NONNULL_END
