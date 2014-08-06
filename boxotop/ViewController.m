//
//  ViewController.m
//  boxotop
//
//  Created by benjamin prieur on 29/07/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import "ViewController.h"
#import "MovieTableViewCell.h"
#import "HomeViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import "UIImageView+LBBlurredImage.h"

@interface ViewController ()

@property (nonatomic, strong) HomeViewModel *viewModel;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.viewModel = [[HomeViewModel alloc] init];
    [self setupObservers];
    
    [self.imageViewBG setImageToBlur:[UIImage imageNamed:@"DefaultBG"]
                        blurRadius:kLBBlurredImageDefaultBlurRadius
                   completionBlock:^(){
                       BPLog(@"The blurred image has been set");
                   }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self reloadMovies];
}

- (void)setupObservers
{
    [[RACObserve(self.viewModel, movies)
     deliverOn:RACScheduler.mainThreadScheduler]
     subscribeNext:^(NSArray *newMovies) {
        [self.tableView reloadData];
    }];
}

- (void)reloadMovies
{
    [_viewModel updateMovies];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actoin_reloadMovies:(id)sender
{
    [self reloadMovies];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_viewModel.movies count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell = (MovieTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.lblTitle setText:[[_viewModel.movies objectAtIndex:indexPath.row] titleMovie]];
    [cell.imageViewThumbnail sd_setImageWithURL:nil placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    return cell;
}

@end
