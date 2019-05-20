//
//  FeatureNetworkServiceDelegate.h
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

@protocol FeatureNetworkServiceDelegate <NSObject>

- (void)prosessResponse:(NSData *)data;

@end
