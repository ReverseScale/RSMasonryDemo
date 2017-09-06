//
//  NetworkManagement.h
//  RSNetworkDemo
//
//  Created by WhatsXie on 2017/8/16.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "NetworkRouter.h"

@interface NetworkManagement : NetworkRouter
+ (NSURLSessionTask *)tsetGetRequest:(NetWorkRequestType)requestType parameters:(id)parameters responseCache:(httpRequestCache)cache success:(requestSuccess)success failure:(requestFailure)failure;
@end
