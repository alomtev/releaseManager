//
//  DTONews.h
//  ReleaseManager
//
//  Created by Lomtev on 13.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTONews : NSObject

@property (nullable, nonatomic, copy) NSDate *newsDate;
@property (nullable, nonatomic, copy) NSString *newsHeader;
@property (nullable, nonatomic, copy) NSString *newsId;
@property (nullable, nonatomic, copy) NSString *newsText;

@end

NS_ASSUME_NONNULL_END
