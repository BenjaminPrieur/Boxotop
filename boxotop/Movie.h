//
//  Movie.h
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface Movie : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *titleMovie;
@property (nonatomic, strong) NSNumber *year;
@property (nonatomic, strong) NSString *synopsis;

@end
