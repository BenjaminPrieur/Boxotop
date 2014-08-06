//
//  BPLog.m
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import "BPLog.h"

static BOOL __BPLogOn;

@implementation BPLog

+(void)initialize
{
    char * env=getenv("BPLog");
    
#ifdef DEBUG
    
    if(strcmp(env==NULL?"":env,"NO")!=0)
        __BPLogOn=YES;
#else
    __SPLogOn=NO;
#endif
}

+(void)logFile:(char*)sourceFile lineNumber:(int)lineNumber
        format:(NSString*)format, ...;
{
    if(__BPLogOn==NO)
        return;
    
    va_list ap;
    NSString *print,*file;
    
    va_start(ap,format);
    file=[[NSString alloc] initWithBytes:sourceFile
                                  length:strlen(sourceFile)
                                encoding:NSUTF8StringEncoding];
    print=[[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    //NSLog handles synchronization issues
    NSLog(@"%s:%d %@",[[file lastPathComponent] UTF8String],
          lineNumber,print);
    
    return;
}

+(void)setLogOn:(BOOL)logOn
{
    __BPLogOn=logOn;
}


@end
