//
//  TopPlayTableViewController.m
//  TopPlay
//
//  Created by Bryan Garces on 10/13/13.
//  Copyright (c) 2013 Bryan Garces. All rights reserved.
//

#import "TopPlayTableViewController.h"
#import "GTLServiceYouTube.h"
#import "GTLService.h"
#import "GTLQueryYouTube.h"
#import "GTLYouTubeVideo.h"
#import "GTLQuery.h"
#import "GTLYouTubeChannel.h"
#import "GTLYouTubeSearchResult.h"
#import "GTLYouTubeSearchListResponse.h"
#import "GTLYouTubeChannelListResponse.h"
#import "GTLYouTubeChannelContentDetails.h"
#import "GTLYouTubePlaylistItemListResponse.h"
#import "GTLYouTubePlaylistItem.h"
#import "GTLYouTubeResourceId.h"
#import "GTLYouTubeThumbnailDetails.h"
#import "GTLYouTubePlaylistItemSnippet.h"
#import "VideoCell.h"
#import "GTLYouTubeGuideCategoryListResponse.h"
#import "GTLYouTubeGuideCategorySnippet.h"
#import "GTLYouTubeGuideCategory.h"
#import "UIViewController+ECSlidingViewController.h"
#import "YouTubeService.h"
#import "TopPlayAppDelegate.h"





@interface TopPlayTableViewController ()
@property (nonatomic, readonly) GTLServiceYouTube *youTubeService;
@property (nonatomic) NSArray *content;
@property (nonatomic) NSMutableArray  *soccerContent;
@property (nonatomic, strong) NSMutableArray *sportsArray;
@property (nonatomic) NSMutableArray *videosArray;
@property (nonatomic) NSString *playlistId;
//@property (nonatomic) NSArray *imageArray;
//@property (nonatomic) NSMutableArray *titleArray;
@property (nonatomic) NSString *videoTilte;
//@property (nonatomic, strong) UIPanGestureRecognizer *dynamicTransitionPanGesture;

@end

@implementation TopPlayTableViewController {
    
    GTLYouTubeGuideCategoryListResponse *_categoryList;
    GTLServiceTicket *_categoryListTicket;
    NSError *_categoryListError;
    
    GTLYouTubeChannelContentDetailsRelatedPlaylists *_myPlayList;
    GTLServiceTicket *_channelListTicket;
    NSError *_channelListFetchError;
    
    GTLYouTubePlaylistItemListResponse *_playlistItemList;
    GTLServiceTicket *_playlistItemListTicket;
    NSError *_playlistError;
}

- (void)loadChannels {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SportsChannelList" ofType:@"plist"];
  //  self.sportsArray = [NSArray arrayWithContentsOfFile:path];
    
}

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
       // self.sportsArray = [[NSMutableArray alloc] init];
       // [self loadSportsChannel];
        
    }
    return self;
}

- (void)loadSportsChannel
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
      // self.sportsArray = [unarchiver decodeObjectForKey:@"SportsChannel"];
        [unarchiver finishDecoding];
        
    } else {
    //    self.sportsArray = [[NSMutableArray alloc]init];
    }
}

- (NSString *)dataFilePath
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SportsChannelList" ofType:@"plist"];
    return path;
    //For getting the files's path stored in the documents directory not the resources folder.
   // return [[self documentsDirectory] stringByAppendingPathComponent:@"SportsChannelList.plist"];
}
- (void)saveSportschannels
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc ] initForWritingWithMutableData:data];
   // [archiver encodeObject:self.sportsArray forKey:@"SportsChannel"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically: YES];
}
#pragma mark -

// Get a service object with the current username/password.
//
// A "service" object handles networking tasks.  Service objects
// contain user authentication information as well as networking
// state information such as cookies set by the server in response
// to queries.

