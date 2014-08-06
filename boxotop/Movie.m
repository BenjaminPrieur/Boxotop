//
//  Movie.m
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import "Movie.h"

@implementation Movie

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"identifier": @"id",
             @"titleMovie": @"title",
             @"year": @"year",
             @"synopsis": @"synopsis"
             };
}

@end
