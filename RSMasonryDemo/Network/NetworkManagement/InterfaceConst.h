//
//  InterfaceConst.h
//  RSNetworkDemo
//
//  Created by WhatsXie on 2017/8/16.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#ifndef InterfaceConst_h
#define InterfaceConst_h


#if    DEBUG
/** 接口前缀-开发服务器-Debug*/
#define kApiPrefix @"http://api.budejie.com"
#elif  BETA
/** 接口前缀-测试服务器-Beta*/
#define kApiPrefix @"http://api.budejie.com"
#else
/** 接口前缀-生产服务器-Release*/
#define kApiPrefix @"http://api.budejie.com"
#endif


// 接口部分

#define kTestApiURL @"/api/api_open.php"

#endif /* InterfaceConst_h */
