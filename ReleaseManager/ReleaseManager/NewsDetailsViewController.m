//
//  NewsDetailsViewController.m
//  ReleaseManager
//
//  Created by Lomtev on 14.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "NewsDetailsViewController.h"

@interface NewsDetailsViewController ()

@property (nonatomic, strong) UILabel *newsHeader;
@property (nonatomic, strong) UILabel *newsDate;
@property (nonatomic, strong) UILabel *newsText;

@end

@implementation NewsDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createUI];
}

#pragma mark - Layout

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    if(!self.dtoNews)
    {
        return;
    }
    self.newsHeader = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.frame) - 20 * 2, 50)];
    [self.newsHeader setFont:[UIFont boldSystemFontOfSize:16]];
    self.newsHeader.text = self.dtoNews.newsHeader;
    [self.view addSubview:self.newsHeader];
    
    self.newsDate = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.newsHeader.frame) + 20, CGRectGetWidth(self.view.frame) - 20 *2, 50)];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    self.newsDate.text = [dateFormatter stringFromDate:self.dtoNews.newsDate];
    [self.view addSubview:self.newsDate];
    
    self.newsText = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.newsDate.frame) + 20, CGRectGetWidth(self.view.frame) - 20 *2, 200)];
    self.newsText.text = self.dtoNews.newsText;
    self.newsText.adjustsFontSizeToFitWidth = NO;
    self.newsText.numberOfLines = 0;
    [self.newsText sizeToFit];
    [self.view addSubview:self.newsText];
}

@end
