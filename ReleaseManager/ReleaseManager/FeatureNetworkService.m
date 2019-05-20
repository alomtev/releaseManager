//
//  FeatureNetworkService.m
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "FeatureNetworkService.h"

@implementation FeatureNetworkService

- (void)loadFeaturesBy:(NSString *)releaseId
{
    if(!releaseId)
    {
        return;
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://private-21df71-myhost.apiary-mock.com/feature?release_id=%@",releaseId]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error)
        {
            [self.delegate prosessResponse:data];
        }
        else
        {
            NSLog(@"Error occured!");
        }
    }];
    [dataTask resume];
}

@end
