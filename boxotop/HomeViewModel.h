//
//  HomeViewModel.h
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa/ReactiveCocoa.h>

#import "Movie.h"

@interface HomeViewModel : NSObject

@property (nonatomic, strong) NSArray *movies;

- (void)updateMovies;

@end
