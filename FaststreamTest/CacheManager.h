//
//  CacheManager.h
//  FaststreamTest
//
//  Created by Dev009 on 1/12/15.
//  Copyright (c) 2015 Dev009. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject {
    
}

@property (strong, nonatomic) NSDictionary* dict;

+(CacheManager*) sharedInstanced;
-(void) loadServerData;


@end
