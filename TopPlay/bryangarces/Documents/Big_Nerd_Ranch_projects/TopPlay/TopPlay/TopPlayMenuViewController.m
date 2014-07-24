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

@interface TopPlayMenuViewController ()
@property (strong, nonatomic)NSArray* menu;
@property (strong, nonatomic)NSArray* section1;

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
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.section1 = [NSArray arrayWithObjects:@"Main", @"Sports", nil];
    self.section2 = [NSArray arrayWithObjects:@"Settings", @"Notifications", nil];
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
    newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:menuItem];
    }
    
    else if (indexPath.section == 1){
        menuItem = [NSString stringWithFormat:@"%@", [self.section2 objectAtIndex:indexPath.row]];
        newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:menuItem];
    }
    
    
   
    //if ([menuItem isEqualToString:@"Main"]) {
     //   self.slidingViewController.topViewController = self.mainViewController;
        
   // }
   // else
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:menuItem];
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
