//
//  LastAppDelegate.h
//  Last
//
//  Created by Matthias Tretter on 24.05.11.
//  Copyright 2011 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFMTableViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    LFMTableViewController *rootViewController_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) LFMTableViewController *rootViewController;

@end
