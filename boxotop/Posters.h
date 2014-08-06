//
//  Posters.h
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Posters : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *profile;
@property (nonatomic, strong) NSString *detailed;
@property (nonatomic, strong) NSString *original;

@end
