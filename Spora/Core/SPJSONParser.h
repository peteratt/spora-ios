//
//  SPJSONParser.h
//  Spora
//
//  Created by Pedro Alvarez-Tabio on 5/2/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPMessage.h"
#import "SPMessageList.h"

@interface SPJSONParser : NSObject
{
    
}

+ (NSDictionary*)parseResponse:(NSData*)jsonData;

@end
