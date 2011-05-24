//
//  LFMTableViewController.m
//  Last
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import "LFMTableViewController.h"
#import "LFMEventsRequest.h"
#import "LFMEvent.h"


@implementation LFMTableViewController

@synthesize request = request_;
@synthesize events = events_;

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

- (void)dealloc {
    MCRelease(request_);
    MCRelease(events_);
    
    [super dealloc];
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.request.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.request.delegate = nil;
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark ASIHTTPRequestDelegate
////////////////////////////////////////////////////////////////////////

- (void)requestFinished:(ASIHTTPRequest *)request {
    self.events = [LFMEvent eventsFromDictionary:request.userInfo];
    [self.tableView reloadData];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    DDLogError(@"Request failed: %@", request.error);
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDataSource
////////////////////////////////////////////////////////////////////////

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.events.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellID = @"MTTableViewCellID";
    
	UITableViewCell *cell = nil;
    LFMEvent *event = [self.events objectAtIndex:indexPath.row];
    
	// step 1: is there a dequeueable cell?
	cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
	// step 2: no? -> create new cell
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID] autorelease];
	}
    
	// step 3: set up cell values
    cell.textLabel.text = event.title;
    cell.detailTextLabel.text = [event.startDate description];
    
    return cell;
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDelegate
////////////////////////////////////////////////////////////////////////

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
