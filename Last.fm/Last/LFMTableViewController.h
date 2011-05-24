//
//  LFMTableViewController.h
//  Last
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequestDelegate.h"

@class LFMEventsRequest;

@interface LFMTableViewController : UITableViewController <ASIHTTPRequestDelegate> {
    LFMEventsRequest *request_;
}

@property (nonatomic, retain) LFMEventsRequest *request;

@end
