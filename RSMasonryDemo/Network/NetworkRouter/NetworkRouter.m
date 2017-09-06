//
//  NetworkRouter.m
//  RSNetworkDemo
//
//  Created by WhatsXie on 2017/8/16.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "NetworkRouter.h"
#import <PPNetworkHelper.h>

@implementation NetworkRouter

+ (NSDictionary *)setParameters:(NSDictionary *)parameters {
    // 根据服务器要求 设置参数或拦截
    NSMutableDictionary *parameterMuDic = [NSMutableDictionary new];
    [parameterMuDic setObject:@"list" forKey:@"a"];
    [parameterMuDic setObject:@"data" forKey:@"c"];
    [parameterMuDic setObject:@"iphone" forKey:@"client"];
    return parameterMuDic;
}

#pragma - 以下部分不与业务层关联

+ (NSURLSessionTask *)netWorkRequestWithURL:(NSString *)url requestType:(NetWorkRequestType)requestType parameters:(id)parameters responseCache:(httpRequestCache)cache success:(requestSuccess)success failure:(requestFailure)failure {
    switch (requestType) {
        case APIManagerRequestTypeGet:
            return [self getRequestNoCacheWithURL:url parameters:[self setParameters:parameters] success:success failure:failure];
            break;
        case APIManagerRequestTypePost:
            return [self postRequestNoCacheWithURL:url parameters:[self setParameters:parameters] success:success failure:failure];
            break;
        case APIManagerRequestTypeGetCache:
            return [self getRequestCacheWithURL:url parameters:[self setParameters:parameters] responseCache:cache success:success failure:failure];
            break;
        default:
            return [self postRequestCacheWithURL:url parameters:[self setParameters:parameters] responseCache:cache success:success failure:failure];
            break;
    }
}
// GET无缓存
+ (NSURLSessionTask *)getRequestNoCacheWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(requestSuccess)success failure:(requestFailure)failure {
    // 发起请求
    return [PPNetworkHelper GET:URL parameters:parameter success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        // 错误信息
        failure(error);
    }];
}

// POST无缓存
+ (NSURLSessionTask *)postRequestNoCacheWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(requestSuccess)success failure:(requestFailure)failure {
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
    // [PPNetworkHelper setValue:@"2.1.0" forHTTPHeaderField:@"version"];
    
    // 发起请求
    return [PPNetworkHelper POST:URL parameters:parameter success:^(id responseObject) {
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        success(responseObject);
    } failure:^(NSError *error) {
        // 错误信息
        failure(error);
    }];
}

// GET有缓存
+ (NSURLSessionTask *)getRequestCacheWithURL:(NSString *)URL parameters:(NSDictionary *)parameter responseCache:(PPHttpRequestCache)cache success:(requestSuccess)success failure:(requestFailure)failure {
    // 发起请求
    return [PPNetworkHelper GET:URL parameters:parameter responseCache:^(id responseCache) {
        // 缓存信息
        cache(responseCache);
    } success:^(id responseObject) {
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        success(responseObject);
    } failure:^(NSError *error) {
        // 错误信息
        failure(error);
    }];
}
// POST有缓存
+ (NSURLSessionTask *)postRequestCacheWithURL:(NSString *)URL parameters:(NSDictionary *)parameter responseCache:(PPHttpRequestCache)cache success:(requestSuccess)success failure:(requestFailure)failure {
    return [PPNetworkHelper POST:URL parameters:parameter responseCache:^(id responseCache) {
        // 缓存信息
        cache(responseCache);
    } success:^(id responseObject) {
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        success(responseObject);
    } failure:^(NSError *error) {
        // 错误信息
        failure(error);
    }];
}
// 下载
+ (void)downloadWithURL:(NSString *)URL fileDir:(NSString *)fileDir progress:(progress)progressBlock success:(requestSuccess)success failure:(requestFailure)failure {
    static NSURLSessionTask *task = nil;
    //开始下载
    task = [PPNetworkHelper downloadWithURL:URL fileDir:fileDir progress:^(NSProgress *progress) {
        progressBlock(progress);
    } success:^(NSString *filePath) {
        success(filePath);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
// 取消全部请求
+ (void)cancelAllOperations {
    [PPNetworkHelper cancelAllRequest];
}
@end
