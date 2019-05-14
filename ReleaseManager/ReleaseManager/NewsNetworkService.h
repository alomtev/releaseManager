//
//  NewsNetworkService.h
//  ReleaseManager
//
//  Created by Lomtev on 11.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsNetworkServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsNetworkService : NSObject

@property (nonatomic, weak) id<NewsNetworkServiceDelegate> delegate; /**< Делегат внешних событий */

- (void)loadNews;

@end

NS_ASSUME_NONNULL_END
