//
//  TopPlayVideoFetch.m
//  TopPlay
//
//  Created by Bryan Garces on 12/26/13.
//  Copyright (c) 2013 Bryan Garces. All rights reserved.
//

#import "TopPlayVideoFetch.h"
#import "GTLYouTubeChannelContentDetails.h"
#import "GTLYouTubePlaylistItemListResponse.h"
#import "GTLServiceYouTube.h"
#import "YouTubeService.h"
#import "GTLQueryYouTube.h"





@implementation TopPlayVideoFetch {
    
    //GTLYouTubeGuideCategoryListResponse *_categoryList;
   // GTLServiceTicket *_categoryListTicket;
   // NSError *_categoryListError;
    
    GTLYouTubeChannelContentDetailsRelatedPlaylists *_myPlayList;
    GTLServiceTicket *_channelListTicket;
    NSError *_channelListFetchError;
    
    GTLYouTubePlaylistItemListResponse *_playlistItemList;
    GTLServiceTicket *_playlistItemListTicket;
    NSError *_playlistError;
}


- (void)fetchMyChannelList:(NSMutableArray *)sports{
    _myPlayList = nil;
    _channelListFetchError = nil;
    //just checking with out the my channel list
    //put the first green thing here
    /*
     GTLServiceYouTube *service = self.youTubeService;
     service.APIKey = @"AIzaSyAffsJ1twluL4E3Ks9VW3639Af4j3LPHyc";
     GTLQueryYouTube *query = [GTLQueryYouTube queryForChannelsListWithPart:@"id, snippet, contentDetails"];
     //query.identifier = @"UCWV3obpZVGgJ3j9FVhEjF2Q";
     query.categoryId = @"GCU3BvcnRz";
     query.maxResults = 50;
     //query.pageToken = @"CDIQAA";
     //query.pageToken = @"CDIQAA";
     
     
     // maxResults specifies the number of results per page.  Since we earlier
     // specified shouldFetchNextPages=YES, all results should be fetched,
     // though specifying a larger maxResults will reduce the number of fetches
     // needed to retrieve all pages.
     // query.maxResults = 1;
     
     // We can specify the fields we want here to reduce the network
     // bandwidth and memory needed for the fetched collection.
     //
     // For example, leave query.fields as nil during development.
     // When ready to test and optimize your app, specify just the fields needed.
     // For example, this sample app might use
     //         query.fields = @"kind,etag,items(id,etag,kind,contentDetails)";
     
     // query.fields = @"items(id,snippet,etag,kind,contentDetails)";
     //self.sportsArray = [[NSMutableArray alloc] init];
     _channelListTicket = [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, GTLYouTubeChannelListResponse *channelList, NSError *error) {
     
     
     // Manually make a query to fetch the next page of results by reusing the previous query
     
     
     // Callback
     
     // The contentDetails of the response has the playlists available for
     // "my channel".
     if ([[channelList items] count] > 0) {
     GTLYouTubeChannel *channel = channelList[0];
     
     NSArray *response = [channelList JSONValueForKey:@"items"];
     
     for (NSDictionary *dic in response) {
     NSDictionary *string = dic[@"snippet"];
     NSDictionary *dic1 = dic[@"contentDetails"][@"relatedPlaylists"];
     NSString *str = dic1[@"uploads"];
     
     NSDictionary *videoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:dic[@"id"],@"channelid",string[@"title"],@"channeltitle",str,@"uploadsId", nil];
     [self.sportsArray addObject:videoDictionary];
     }
     
     [self saveSportschannels];
     
     
     // self.sportsArray = response;
     NSLog(@"COUNTSPORTS: %d", [self.sportsArray count]);
     
     NSLog(@"COUNT: %d", [response count]);
     *///put the end green thing here
    
    
    
    for (NSDictionary *dic in sports) {
        NSString *channelId = dic[@"channelid"];
        
        NSLog(@"CHANNELS LIST: %@ %@", dic[@"channeltitle"],dic[@"channelid"]);
        if ([channelId  isEqual: @"UCWV3obpZVGgJ3j9FVhEjF2Q"]|| [channelId  isEqual: @"UCkzCjdRMrW2vXLx8mvPVLdQ"] || [channelId  isEqual: @"UC14UlmYlSNiQCBe9Eookf_A"]|| [channelId  isEqual: @"UCNhxq7He5p-_FdBh0OaxcQg"]|| [channelId  isEqual: @"UC4qDTI9NzzrwgpSDbK2NoFw"]|| [channelId  isEqual: @"UCEPKlFeUjRY_1mpZP8GnkVg"]|| [channelId  isEqual: @"UC-KQIG4-dyR1kIHCQFOJ-hQ"]|| [channelId  isEqual: @"UCjVd6vTuoAYLFYvX5TSK1aA"]|| [channelId  isEqual: @"UCpcTrCXblq78GZrTUTLWeBw"]|| [channelId  isEqual: @"UCC9h3H-sGrvqd2otknZntsQ"]|| [channelId  isEqual: @"HCl96Mf_5q4ek"]|| [channelId  isEqual: @"UCU2PacFf99vhb3hNiYDmxww"]|| [channelId  isEqual: @"UCEiJdZfsDgXkWe4XGg2jqGA"]|| [channelId  isEqual: @"UCb1JlyEU7j_NrSZjShW_apw"]|| [channelId  isEqual: @"UCXnPiEv1DoUCDAqDUXT9shQ"]|| [channelId  isEqual: @"UCQsH5XtIc9hONE1BQjucM0g"]|| [channelId  isEqual: @"UCKcx1uK38H4AOkmfv4ywlrg"]|| [channelId  isEqual: @"UC45H39UhBIJNlHK1JTo7vMg"]|| [channelId  isEqual: @"UCaQHxlbPAmh7VWRudyRkwjw"]|| [channelId  isEqual: @"UCbWUEnTRHb3bRdrnovq8iuA"]|| [channelId  isEqual: @"UCTv-XvfzLX3i4IGWAm4sbmA"]|| [channelId  isEqual: @"UC9LQwHZoucFT94I2h6JOcjw"]|| [channelId  isEqual: @"UCSZbXT5TLLW_i-5W8FZpFsg"]|| [channelId  isEqual: @"UC5EKlflss5IVgIfI4-sjd9w"]|| [channelId  isEqual: @"UC0uRT_armQXqds_rjTjqJ0g"]|| [channelId  isEqual: @"HCppoNHDAYDsM"]|| [channelId  isEqual: @"HCv3YCTE958tA"]|| [channelId  isEqual: @"HCdWYHAksllbg"]  || [channelId  isEqual: @"HC__1puDlgayI"] || [channelId  isEqual: @"HCbG9qKNp_n0c"] || [channelId  isEqual: @"HCpVq5R0I6ICQ"] ){
            
            [self.soccerContent addObject:dic];
            
        }
        
    }
//debub log message  for nnumber of soccer channels retieved.
   // NSLog(@"SOCCERARRAY: %d",[self.soccerContent count]);
    
    for (NSDictionary *dic in self.soccerContent) {
        NSString *str = dic[@"uploadsId"];
//debug log message for list of channel list'IDs
        NSLog(@"STRTRTRTRTRT: %@", str);
        //_myPlayList = channel.contentDetails.relatedPlaylists;
        if (str) {
            
            self.playlistId = str;
            [self fetchMyPlaylist];
        }
        
        
    }
    //uncommebt these two when ever you want to resave the channel to the plist on device or simulator
    //  }
    // }];
    
    
    
    
    //idont need it I think
    //  GTLYouTubeChannelContentDetails *contentDetails = channel.contentDetails;
    
    // _myPlayList = channel.contentDetails.relatedPlaylists;
    
    
    
    
    
    
    //_channelListFetchError = error;
    _channelListTicket = nil;
    
    // if (_myPlayList) {
    //     //[self fetchMyPlaylist];
    // }
    
    //    }        //}];
    
    // }];
    
    
}

