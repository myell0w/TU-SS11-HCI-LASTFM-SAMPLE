//
//  LFMEvent.h
//  LastFM
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LFMEvent : NSObject {
    NSDictionary *data_;
}

+ (NSArray *)eventsFromDictionary:(NSDictionary *)eventsDictionary;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly) NSArray *artists;
@property (nonatomic, readonly) NSArray *images;
@property (nonatomic, readonly) NSString *mediumImageURL;
@property (nonatomic, readonly) NSDate *startDate;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSDictionary *location;

@end
