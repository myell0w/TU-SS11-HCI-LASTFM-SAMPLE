//
//  LFMEvent.m
//  LastFM
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import "LFMEvent.h"
#import "PSDefines.h"

@interface LFMEvent ()
@property (nonatomic, copy) NSDictionary *data;
@end


@implementation LFMEvent

@synthesize data = data_;

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Lifecycle
////////////////////////////////////////////////////////////////////////

+ (NSArray *)eventsFromDictionary:(NSDictionary *)eventsDictionary {
    NSMutableArray *events = [NSMutableArray array];
    
    for (NSDictionary *eventDictionary in [[[eventsDictionary valueForKey:kLFMResponseDataKey] valueForKey:@"events"] valueForKey:@"event"]) {
        [events addObject:[[[LFMEvent alloc] initWithDictionary:eventDictionary] autorelease]];
    }
    
    return [[events copy] autorelease];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if ((self = [super init])) {
        data_ = [dictionary copy];
    }
    
    return self;
}

- (void)dealloc {
    MCRelease(data_);
    
    [super dealloc];
}

////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Getter
////////////////////////////////////////////////////////////////////////

- (NSArray *)artists {
    return [self.data objectForKey:@"artists"];
}

- (NSArray *)images {
    return [self.data objectForKey:@"image"];
}

- (NSString *)mediumImageURL {
    NSArray *images = self.images;
    
    for (NSDictionary *imageDictionary in images) {
        if ([[imageDictionary valueForKey:@"size"] isEqualToString:@"medium"]) {
            return [imageDictionary valueForKey:@"#text"];
        }
    }
    
    return nil;
}

- (NSDate *)startDate {
    return [self.data objectForKey:@"startDate"];
}

- (NSString *)title {
    return [self.data objectForKey:@"title"];
}

- (NSDictionary *)location {
    return [self.data objectForKey:@"location"];
}

@end
