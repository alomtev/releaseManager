//
//  FeatureModel.m
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "FeatureModel.h"

@implementation FeatureModel

- (void)loadFeaturesBy:(NSString *)releaseId
{
    if(!self.networkService)
    {
        return;
    }
    self.networkService.delegate = self;
    [self.networkService loadFeaturesBy:releaseId];
}

- (void)prosessResponse:(NSData *)data
{
    
}

@end
