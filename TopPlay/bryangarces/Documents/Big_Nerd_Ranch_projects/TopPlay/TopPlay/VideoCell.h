//
//  VideoCell.h
//  TopPlay
//
//  Created by Bryan Garces on 11/9/13.
//  Copyright (c) 2013 Bryan Garces. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *channelTitle;
@property (weak, nonatomic) IBOutlet UILabel *videoTitle;
@property (weak, nonatomic) IBOutlet UIImageView *videoPhoto;


- (void)setupWithDictionary:(NSDictionary *)dictionary;
@end
