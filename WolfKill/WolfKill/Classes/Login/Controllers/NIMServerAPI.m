//
//  NIMServerAPI.m
//  ObjcServerAPI
//
//  Created by amao on 2/26/16.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "NIMServerAPI.h"
#import <CommonCrypto/CommonDigest.h>

@interface NSString (NIMSHA1)
@end
@implementation NSString(NIMSHA1)
- (NSString *)nim_sha1 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

@end


@interface NIMServerAPI ()
@property (nonatomic,copy)  NSString    *appKey;
@property (nonatomic,copy)  NSString    *appSecret;
@end

@implementation NIMServerAPI
+ (instancetype)sharedAPI {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}


- (instancetype)init {
    if (self = [super init]) {
#warning fill appkey and appsecret
        _appKey = @"a543326452dbb285fd196b19524e0c55";      //使用应用自己的appKey
        _appSecret = @"86757f7a15b5";   //使用应用自己的appSecret
    }
    return self;
}


- (void)request:(NSString *)urlString params:(NSDictionary *)params completion:(NIMServerResultBlock)block {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    [request setHTTPMethod:@"post"];
    
    [self addHttpHeader:request];
    [self addHttpBody:request
             byParams:params];
    
    NSURLSessionTask *task =
    [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *resultError = error;
        NSDictionary *resultDict = nil;
        if (error == nil &&
            data &&
            [response isKindOfClass:[NSHTTPURLResponse class]] &&
            [(NSHTTPURLResponse *)response statusCode] == 200 ) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
            if ([dict isKindOfClass:[NSDictionary class]]) {
                resultError = nil;
                resultDict = dict;
            }
        }
        
        if (resultError == nil && resultDict == nil) {
            resultError = [NSError errorWithDomain:@"nim" code:0 userInfo:nil];
        }
        if (block) {
            block(resultError,resultDict);
        }
        
    }];
    [task resume];
}

- (void)addHttpHeader:(NSMutableURLRequest *)request {
    [request addValue:_appKey forHTTPHeaderField:@"AppKey"];
    
    NSString *nonce = [NSString stringWithFormat:@"%zd",arc4random()];
    [request addValue:nonce forHTTPHeaderField:@"Nonce"];
    
    NSString *curTime = [NSString stringWithFormat:@"%zd",(NSInteger)[[NSDate date] timeIntervalSince1970]];
    [request addValue:curTime forHTTPHeaderField:@"CurTime"];
    
    NSString *checkSum = [[NSString stringWithFormat:@"%@%@%@",_appSecret,nonce,curTime] nim_sha1];
    [request addValue:checkSum forHTTPHeaderField:@"CheckSum"];

    
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
}

- (void)addHttpBody:(NSMutableURLRequest *)request byParams:(NSDictionary *)params {
    NSMutableArray *items = [NSMutableArray array];
    for (NSString *key in params.allKeys)
    {
        [items addObject:[NSString stringWithFormat:@"%@=%@",key,params[key]]];
    }
    NSString *postBody = [items componentsJoinedByString:@"&"];
    [request setHTTPBody:[postBody dataUsingEncoding:NSUTF8StringEncoding]];
}


@end



