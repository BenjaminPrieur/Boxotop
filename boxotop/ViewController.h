//
//  ViewController.h
//  boxotop
//
//  Created by benjamin prieur on 29/07/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIImageView *imageViewBG;
@property (nonatomic, strong) IBOutlet UILabel *lblTitle;
@property (nonatomic, strong) IBOutlet UIButton *btnReload;

@end

