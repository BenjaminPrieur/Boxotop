//
//  BPLog.h
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BPLog(s,...) \
[BPLog logFile:__FILE__ lineNumber:__LINE__ \
format:(s),##__VA_ARGS__]

@interface BPLog : NSObject

+(void)logFile:(char*)sourceFile lineNumber:(int)lineNumber
		format:(NSString*)format, ...;
+(void)setLogOn:(BOOL)logOn;

@end
