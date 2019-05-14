//
//  NewsNetworkService.m
//  ReleaseManager
//
//  Created by Lomtev on 11.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "NewsNetworkService.h"
#import "NewsNetworkServiceDelegate.h"

@implementation NewsNetworkService

- (void)loadNews
{
    // URLSessionConfiguration ?
    // sessionWithConfiguration??
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://private-21df71-myhost.apiary-mock.com/news"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
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
