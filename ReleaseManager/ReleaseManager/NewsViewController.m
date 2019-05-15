//
//  NewsViewController.m
//  ReleaseManager
//
//  Created by Lomtev on 04.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsManagedObject+CoreDataClass.h"
#import "NewsDetailsViewController.h"

@interface NewsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NewsModel *model;

@end

@implementation NewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self navBarConfig];
    [self createTableView];
    
    self.model = [NewsModel new];
    self.model.networkService = [NewsNetworkService new];
    self.model.delegate = self;
    [self.model loadNews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSError *err;
    [self.model.fetchedNewsController performFetch:&err];
    if(err)
    {
        NSLog(@"%@", err);
    }
    
    [self updateTableView];
}

- (void)updateTableView
{
    [self.tableView reloadData];
}

#pragma mark - Layout

- (void)navBarConfig
{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.title = @"Релизные новости";
}

- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 200) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - NewsViewDelegate

- (void)prosessNews:(NSArray<DTONews *> *)list
{
    
}

#pragma mark - UITableView Delegate/DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.fetchedNewsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //??? как перейти на DTO?
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"news"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"news"];
    }
    NewsManagedObject *newsMO = [self.model.fetchedNewsController objectAtIndexPath:indexPath];
    if (newsMO)
    {
        cell.textLabel.text = newsMO.newsId;
        cell.detailTextLabel.text = newsMO.newsHeader;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsManagedObject *newsMO = [self.model.fetchedNewsController objectAtIndexPath:indexPath];
    if (newsMO)
    {
        //[self.fetchedResultsController.managedObjectContext deleteObject:person];
        DTONews *dtoNews = [DTONews new];
        dtoNews.newsId = newsMO.newsId;
        dtoNews.newsHeader = newsMO.newsHeader;
        dtoNews.newsDate = newsMO.newsDate;
        dtoNews.newsText = newsMO.newsText;

        NewsDetailsViewController *newsDetailsViewController = [[NewsDetailsViewController alloc] init];
        newsDetailsViewController.dtoNews = dtoNews;
        [self.navigationController pushViewController:newsDetailsViewController animated:YES];
    }
}

@end
