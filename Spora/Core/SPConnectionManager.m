//
//  SPConnectionManager.m
//  Spora
//
//  Created by Pedro Alvarez-Tabio on 4/14/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import "SPConnectionManager.h"
#import "SPConstant.h"

#pragma -mark Callbacks
static void (^failedConnectionCallback)(AFHTTPRequestOperation*, NSError*) = ^void (AFHTTPRequestOperation *operation, NSError *error)
{
    NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
    // TODO: Handle reconnection
};

@interface SPConnectionManager ()
@property (nonatomic, strong) AFHTTPClient *httpClient;
@end

@implementation SPConnectionManager
@synthesize httpClient = _httpClient;

- (id)init
{
    self = [super init];
    if (self) {
        NSURL *url = [NSURL URLWithString:[SPConstant sporaBaseURL]];
        _httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    }
    return self;
}

+ (id)sharedInstance
{
    static SPConnectionManager* sharedConnectionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConnectionManager = [[self alloc] init];
    });
    return sharedConnectionManager;
}

- (void)sendMessageWithText:(NSString *)text andLocation:(CLLocationCoordinate2D)location
{
    NSDictionary *postParams = [NSDictionary dictionaryWithObjectsAndKeys:
                            text, @"message[content]",
                            [NSString stringWithFormat:@"%f", location.latitude], @"message[latitude]",
                            [NSString stringWithFormat:@"%f", location.longitude], @"message[longitude]",
                            nil];
    
    [_httpClient postPath:[SPConstant sporaPostMessagePath] parameters:postParams
        success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"Request Successful, response '%@'", responseStr);
        }
        failure:failedConnectionCallback
    ];
}

- (void)getMessagesForLocation:(CLLocationCoordinate2D)location
{
    NSString *getMessagePath = [NSString stringWithFormat:@"%@/%f/%f/0.1", [SPConstant sporaGetMessagesPath], location.latitude, location.longitude];
    
    [_httpClient getPath:getMessagePath parameters:nil
        success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"Request Successful, response '%@'", responseStr);
        }
        failure:failedConnectionCallback
     ];
}

- (void)upvoteMessageWithId:(int)messageId
{    
    NSString *putMessagePath = [NSString stringWithFormat:@"%@/%d", [SPConstant sporaPutMessagePath], messageId];
    
    [_httpClient putPath:putMessagePath parameters:nil
        success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"Request Successful, response '%@'", responseStr);
        }
        failure:failedConnectionCallback
     ];
}

@end
