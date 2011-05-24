//
//  LFMTableViewCell.m
//  LastFM
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import "LFMTableViewCell.h"
#import "PSDefines.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>


@implementation LFMTableViewCell

@synthesize imageView = imageView_;
@synthesize mainTextLabel = mainTextLabel_;
@synthesize detailTextLabel = detailTextLabel_;

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Lifecycle
////////////////////////////////////////////////////////////////////////

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView_ = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 38, 38)];
        mainTextLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 260, 15)];
        detailTextLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(50, 22, 260, 20)];
        
        imageView_.contentMode = UIViewContentModeScaleAspectFill;
        imageView_.clipsToBounds = YES;
        imageView_.layer.cornerRadius = 3.f;
        [mainTextLabel_ setFont:[UIFont boldSystemFontOfSize:15]];
        [detailTextLabel_ setFont:[UIFont systemFontOfSize:14]];
        detailTextLabel_.textColor = [UIColor darkGrayColor];
        
        [self.contentView addSubview:imageView_];
        [self.contentView addSubview:mainTextLabel_];
        [self.contentView addSubview:detailTextLabel_];
    }
    return self;
}


- (void)dealloc
{
    MCRelease(imageView_);
    MCRelease(mainTextLabel_);
    MCRelease(detailTextLabel_);
    
    [super dealloc];
}


////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Setter
////////////////////////////////////////////////////////////////////////

- (void)setImageURL:(NSString *)imageURL {
    NSURL *url = [NSURL URLWithString:imageURL];
    
    // synchronous:
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //self.imageView.image = [UIImage imageWithData:data];
    
    // asynchronous:
    [self.imageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"lastfm.png"]];
}

@end
