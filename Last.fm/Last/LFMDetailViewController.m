//
//  LFMDetailViewController.m
//  LastFM
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import "LFMDetailViewController.h"
#import "PSDefines.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>


@implementation LFMDetailViewController

@synthesize mapView = mapView_;
@synthesize titleLabel = titleLabel_;
@synthesize startDateLabel = startDateLabel_;
@synthesize imageView = imageView_;
@synthesize event = event_;

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Lifecycle
////////////////////////////////////////////////////////////////////////

- (void)dealloc {
    MCRelease(mapView_);
    MCRelease(titleLabel_);
    MCRelease(startDateLabel_);
    MCRelease(imageView_);
    MCRelease(event_);
    
    [super dealloc];
}


////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIView
////////////////////////////////////////////////////////////////////////

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 210, 20)] autorelease];
    self.startDateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 31, 210, 20)] autorelease];
    self.imageView = [[[UIImageView alloc] initWithFrame:CGRectMake(230, 10, 80, 80)] autorelease];
    self.mapView = [[[MKMapView alloc] initWithFrame:CGRectMake(10, 10, 300, 200)] autorelease];
    
    UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)] autorelease];
    UIView *footerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 220)] autorelease];
    
    [headerView addSubview:self.titleLabel];
    [headerView addSubview:self.startDateLabel];
    [headerView addSubview:self.imageView];
    
    [footerView addSubview:self.mapView];
    
    self.tableView.tableHeaderView = headerView;
    self.tableView.tableFooterView = footerView;
    
    // customize appearance
    self.tableView.backgroundColor = [UIColor blackColor];
    self.titleLabel.opaque = NO;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    
    self.startDateLabel.opaque = NO;
    self.startDateLabel.backgroundColor = [UIColor clearColor];
    self.startDateLabel.textColor = [UIColor whiteColor];
    self.startDateLabel.font = [UIFont systemFontOfSize:14];
    
    self.imageView.layer.cornerRadius = 4.f;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 2.f;
    
    self.mapView.layer.cornerRadius = 4.f;
    self.mapView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.mapView.layer.borderWidth = 2.f;
    
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
}

- (void) viewDidUnload {
    self.mapView = nil;
    self.titleLabel = nil;
    self.startDateLabel = nil;
    self.imageView = nil;
    
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = self.event.title;
    self.titleLabel.text = self.event.title;
    self.startDateLabel.text = [self.event.startDate description];
    [self.imageView setImageWithURL:[NSURL URLWithString:self.event.mediumImageURL] 
                   placeholderImage:[UIImage imageNamed:@"lastfm.png"]];

    [self.mapView addAnnotation:self.event];
    [self.mapView setRegion:MKCoordinateRegionMake(self.event.coordinate, MKCoordinateSpanMake(0.01, 0.01)) animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.mapView removeAnnotation:self.event];
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MKMapViewDelegate
////////////////////////////////////////////////////////////////////////

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *annotationID = @"WTFooterViewAnnotation";
    
    // User location is self-drawn by MapKit
    if ([annotation isMemberOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationID];
    
    if (annotationView == nil) {
        annotationView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationID] autorelease];
        annotationView.animatesDrop = YES;
        annotationView.selected = YES;
    }
    
	return annotationView;
}

@end
