//
//  TopPlayVideoFetch.h
//  TopPlay
//
//  Created by Bryan Garces on 12/26/13.
//  Copyright (c) 2013 Bryan Garces. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopPlayVideoFetch : NSObject

//@property (nonatomic, readonly) GTLServiceYouTube *youTubeService;

@property (nonatomic) NSMutableArray  *soccerContent;
@property (nonatomic) NSMutableArray *sportsArray;
@property (nonatomic) NSMutableArray *videosArray;
@property (nonatomic) NSString *playlistId;

@end
