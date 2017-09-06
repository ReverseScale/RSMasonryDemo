//
//  NetworkManagement.m
//  RSNetworkDemo
//
//  Created by WhatsXie on 2017/8/16.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "NetworkManagement.h"
#import "InterfaceConst.h"

@implementation NetworkManagement
+ (NSURLSessionTask *)tsetGetRequest:(NetWorkRequestType)requestType parameters:(id)parameters responseCache:(httpRequestCache)cache success:(requestSuccess)success failure:(requestFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix,kTestApiURL];
    return [self netWorkRequestWithURL:(NSString *)url requestType:requestType parameters:parameters responseCache:cache success:success failure:failure];
}
@end
