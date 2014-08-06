//
//  WebServiceManager.h
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WEBSERVICE_ACTIVITY_DID_STOP @"WEBSERVICE_ACTIVITY_DID_STOP"

@interface WebServiceManager : NSObject

@property (assign) NSString *error_message;


+ (WebServiceManager*)sharedManager;


- (void)getBoxOfficeWithCompletionBlock:(void (^)(NSDictionary *response))completion andFailureBlock:(void (^)(NSError *error))failure;


@end
