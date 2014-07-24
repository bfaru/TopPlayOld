//
//  YouTubeService.m
//  TopPlay
//
//  Created by Bryan Garces on 12/20/13.
//  Copyright (c) 2013 Bryan Garces. All rights reserved.
//

#import "YouTubeService.h"

@implementation YouTubeService

+ (YouTubeService *)youTubeSharedClient {
    
    static YouTubeService *service;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[YouTubeService alloc] init];
        //service.fetcherService = YES;
        
        // Have the service object set tickets to fetch consecutive pages
        // of the feed so we do not need to manually fetch them.
        service.shouldFetchNextPages = NO;
        
        
        // Have the service object set tickets to retry temporary error conditions
        // automatically.
        service.retryEnabled = YES;
        //NSURLSessionConfiguration *config = [[NSURLSessionConfiguration alloc] init];
        // [config setHTTPAdditionalHeaders:@{@"User- Agent": @"TopPlay iOS 1.0"}];
        // NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024 //diskCapacity:50 * 1024 * 1024 diskPath:nil];
        //[config setURLCache:cache];
        // service.additionalHTTPHeaders = config;
        
        
        
        
    });
    return service;

}




@end
