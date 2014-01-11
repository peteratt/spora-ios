//
//  SPMessageList.m
//  Spora
//
//  Created by Pedro Alvarez-Tabio on 5/2/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import "SPMessageList.h"
#import "SPJSONParser.h"

@interface SPMessageList ()
@property (nonatomic, strong) NSMutableArray *messageList;
@end

@implementation SPMessageList

@synthesize messageList = _messageList;

- (id)init
{
    self = [super init];
    if (self) {
        _messageList = [NSMutableArray array];
    }
    return self;
}

- (void)fillMessageListWithData:(NSData*)messageListData
{
    NSDictionary *messagesDict = [SPJSONParser parseResponse:messageListData];
}

@end
