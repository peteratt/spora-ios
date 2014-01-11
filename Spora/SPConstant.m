//
//  MLConstant.m
//  Messly
//
//  Created by Pedro Alvarez-Tabio on 4/14/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import "SPConstant.h"

static NSDictionary *constantsDict = nil;

@implementation SPConstant

+ (void)initialize
{
    if (!constantsDict)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Globals" ofType:@"plist"];
        constantsDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
}

// TODO: Deprecated
+ (NSString*)messagePostingServiceURL
{
    return [NSString stringWithFormat:@"%@%@", [constantsDict valueForKey:@"BASE_URL"], [constantsDict valueForKey:@"SPORA_MSG_API"]];
}

+ (NSString*)sporaBaseURL
{    
    return [NSString stringWithFormat:@"%@", [constantsDict valueForKey:@"BASE_URL"]];
}

+ (NSString*)sporaPostMessagePath
{    
    return [NSString stringWithFormat:@"%@", [constantsDict valueForKey:@"SPORA_MSG_API"]];
}

+ (NSString*)sporaGetMessagesPath
{    
    return [NSString stringWithFormat:@"%@", [constantsDict valueForKey:@"SPORA_MSG_API"]];
}

+ (NSString*)sporaPutMessagePath
{
    return [NSString stringWithFormat:@"%@", [constantsDict valueForKey:@"SPORA_MSG_API"]];
}

@end
