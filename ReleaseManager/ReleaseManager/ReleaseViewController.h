//
//  ReleaseViewController.h
//  ReleaseManager
//
//  Created by Lomtev on 04.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReleaseViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReleaseViewController : UIViewController<ReleaseViewDelegate, UICollectionViewDelegate,
UICollectionViewDataSource>

@end

NS_ASSUME_NONNULL_END
