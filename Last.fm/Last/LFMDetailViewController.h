//
//  LFMDetailViewController.h
//  LastFM
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "LFMEvent.h"


@interface LFMDetailViewController : UITableViewController <MKMapViewDelegate> {
    MKMapView *mapView_;
    UILabel *titleLabel_;
    UILabel *startDateLabel_;
    UIImageView *imageView_;
    
    LFMEvent *event_;
}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *startDateLabel;
@property (nonatomic, retain) UIImageView *imageView;

@property (nonatomic, retain) LFMEvent *event;

- (void)handleBackTap:(UITapGestureRecognizer *)gestureRecognizer;

@end
