//
//  SPMessageList.h
//  Spora
//
//  Created by Pedro Alvarez-Tabio on 5/2/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPMessageList : NSObject {
    NSMutableArray *messages;
}

- (void)fillMessageListWithData:(NSData*)messageListData;

@end
