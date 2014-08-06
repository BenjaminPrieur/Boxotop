//
//  MovieTableViewCell.h
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *lblTitle;
@property (nonatomic, strong) IBOutlet UIImageView *imageViewThumbnail;

@end
