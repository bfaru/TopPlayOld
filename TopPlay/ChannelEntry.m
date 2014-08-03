//
//  ChannelEntry.m
//  TopPlay
//
//  Created by Bryan Garces on 8/3/14.
//  Copyright (c) 2014 Bryan Garces. All rights reserved.
//

#import "ChannelEntry.h"

@implementation ChannelEntry

- (id)initSoccerJason:(NSArray *)array{
    self = [self init];
    if (self){
        self.soccerContent = [[NSMutableArray alloc] init];
        self.uploedsId = [[NSMutableArray alloc] init];
        self.channelTitleS = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in array) {
         NSString *channelId = dic[@"channelid"];
            if ([channelId  isEqual: @"UCWV3obpZVGgJ3j9FVhEjF2Q"]|| [channelId  isEqual: @"UCkzCjdRMrW2vXLx8mvPVLdQ"] || [channelId  isEqual: @"UC14UlmYlSNiQCBe9Eookf_A"]|| [channelId  isEqual: @"UCNhxq7He5p-_FdBh0OaxcQg"]|| [channelId  isEqual: @"UC4qDTI9NzzrwgpSDbK2NoFw"]|| [channelId  isEqual: @"UCEPKlFeUjRY_1mpZP8GnkVg"]|| [channelId  isEqual: @"UC-KQIG4-dyR1kIHCQFOJ-hQ"]|| [channelId  isEqual: @"UCjVd6vTuoAYLFYvX5TSK1aA"]|| [channelId  isEqual: @"UCpcTrCXblq78GZrTUTLWeBw"]|| [channelId  isEqual: @"UCC9h3H-sGrvqd2otknZntsQ"]|| [channelId  isEqual: @"HCl96Mf_5q4ek"]|| [channelId  isEqual: @"UCU2PacFf99vhb3hNiYDmxww"]|| [channelId  isEqual: @"UCEiJdZfsDgXkWe4XGg2jqGA"]|| [channelId  isEqual: @"UCb1JlyEU7j_NrSZjShW_apw"]|| [channelId  isEqual: @"UCXnPiEv1DoUCDAqDUXT9shQ"]|| [channelId  isEqual: @"UCQsH5XtIc9hONE1BQjucM0g"]|| [channelId  isEqual: @"UCKcx1uK38H4AOkmfv4ywlrg"]|| [channelId  isEqual: @"UC45H39UhBIJNlHK1JTo7vMg"]|| [channelId  isEqual: @"UCaQHxlbPAmh7VWRudyRkwjw"]|| [channelId  isEqual: @"UCbWUEnTRHb3bRdrnovq8iuA"]|| [channelId  isEqual: @"UCTv-XvfzLX3i4IGWAm4sbmA"]|| [channelId  isEqual: @"UC9LQwHZoucFT94I2h6JOcjw"]|| [channelId  isEqual: @"UCSZbXT5TLLW_i-5W8FZpFsg"]|| [channelId  isEqual: @"UC5EKlflss5IVgIfI4-sjd9w"]|| [channelId  isEqual: @"UC0uRT_armQXqds_rjTjqJ0g"]|| [channelId  isEqual: @"HCppoNHDAYDsM"]|| [channelId  isEqual: @"HCv3YCTE958tA"]|| [channelId  isEqual: @"HCdWYHAksllbg"]  || [channelId  isEqual: @"HC__1puDlgayI"] || [channelId  isEqual: @"HCbG9qKNp_n0c"] || [channelId  isEqual: @"HCpVq5R0I6ICQ"] ){
        
    
        
        
                [self.soccerContent addObject:dic];
                NSString *str = dic[@"channelTitle"];
                [self.channelTitleS addObject:str];
                [self.soccerContent addObject:channelId];
        //[self.channelTitleS addObject:<#(id)#>]
            //(@"CHANNELS LIST: %@ %@", dic[@"channeltitle"],dic[@"channelid"])
            
        
            }
        }
    }
    
    return self;

}



@end