/*- (GTLServiceYouTube *)youTubeService {
    static GTLServiceYouTube *service;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[GTLServiceYouTube alloc] init];
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
}*/

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UITableView *view = (UITableView *)self.view;

    [view reloadData];
}*/

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
    //[self fetchCategory];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self fetchMyChannelList];

    });
    
  //  [self.tableView reloadData];



}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    
   // [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    //[self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
    if (self.navigationController.title) {
        self.title = self.navigationController.title;

    } else {
        self.title = @"Front";

    }
    
    // configure top view controller
        //Documets directory an file paths
    NSLog(@"Documents folder is : %@", [self documentsDirectory]);
    NSLog(@"Data file path is : %@", [self dataFilePath]);
    
    
    self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    self.slidingViewController.customAnchoredGestures = @[];
    //[self.navigationController.view removeGestureRecognizer:self.dynamicTransitionPanGesture];
    [self.navigationController.view removeGestureRecognizer:self.slidingViewController.panGesture];
    [self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
    //[self fetchMyChannelList];
    
    
   // GTLQueryYouTube *query = [GTLQueryYouTube queryForSearchListWithPart:@"snippet, id"];
    //query.q = @"realmadridcf";
   //query.type = @"channel";
  //  query.forUsername = @"realmadridcf";
  //  query.part = @"contentDetails";
   // query.channelId = @"UCzxQ3Fx5K8VehnAdjY_FSlg";
   // query.maxResults = 1;
   // GTLServiceTicket *ticket = [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
       // if (error == nil) {
         //   GTLYouTubeChannelListResponse *products = object;
           //// for (id item in products.items) {
               // GTLYouTubeChannel *result = item;

               
              //  GTLYouTubeChannelContentDetails *contentDetails = result.contentDetails;
             //   NSLog(@"Identifier:%@",result.contentDetails.relatedPlaylists.uploads);
              //  NSLog(@"Identifier :%@",result.contentDetails);
               // GTLYouTube* resourceId = result.identifier;

              // GTLYouTubeResourceId* resourceId = result.identifier;
            //  NSLog(@"kind:%@",resourceId.kind);
           // NSLog(@"channel:%@",resourceId.snippet.channelId);
          //  }
       // }else{
       //     NSLog(@"Error: %@", error.description);
}//UCWV3obpZVGgJ3j9FVhEjF2Q
   // }];


#pragma mark - Fetch Playlist
/*- (void)fetchCategory {
    _categoryList = nil;
    _categoryListError = nil;
    //GTLServiceYouTube *service = self.youTubeService;
    GTLServiceYouTube *service = [YouTubeService youTubeSharedClient];
    service.APIKey = @"AIzaSyAffsJ1twluL4E3Ks9VW3639Af4j3LPHyc";
    GTLQueryYouTube *query = [GTLQueryYouTube   queryForGuideCategoriesListWithPart:@"snippet"];
    query.regionCode = @"US";
    _categoryListTicket = [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, GTLYouTubeGuideCategoryListResponse *categoryList, NSError *error){
        _categoryList = categoryList;
        _categoryListError = error;
        _categoryListTicket = nil;
        
        if (error == nil) {
            NSArray *response = [_categoryList JSONValueForKey:@"items"];
            
            for (NSDictionary *dic in response)
            {
            
                NSDictionary *list = dic[@"snippet"];
           
               NSLog(@"CATEGORY LIST: %@ %@", list[@"title"],dic[@"id"]);
                
            }
            
            
        }
        else{
            NSLog(@"there was enerror, %@",error.description);
        }

    }];
                           }*/

 - (void)fetchMyChannelList {
    _myPlayList = nil;
    _channelListFetchError = nil;
//just checking with out the my channel list
/*//put the first green thing here

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
 
            //_channelListFetchError = error;
            //_channelListTicket = nil;
 
        
            // Manually make a query to fetch the next page of results by reusing the previous query
            
        
        // Callback
        
        // The contentDetails of the response has the playlists available for
        // "my channel".
        if ([[channelList items] count] > 0) {
            //GTLYouTubeChannel *channel = channelList[0];
           
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
     
     
     TopPlayAppDelegate *appDelegate = (TopPlayAppDelegate *)[[UIApplication sharedApplication] delegate];
     self.sportsArray = appDelegate.channels;
     for (NSDictionary *dic in self.sportsArray) {
         NSString *channelTitle = dic[@"channeltitle"];
         if ([channelTitle isEqualToString:self.navigationController.title]) {
             self.playlistId = dic[@"uploadsId"];
             break;
         } else {
             self.playlistId = @"UUQsH5XtIc9hONE1BQjucM0g";
         }
     }
                      //      self.playlistId = str;
                            [self fetchMyPlaylist];
     
     
     
            /*NSLog(@"SOCCERARRAY: %d",[self.soccerContent count]);
                
                
            self.videosArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in self.soccerContent) {
                NSString *str = dic[@"uploadsId"];
                NSLog(@"STRTRTRTRTRT: %@", str);
                //_myPlayList = channel.contentDetails.relatedPlaylists;
                if (str) {
                    
                    self.playlistId = str;
                    [self fetchMyPlaylist];

                }
                
            
            }*/
    //uncommebt these two when ever you want to resave the channel to the plist on device or simulator
    //    }
    //    }];
        
                
                        

        //idont need it I think
          //  GTLYouTubeChannelContentDetails *contentDetails = channel.contentDetails;

                    // _myPlayList = channel.contentDetails.relatedPlaylists;
        
        
        



        //_channelListFetchError = error;
        //_channelListTicket = nil;

       // if (_myPlayList) {
       //     //[self fetchMyPlaylist];
       // }
        
    //    }        //}];
        
   // }];

        
    }

