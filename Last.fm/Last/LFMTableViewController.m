//
//  LFMTableViewController.m
//  Last
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import "LFMTableViewController.h"
#import "LFMEventsRequest.h"


@implementation LFMTableViewController

@synthesize request = request_;

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Lifecycle
////////////////////////////////////////////////////////////////////////

- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:style])) {
        self.title = @"Last.fm Sample";
    }
    
    return self;
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIView
////////////////////////////////////////////////////////////////////////

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.request = [LFMEventsRequest eventsRequest];
    self.request.delegate = self;
    
    [self.request startAsynchronous];
}


////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark ASIHTTPRequestDelegate
////////////////////////////////////////////////////////////////////////

- (void)requestFinished:(ASIHTTPRequest *)request {
    DDLogFunction();
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDataSource
////////////////////////////////////////////////////////////////////////

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellID = @"MTTableViewCellID";
    
	UITableViewCell *cell = nil;
    
	// step 1: is there a dequeueable cell?
	cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
	// step 2: no? -> create new cell
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
	}
    
	// step 3: set up cell values
    
    
    
    return cell;
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDelegate
////////////////////////////////////////////////////////////////////////

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
