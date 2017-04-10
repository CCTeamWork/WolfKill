//
//  NIMServerAPI.h
//  ObjcServerAPI
//
//  Created by amao on 2/26/16.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^NIMServerResultBlock)(NSError *error,NSDictionary *resultDict);

@interface NIMServerAPI : NSObject
+ (instancetype)sharedAPI;

- (void)request:(NSString *)urlString params:(NSDictionary *)params completion:(NIMServerResultBlock)block;
@end
