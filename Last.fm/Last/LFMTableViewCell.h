//
//  LFMTableViewCell.h
//  LastFM
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LFMTableViewCell : UITableViewCell {
    UIImageView *imageView_;
    UILabel *mainTextLabel_;
    UILabel *detailTextLabel_;
}

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *mainTextLabel;
@property (nonatomic, retain) UILabel *detailTextLabel;

- (void)setImageURL:(NSString *)imageURL;

@end
