//
//  ReleaseViewController.m
//  ReleaseManager
//
//  Created by Lomtev on 04.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import "ReleaseViewController.h"
#import "ReleaseModel.h"
#import "ReleaseManagedObject+CoreDataClass.h"
#import "ReleaseCollectionViewCell.h"

@interface ReleaseViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ReleaseModel *model;

@end

@implementation ReleaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self navBarConfig];
    [self createUI];
    
    self.model = [ReleaseModel new];
    self.model.networkService = [ReleaseNetworkService new];
    self.model.delegate = self;
    [self.model loadReleases];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSError *err;
    [self.model.fetchedReleaseController performFetch:&err];
    if(err)
    {
        NSLog(@"%@", err);
    }
    
    [self updateCollectionView];
}

- (void)updateCollectionView
{
    [self.collectionView reloadData];
}


#pragma mark - Layout

- (void)navBarConfig
{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.title = @"Список релизов";
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewLayout.itemSize = CGSizeMake(200, 200);
    collectionViewLayout.minimumInteritemSpacing = 10;
    
    self.collectionView = [[UICollectionView alloc]  initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 200) collectionViewLayout:collectionViewLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[ReleaseCollectionViewCell class] forCellWithReuseIdentifier:@"release"];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDelegate/UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.model.fetchedReleaseController.fetchedObjects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    ReleaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"release" forIndexPath:indexPath];
    if(!cell)
    {
        cell = [[ReleaseCollectionViewCell alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cell.frame),
                                                                          CGRectGetMaxY(cell.frame),
                                                                          CGRectGetWidth(self.view.frame)/2,
                                                                          250)];
    }
    ReleaseManagedObject *releaseMO = [self.model.fetchedReleaseController objectAtIndexPath:indexPath];
    cell.label.text = releaseMO.name;

    return cell;
}

#pragma mark - releaseListChanged

- (void)releaseListChanged
{
    [self updateCollectionView];
}


@end
