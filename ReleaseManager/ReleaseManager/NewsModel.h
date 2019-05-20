//
//  NewsModel.h
//  ReleaseManager
//
//  Created by Lomtev on 07.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsNetworkServiceDelegate.h"
#import "NewsViewDelegate.h"
#include "NewsNetworkService.h"

@import CoreData;

NS_ASSUME_NONNULL_BEGIN

/**
 Класс - слой модели для получения списка новостей
 */
@interface NewsModel : NSObject<NewsNetworkServiceDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NewsNetworkService *networkService;   /**< Провайдер работы с сетью */
@property (nonatomic, strong) NSFetchedResultsController *fetchedNewsController;    
@property (nonatomic, weak) id<NewsViewDelegate> delegate; /**< Делегат внешних событий */

/**
 Загружает список новостей
 */
- (void)loadNews;

/**
 Очищает список новостей из CoreData
 */
- (void)clearNews;

@end

NS_ASSUME_NONNULL_END
