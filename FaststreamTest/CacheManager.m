//
//  CacheManager.m
//  FaststreamTest
//
//  Created by Dev009 on 1/12/15.
//  Copyright (c) 2015 Dev009. All rights reserved.
//

#import "CacheManager.h"

#define SERVER_URL @"http://192.254.141.167/~fstech/pic.php"


@implementation CacheManager

-(id) init
{
    if (self == [super init]) {
        
    }
    return self;
}

+(CacheManager*) sharedInstanced {
    
    static CacheManager* sharedObj = nil;
//    if (sharedObj == nil) {
//        sharedObj = [[CacheManager alloc] init];
//    }
//    return sharedObj;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObj = [[CacheManager alloc] init];
    });
    return sharedObj;
}

-(void) loadServerData
{
    NSString* urlString = SERVER_URL;
    NSURL* url = [NSURL fileURLWithPath:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];

//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        
//        if (connectionError == nil) {
//            NSError* error;
//            self.dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//            NSLog(@"%@", [self.dict description]);
//        }
//        
//    }];
    
//    NSError* error;
//    NSURLResponse* response;
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    
//    if (error == nil) {
//        NSError* error1;
//        self.dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error1];
//        NSLog(@"%@", [self.dict description]);
//    }
    
    
    
}

@end
