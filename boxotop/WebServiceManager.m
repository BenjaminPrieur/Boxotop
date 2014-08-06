//
//  WebServiceManager.m
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import "WebServiceManager.h"
#import <AFNetworking/AFNetworking.h>
#import "AppDelegate.h"

@interface WebServiceManager ()

@property (nonatomic) BOOL resquestRunning;
@property (nonatomic,strong) NSString *serverDate;
@property (nonatomic,strong) NSMutableArray *requestQueue;
@property (nonatomic,strong) NSMutableArray *completionQueue;

@property (strong, nonatomic) NSString *host;

@property (nonatomic, copy) void (^uiSuccessBlock)();
@property (nonatomic, copy) void (^uiFailedBlock)();
@property (nonatomic, copy) void (^wsCompletionBlock)(void);

@property dispatch_queue_t backgroundQueue;


@end


#define HOST @"http://xebiamobiletest.herokuapp.com/"

#define GET_BOXOFFICE @"api/public/v1.0/lists/movies/box_office.json"


@implementation WebServiceManager

+ (WebServiceManager*)sharedManager
{
	static dispatch_once_t		onceQueue;
	static WebServiceManager    *manager = nil;
    
	dispatch_once(&onceQueue, ^{
        manager = [[self alloc] init];
    });
	return manager;
}

- (id)init
{
	self = [super init];
	if (self) {
        self.host = HOST;
        self.requestQueue = [NSMutableArray new];
        self.completionQueue = [NSMutableArray new];
        _backgroundQueue = dispatch_queue_create("com.camaieu.backgroundQueue", NULL);
	}
    
	return self;
}

#pragma mark - WS MANAGEMENT

- (BOOL)getActivity {
    return self.resquestRunning;
}

- (void)startRequestWith:(NSMutableURLRequest*)request withCompletionBlock:(void (^)(void))completion {
    
    if(![AppDelegate isConnected]){
        if(self.uiFailedBlock)
            self.uiFailedBlock([NSError errorWithDomain:@"NO INTERNET" code:1001 userInfo:nil]);
        
        return;
    }
    
    if(self.resquestRunning){
        BPLog(@"add resquet to queue %@",request.URL);
        [self.requestQueue addObject:request];
        [self.completionQueue addObject:completion];
        return;
    }
    
    BPLog(@"start request %@",request.URL);
    
    self.resquestRunning = YES;
    
    self.wsCompletionBlock = completion;
    
    self.error_message = nil;
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.securityPolicy.allowInvalidCertificates = YES;
    operation.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        BPLog(@"response = %ld", (long)operation.response.statusCode);
        BPLog(@"allHeaderFields %@", [operation.response allHeaderFields]);
        //        SPLog(@"JSON %@", responseObject);
        
        if( responseObject != nil) {

            if(self.wsCompletionBlock)
                self.wsCompletionBlock();
            
            if(self.uiSuccessBlock)
                self.uiSuccessBlock(responseObject);
        }
        
        [self getNextObjectInQueue];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
//        BPLog(@"%@", [error localizedDescription]);
        
        if(self.uiFailedBlock)
            self.uiFailedBlock(error);
        
        [self getNextObjectInQueue];
    }];
    
    
    [operation setCacheResponseBlock:^NSCachedURLResponse *(NSURLConnection *connection, NSCachedURLResponse *cachedResponse) {
        return nil;
    }];
    [operation start];
}

- (void)getNextObjectInQueue{
    if(self.requestQueue.count!=0){
        
        self.resquestRunning = NO;
        [self startRequestWith:[self.requestQueue objectAtIndex:0]  withCompletionBlock:[self.completionQueue objectAtIndex:0]];
        
        [self.requestQueue removeObjectAtIndex:0];
        [self.completionQueue removeObjectAtIndex:0];
        
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:WEBSERVICE_ACTIVITY_DID_STOP object:nil];
        self.resquestRunning = NO;
    }
}

- (NSString *)urlStringWithPath:(NSString *)path {
    
    return [self.host stringByAppendingString:path];
}


#pragma mark - API
#pragma mark - BoxOffice

- (void)getBoxOfficeWithCompletionBlock:(void (^)(NSDictionary *response))completion andFailureBlock:(void (^)(NSError *error))failure
{
    self.uiSuccessBlock = completion;
    self.uiFailedBlock = failure;
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET"
                                                                                 URLString:[self urlStringWithPath:GET_BOXOFFICE]
                                                                                parameters:nil
                                                                                     error:nil];
    BPLog(@"url : %@", [request.URL absoluteString]);
    [self startRequestWith:request withCompletionBlock:^(void){
    }];
}

@end
