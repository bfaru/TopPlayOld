//
//  ChannelEntry.h
//  TopPlay
//
//  Created by Bryan Garces on 8/3/14.
//  Copyright (c) 2014 Bryan Garces. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelEntry : NSObject
@property (nonatomic, strong) NSMutableArray *soccerContent;
@property (nonatomic, strong) NSMutableArray *channelTitleS;
@property (nonatomic, strong) NSMutableArray *uploedsId;

- (id)initSoccerJason:(NSArray *)array;
@end
