//
//  NetworkRouter.h
//  RSNetworkDemo
//
//  Created by WhatsXie on 2017/8/16.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, NetWorkRequestType){
    APIManagerRequestTypeGet,                 //GET  数据请求
    APIManagerRequestTypePost,                //POST 数据请求
    APIManagerRequestTypeGetCache,            //GET  缓存 数据请求
    APIManagerRequestTypePostCache,           //POST 缓存 数据请求
};

/**
 * 请求成功的block
 *
 * @param response 响应体数据
 */
typedef void(^requestSuccess)(id response);

/**
 * 请求失败的block
 *
 * @param error 扩展信息
 */
typedef void(^requestFailure)(NSError *error);

/**
 * 缓存的Block
 *
 * @param responseCache 缓存数据
 */
typedef void(^httpRequestCache)(id responseCache);

/**
 * 下载进度的Block
 *
 * @param progress 下载进度信息
 */
typedef void(^progress)(NSProgress *progress);





@interface NetworkRouter : NSObject


/** 网络请求方法
 *  url         请求地址
 *  requestType 请求方式 NS_ENUM
 *  parameters  请求参数
 *  cache       缓存block
 *  success     成功block
 *  failure     失败block
 */
+ (NSURLSessionTask *)netWorkRequestWithURL:(NSString *)url requestType:(NetWorkRequestType)requestType parameters:(id)parameters responseCache:(httpRequestCache)cache success:(requestSuccess)success failure:(requestFailure)failure;

/** 下载方法*/
+ (void)downloadWithURL:(NSString *)URL fileDir:(NSString *)fileDir progress:(progress)progressBlock success:(requestSuccess)success failure:(requestFailure)failure;

/** 取消全部请求*/
+ (void)cancelAllOperations;
@end
