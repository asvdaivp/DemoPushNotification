//
//  PDHTTPClient.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/7/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDHTTPClient.h"
#import "NSString+APIPaths.h"
#import "AFHTTPRequestOperationManager.h"
#import "PDError.h"

@interface PDHTTPClient(){
    PDError *bussinessError;
}
@end

@implementation PDHTTPClient
@synthesize delegate;

+ (PDHTTPClient *)sharedPDHTTPClient{
    static PDHTTPClient *_sharedPDHTTPClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedPDHTTPClient = [[self alloc] initWithBaseURL:[NSString baseURL]];
    });
    return _sharedPDHTTPClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndex:200];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain",@"text/html", nil];
    }
    return self;
}

- (void)apiPost: (NSString *)URLString
     parameters:(id)parameters
        success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [params setValue:@"" forKey:@"push_type"];
    [self POST:URLString parameters:params success:success failure:failure];
}

//================API===================
- (void)apiResetIconWithParams:(NSDictionary *)params{
    NSString *resetIconURL = [NSString resetIconURL];
    [self apiPost:resetIconURL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject) {
            bussinessError = [PDError errorFromDict:responseObject];
            if ([self.delegate respondsToSelector:@selector(resetIconHTTPClient:didReset:bussinessError:)]) {
                [self.delegate resetIconHTTPClient:self didReset:responseObject bussinessError:bussinessError];
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(resetIconHTTPClient:didFailedReset:)]) {
            [self.delegate resetIconHTTPClient:self didFailedReset:error];
        }
    }];
}
@end
