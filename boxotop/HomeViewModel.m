//
//  HomeViewModel.m
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import "HomeViewModel.h"
#import "WebServiceManager.h"

@implementation HomeViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _movies = [[NSArray alloc] init];
    }
    return self;
}

- (void)updateMovies
{
    BPLog(@"update movies");
    [[WebServiceManager sharedManager] getBoxOfficeWithCompletionBlock:^(NSDictionary *response) {
        
        self.movies = [MTLJSONAdapter modelsOfClass:[Movie class]
                                  fromJSONArray:[response objectForKey:@"movies"]
                                          error:nil];
        
    } andFailureBlock:^(NSError *error) {
        
        if (error.code == 1001)
        {
            sleep(2);
            [self updateMovies];
        }
        else
        {
            BPLog(@"%@", error.description);
        }
        
    }];
}

@end
