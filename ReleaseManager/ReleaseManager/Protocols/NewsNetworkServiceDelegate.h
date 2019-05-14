//
//  NewsNetworkServiceDelegate.h
//  ReleaseManager
//
//  Created by Lomtev on 11.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

@protocol NewsNetworkServiceDelegate <NSObject>

- (void)prosessResponse:(NSData *)data;

@end
