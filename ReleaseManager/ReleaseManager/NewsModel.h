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

@interface NewsModel : NSObject<NewsNetworkServiceDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NewsNetworkService *networkService;
@property (nonatomic, strong) NSFetchedResultsController *fetchedNewsController;
@property (nonatomic, weak) id<NewsViewDelegate> delegate; /**< Делегат внешних событий */

- (void)loadNews;

@end

NS_ASSUME_NONNULL_END