- (void)fetchMyPlaylist {
    
    NSString *playlistId = self.playlistId;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    
    // NSString *playlistId = _myPlayList.uploads;
    if ([playlistId length] >0) {
        //GTLServiceYouTube *service = self.youTubeService;
        GTLServiceYouTube *service = [YouTubeService youTubeSharedClient];
        
        service.APIKey = @"AIzaSyAffsJ1twluL4E3Ks9VW3639Af4j3LPHyc";
        GTLQueryYouTube *query = [GTLQueryYouTube queryForPlaylistItemsListWithPart:@"snippet, contentDetails"];
        query.playlistId = self.playlistId;
        query.maxResults = 5;
        //query.pageToken = @"CAUQAQ";
        
        
        _playlistItemListTicket = [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, GTLYouTubePlaylistItemListResponse * playlistItemList, NSError *error ){
            
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            _playlistItemList = playlistItemList;
            _playlistError = error;
            _playlistItemListTicket  = nil;
            if (error == nil) {
                
                
                // _playlistItemListTicket.retryBlock = nil;
                //_playlistItemListTicket.uploadProgressBlock = nil;
                
                //creating an array for the table's content
                //NSDictionary *jSon = _playlistItemList;
                
                // self.content= _playlistItemList.items;
                NSArray *array = [_playlistItemList JSONValueForKey:@"items"];
                for (NSDictionary *dic in array) {
                    //if ([self.videosArray count]< 100) {
                    [self.videosArray addObject:dic];
                    
                    //  }
                    
                }
                //[self.tableView reloadData];
                
                // self.content= [_playlistItemList JSONValueForKey:@"items"];
                //[self.tableView reloadData];
                /// self.content =dictionary[@"items"];              // GTLYouTubePlaylistItem *anotherItem
                
                
                //where i was checking all the responses
                /*for (GTLYouTubePlaylistItem *item in _playlistItemList.items) {
                 //for (GTLYouTubePlaylistItem *object in item) {
                 
                 
                 NSMutableDictionary *dictionary = [item JSONValueForKey:@"contentDetails"];
                 NSMutableDictionary *snippetDictionary = [item JSONValueForKey:@"snippet"];
                 NSDictionary *thumbnsilDic = snippetDictionary[@"thumbnails"];
                 //NSMutableDictionary *snipetDictionary = [item JSONValueForKey:@"snippet"];
                 // GTLYouTubePlaylistItemSnippet *snippet = [item JSONValueForKey:@"snippet"];
                 //  [self.titleArray addObject:item.snippet.title];
                 //  NSString *realTitle = [self.titleArray objectAtIndex:0];
                 NSString *string = snippetDictionary[@"title"];
                 //[self.titleArray addObject:string ];
                 
                 
                 // GTLYouTubeThumbnailDetails *thumbails = item.snippet[{@"
                 NSLog(@"snippet: %@", item.snippet);
                 NSLog(@"REALTITLE: %@", item.snippet.title);
                 NSLog(@"realthumbnail: %@ ",thumbnsilDic[@"high"][@"url"]);
                 NSLog(@"realthumbnail: %@",snippetDictionary[@"channelTitle"]);
                 
                 self.videoTilte = [dictionary objectForKey:@"videoId"];
                 NSLog(@"contentDetails: %@", self.videoTilte);
                 //NSLog(@"titlearray: %@", self.titleArray);
                 }*/
                
                // GTLYouTubePlaylistItemSnippet *itemSnippet = item.snippet;
                // GTLYouTubeVideoContentDetails *contentDetails = item.contentDetails;
                // NSString *videoId = nil;
                //videoId =  contentDetails.videoId;
                //GTLYouTubeResourceId *resourceId = itemSnippet.resourceId;
                // }
            }else {
                NSLog(@"error: %@", error.description);
            }
        }];
        
    }
    
}



@end
