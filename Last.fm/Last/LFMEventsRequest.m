//
//  LFMEventsRequest.m
//  Last
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import "LFMEventsRequest.h"


@implementation LFMEventsRequest

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Lifecycle
////////////////////////////////////////////////////////////////////////

+ (id)eventsRequest {
    LFMEventsRequest *request = [[[LFMEventsRequest alloc] initWithURL:[NSURL URLWithString:kLastFmGetEventsURL]] autorelease];    
    
    return request;
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Request Finished/Failed
////////////////////////////////////////////////////////////////////////

- (void)requestFinished {
    self.userInfo = XDICT([self.responseData objectFromJSONData], kLFMResponseDataKey);
    
    MTLog(self.userInfo);
    
	[super requestFinished];
}

- (void)failWithError:(NSError *)theError {
    DDLogError(theError);
    
    [super failWithError:theError];
}

@end
