//
//  NewsViewDelegate.h
//  ReleaseManager
//
//  Created by Lomtev on 13.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "DTONews.h"

@protocol NewsViewDelegate <NSObject>

- (void)prosessNews:(NSArray<DTONews *> *)list;

@end