- (void)fetchEntries
{
    // NSString *playlistId = _myPlayList.uploads;
    if ([self.playlistId length] >0) {
        //GTLServiceYouTube *service = self.youTubeService;
        GTLServiceYouTube *service = [YouTubeService youTubeSharedClient];
        
        service.APIKey = @"AIzaSyAffsJ1twluL4E3Ks9VW3639Af4j3LPHyc";
        GTLQueryYouTube *query = [GTLQueryYouTube queryForPlaylistItemsListWithPart:@"snippet, contentDetails"];
        query.playlistId = self.playlistId;
        query.maxResults = 50;
        
        
        //query.pageToken = @"CAUQAQ";
        
        _playlistItemListTicket = [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, GTLYouTubePlaylistItemListResponse * playlistItemList, NSError *error ){
            
            //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
            _playlistItemList = playlistItemList;
            _playlistError = error;
            _playlistItemListTicket  = nil;
            if (error == nil) {
                
                
                // _playlistItemListTicket.retryBlock = nil;
                //_playlistItemListTicket.uploadProgressBlock = nil;
                
                //creating an array for the table's content
                //NSDictionary *jSon = _playlistItemList;
                
                // self.content= _playlistItemList.items;
                
                self.videosArray = [[NSMutableArray alloc] init];
                NSArray *array = [_playlistItemList JSONValueForKey:@"items"];
                for (NSDictionary *dic in array) {
                    //if ([self.videosArray count]< 100) {
                    [self.videosArray addObject:dic];
                    
                    
                    //  }
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
                
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
                //dispatch's closing brases
            }else {
                NSLog(@"error: %@", error.description);
            }
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        }];
        
    }
}

- (void)fetchMyPlaylist
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    
    //dispatch_async(dispatch_get_main_queue(), ^{
        [self fetchEntries];
    //});
    
}
    
    /* // Create a service object for executing queries
    GTLServiceYouTube *service = [[GTLServiceYouTube alloc] init];
    // Services which do not require sign-in may need an API key from the
    // API Console
    service.APIKey = @"AIzaSyAffsJ1twluL4E3Ks9VW3639Af4j3LPHyc";
    // Create a query
    GTLQueryYouTube *query = [GTLQueryYouTube queryForSearchListWithPart:@"video"];
    query.type = @"video" ;
    query.q = @"hiking boots";
    //query.country = @"US";
    // Execute the query
    gtl[service executeQuery:query
                                   completionHandler:^(GTLServiceTicket *ticket, GTLYouTubeVideo *object, NSError *error) {
                                       // This callback block is run when the fetch completes
                                       if (error == nil) {
                                           //I'VE NEVER GOTTEN TO HERE, I ALWAYS GET AN ERROR
                                           NSLog(@"VIDEO: %@", object.snippet);
                                           
                                       }
                                   else{
                                       NSLog(@"Error: %@", error.description);
                                   }
                                
                                }];

    
    //I dont think I need it
    /*if (!tableData) {
        tableData = [[NSMutableArray alloc] init];
    }*/
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // eson call
   /* NSError *error;
    NSURL *url = [NSURL URLWithString:@"http://api.espn.com/v1/now/?leagues=soccer&apikey=wdmmrwzgfhxn9prn9eqmtbxc"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (response) {
        tableData = response[@"feed"];
    } else {
        NSLog(@"error: %@", error);
    }*/
   
    //nick's way
   /* NSLog(@"%@", dictionary);
    

    for (NSDictionary *dic in [dictionary objectForKey:@"sports"]) {
        if ([dic objectForKey:@"sports"]) {
            for (NSDictionary *sportsData in dictionary) {
                NSLog(@"%@", sportsData);
            }
        }
    }
    */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.videosArray count];
   // return [self.content count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"videoCell";
    VideoCell *cell = (VideoCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //if (cell == nil) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
       // NSDictionary *dic = [self.content objectAtIndex: indexPath.row];
        
           // GTLYouTubePlaylistItemSnippet *recordSnippet = item.snippet;
        //cell.textLabel.text = [NSString stringWithFormat:@"hola" ];
        //NSLog(@"STRING: %@", strng);
       //    }
    // Configure the cell...
    //GTLYouTubePlaylistItem  *item = self.content[indexPath.row];
    //NSString *title = [self.titleArray objectAtIndex:indexPath.row];
    //NSDictionary *dic2 = [  JSONValueForKey:@"snippet"];
   // NSString *string = [dic2 objectForKey:@"title"];
   // NSString *strng = item.snippet.title;
  //  //NSLog(@"STRING: %@", strng);
    
        
    NSDictionary *dic = [self.videosArray objectAtIndex:indexPath.row];

    //NSDictionary *dic = [self.content objectAtIndex:indexPath.row];
   // NSDictionary *dic1 = dic[@"snippet"];
   [cell setupWithDictionary:dic[@"snippet"]];
    //cell.videoTitle.text = dic1[@"title"];
    
 
    
    return cell;
}

- (void)clearResults {
    self.videosArray = nil;
    
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */
- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (IBAction)favoriteMenuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToLeftAnimated:YES];
}



@end
