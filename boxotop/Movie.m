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
             @"synopsis": @"synopsis",
             @"posters": @"posters"
             };
}

+ (NSValueTransformer *)postersJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[Posters class]];
}

@end
