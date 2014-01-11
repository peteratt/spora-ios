//
//  SPJSONParser.m
//  Spora
//
//  Created by Pedro Alvarez-Tabio on 5/2/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import "SPJSONParser.h"

@implementation SPJSONParser

+ (NSDictionary*)parseResponse:(NSData*)jsonData
{
    NSError *error;
    NSDictionary *returnDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    if (!returnDict) {
        NSLog(@"Error parsing JSON: %@", error);
        return [NSDictionary dictionary];
    } else {
        return returnDict;
    }
}

@end
