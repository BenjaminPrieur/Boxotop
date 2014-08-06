//
//  Poster.m
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import "Posters.h"

@implementation Posters

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"thumbnail": @"thumbnail",
             @"profile": @"profile",
             @"detailed": @"detailed",
             @"original": @"original"
             };
}

@end
