//
//  MLConnectionManager.h
//  Messly
//
//  Created by Pedro Alvarez-Tabio on 4/14/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "AFHTTPClient.h"

@interface SPConnectionManager : NSObject
{
    AFHTTPClient *httpClient;
}

+ (id)sharedInstance;

- (void)sendMessageWithText:(NSString *)text andLocation:(CLLocationCoordinate2D)location;

- (void)getMessagesForLocation:(CLLocationCoordinate2D)location;

- (void)upvoteMessageWithId:(int)messageId;

@end
