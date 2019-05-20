//
//  ReleaseNetworkService.m
//  ReleaseManager
//
//  Created by Lomtev on 20.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "ReleaseNetworkService.h"

@implementation ReleaseNetworkService

- (void)loadReleases
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://private-21df71-myhost.apiary-mock.com/release"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
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
