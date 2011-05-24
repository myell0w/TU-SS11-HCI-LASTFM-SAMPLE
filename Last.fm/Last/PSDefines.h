//
//  PSDefines.h
//  Last
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "PSFoundation.h"


////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Last.FM API Keys
////////////////////////////////////////////////////////////////////////

#define kLastFmAPIKey               @"86dffc028449692c1c28d873d8cec885"
#define kLastFmAPISecret            @"9e9bf4935463f20d68869aeb88302b0d"

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Last.FM API Calls
////////////////////////////////////////////////////////////////////////

#define kLastFmGetEventsURL         [NSString stringWithFormat:@"%@%@",@"http://ws.audioscrobbler.com/2.0/?method=geo.getevents&format=json&location=vienna&api_key=",kLastFmAPIKey]

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Constants
////////////////////////////////////////////////////////////////////////

#define kLFMResponseDataKey         @"kLFMResponseDataKey"