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

@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@interface NewsModel : NSObject

@property (nonatomic, strong) NSFetchedResultsController *fetchedNewsController;
@property (nonatomic, weak) id<NewsViewDelegate> delegate; /**< Делегат внешних событий */

- (void)loadNews;

@end

NS_ASSUME_NONNULL_END
