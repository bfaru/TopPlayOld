//
//  TopPlayAppDelegate.m
//  TopPlay
//
//  Created by Bryan Garces on 10/13/13.
//  Copyright (c) 2013 Bryan Garces. All rights reserved.
//

#import "TopPlayAppDelegate.h"
#import "TopPlayTableViewController.h"
#import "ECSlidingSegue.h"


@interface TopPlayAppDelegate ()


@end

@implementation TopPlayAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupChannelData];
   
   /*TopPlayTableViewController *topPlayViewController = [[TopPlayTableViewController alloc] initWithNibName:@"TopPlayTableViewController" bundle:nil];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:topPlayViewController];
    self.window.rootViewController = nav;*/
    
    // Override point for customization after application launch.
    return YES;
}

- (void)setupChannelData
{
    NSString *path = [self dataFilePath];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            NSData *data = [[NSData alloc] initWithContentsOfFile:path];
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
            self.channels = [unarchiver decodeObjectForKey:@"SportsChannel"];
            [unarchiver finishDecoding];
            
        } else {
            self.channels = [[NSMutableArray alloc]init];
        }
    
    
}

- (NSString *)dataFilePath
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SportsChannelList" ofType:@"plist"];
    return path;
    //For getting the files's path stored in the documents directory not the resources folder.
    // return [[self documentsDirectory] stringByAppendingPathComponent:@"SportsChannelList.plist"];
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
