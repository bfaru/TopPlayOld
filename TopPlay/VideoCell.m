//
//  VideoCell.m
//  TopPlay
//
//  Created by Bryan Garces on 11/9/13.
//  Copyright (c) 2013 Bryan Garces. All rights reserved.
//

#import "VideoCell.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+AFNetworking.h"

@implementation VideoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupWithDictionary:(NSDictionary *)dictionary
{
    //self.mainView.layer.cornerRadius = 10;
    //self.mainView.layer.masksToBounds = YES;
    //self.videoPhoto.image = nil;
    //[self.videoPhoto cancelImageRequestOperation];
    NSDictionary *imageDic = dictionary[@"thumbnails"];
    NSURL *url = [NSURL URLWithString:imageDic[@"standard"][@"url"]];
    NSLog(@"IMAGE NAME: %@", url);
    if (url) {
        [self.videoPhoto setImageWithURL:url];
        
    }

   // NSData *data = [NSData dataWithContentsOfURL:url];
    //self.videoPhoto.image = [UIImage imageWithData:data ];
    self.videoTitle.text = dictionary[@"title"];
    self.channelTitle.text = dictionary[@"channelTitle"];
    
    
}

-(void)prepareForReuse {
    [super prepareForReuse];
    [self.videoPhoto cancelImageRequestOperation];
    self.videoPhoto.image = nil;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
