//
//  TopPlayMenuViewController.m
//  TopPlay
//
//  Created by Bryan Garces on 11/23/13.
//  Copyright (c) 2013 Bryan Garces. All rights reserved.
//

#import "TopPlayMenuViewController.h"
#import "ECSlidingSegue.h"
#import "UIViewController+ECSlidingViewController.h"
#import "TopPlayTableViewController.h"
#import "TopPlayAppDelegate.h"
#import "ChannelEntry.h"

@interface TopPlayMenuViewController ()
@property (strong, nonatomic)NSArray* menu;
@property (strong, nonatomic)NSMutableArray *section1;
@property (strong, nonatomic)NSMutableArray *sportsArray;
@property (strong, nonatomic)NSMutableArray *channelTitle;

@property (strong, nonatomic)NSMutableArray *soccerContent;

@property (strong, nonatomic)NSArray* section2;
@property (nonatomic, strong)UINavigationController *mainViewController;

@end

@implementation TopPlayMenuViewController
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    TopPlayAppDelegate *appDelegate = (TopPlayAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.sportsArray = appDelegate.channels;
    self.channelTitle = [[NSMutableArray alloc] init];
    self.soccerContent = [[NSMutableArray alloc] init];

    for (NSDictionary *dic in self.sportsArray) {
        NSString *channelId = dic[@"channelid"];
        if ([channelId  isEqual: @"UCWV3obpZVGgJ3j9FVhEjF2Q"]|| [channelId  isEqual: @"UCkzCjdRMrW2vXLx8mvPVLdQ"] || [channelId  isEqual: @"UC14UlmYlSNiQCBe9Eookf_A"]|| [channelId  isEqual: @"UCNhxq7He5p-_FdBh0OaxcQg"]|| [channelId  isEqual: @"UC4qDTI9NzzrwgpSDbK2NoFw"]|| [channelId  isEqual: @"UCEPKlFeUjRY_1mpZP8GnkVg"]|| [channelId  isEqual: @"UC-KQIG4-dyR1kIHCQFOJ-hQ"]|| [channelId  isEqual: @"UCjVd6vTuoAYLFYvX5TSK1aA"]|| [channelId  isEqual: @"UCpcTrCXblq78GZrTUTLWeBw"]|| [channelId  isEqual: @"UCC9h3H-sGrvqd2otknZntsQ"]|| [channelId  isEqual: @"HCl96Mf_5q4ek"]|| [channelId  isEqual: @"UCU2PacFf99vhb3hNiYDmxww"]|| [channelId  isEqual: @"UCEiJdZfsDgXkWe4XGg2jqGA"]|| [channelId  isEqual: @"UCb1JlyEU7j_NrSZjShW_apw"]|| [channelId  isEqual: @"UCXnPiEv1DoUCDAqDUXT9shQ"]|| [channelId  isEqual: @"UCQsH5XtIc9hONE1BQjucM0g"]|| [channelId  isEqual: @"UCKcx1uK38H4AOkmfv4ywlrg"]|| [channelId  isEqual: @"UC45H39UhBIJNlHK1JTo7vMg"]|| [channelId  isEqual: @"UCaQHxlbPAmh7VWRudyRkwjw"]|| [channelId  isEqual: @"UCbWUEnTRHb3bRdrnovq8iuA"]|| [channelId  isEqual: @"UCTv-XvfzLX3i4IGWAm4sbmA"]|| [channelId  isEqual: @"UC9LQwHZoucFT94I2h6JOcjw"]|| [channelId  isEqual: @"UCSZbXT5TLLW_i-5W8FZpFsg"]|| [channelId  isEqual: @"UC5EKlflss5IVgIfI4-sjd9w"]|| [channelId  isEqual: @"UC0uRT_armQXqds_rjTjqJ0g"]|| [channelId  isEqual: @"HCppoNHDAYDsM"]|| [channelId  isEqual: @"HCv3YCTE958tA"]|| [channelId  isEqual: @"HCdWYHAksllbg"]  || [channelId  isEqual: @"HC__1puDlgayI"] || [channelId  isEqual: @"HCbG9qKNp_n0c"] || [channelId  isEqual: @"HCpVq5R0I6ICQ"] ){
            
            
            
            
            [self.soccerContent addObject:dic];
            NSString *str = dic[@"channeltitle"];
            [self.channelTitle addObject:str];
            
            //[self.channelTitleS addObject:<#(id)#>]
            //(@"CHANNELS LIST: %@ %@", dic[@"channeltitle"],dic[@"channelid"])
            
            
        }
    }

    
    //ChannelEntry *channel  = [[ChannelEntry alloc] initSoccerJason:self.sportsArray];
    
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.section1 = self.channelTitle;
    self.section2 = [NSArray arrayWithObjects:@"Setting", nil];
    self.menu = [NSArray arrayWithObjects:self.section1, self.section2, nil];
    self.mainViewController = (UINavigationController *)self.slidingViewController.topViewController;    //[self.slidingViewController setAnchorRightRevealAmount:200.0f];
    //self.view.layer.borderWidth     = 20;
   // self.edgesForExtendedLayout     = UIRectEdgeTop | UIRectEdgeBottom | UIRectEdgeLeft; // don't go under the top view
    //self.slidingViewController.anchorLeftPeekAmount= ECFullWidth;
    // configure under left view controller
    //self.view.layer.borderWidth     = 20;
   // self.view.layer.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0].CGColor;
   // self.view.layer.borderColor     = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    //self.edgesForExtendedLayout     = UIRectEdgeTop | UIRectEdgeBottom | UIRectEdgeLeft; // don't go under the top view
}

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
    return [self.menu count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     
    // Return the number of rows in the section.
    if (section == 0)
        return [self.section1 count];
    
    //else if (section == 1)
        return [self.section2 count];
   // else
        //return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section == 0)
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.section1 objectAtIndex:indexPath.row]];
    
    else if (indexPath.section == 1)
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.section2 objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *menuItem;
    UIViewController *newTopViewController;
    if (indexPath.section == 0){
       menuItem = [NSString stringWithFormat:@"%@", [self.section1 objectAtIndex:indexPath.row]];
    newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    }
    
    else if (indexPath.section == 1){
        menuItem = [NSString stringWithFormat:@"%@", [self.section2 objectAtIndex:indexPath.row]];
        newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    }
    
    
   
    //if ([menuItem isEqualToString:@"Main"]) {
     //   self.slidingViewController.topViewController = self.mainViewController;
        
   // }
   // else
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    UINavigationController *navController = (UINavigationController *)self.slidingViewController.topViewController;
    navController.title = menuItem;
    
    
    [self.slidingViewController resetTopViewAnimated:YES];
    
    

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
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
