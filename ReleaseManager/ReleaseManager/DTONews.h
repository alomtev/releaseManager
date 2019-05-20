//
//  DTONews.h
//  ReleaseManager
//
//  Created by Lomtev on 13.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTONews : NSObject

@property (nonnull, nonatomic, copy) NSDate *newsDate;
@property (nonnull, nonatomic, copy) NSString *newsHeader;
@property (nonnull, nonatomic, copy) NSString *newsId;
@property (nullable, nonatomic, copy) NSString *newsText;

@end
