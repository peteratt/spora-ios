//
//  MLConstant.h
//  Messly
//
//  Created by Pedro Alvarez-Tabio on 4/14/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPConstant : NSObject

+ (NSString*)messagePostingServiceURL;

+ (NSString*)sporaBaseURL;

+ (NSString*)sporaPostMessagePath;

+ (NSString*)sporaGetMessagesPath;

+ (NSString*)sporaPutMessagePath;

@end
