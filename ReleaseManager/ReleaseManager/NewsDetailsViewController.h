//
//  NewsDetailsViewController.h
//  ReleaseManager
//
//  Created by Lomtev on 14.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTONews.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailsViewController : UIViewController

@property (nonatomic, strong) DTONews *dtoNews;

@end

NS_ASSUME_NONNULL_END
