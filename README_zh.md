
[EN](https://github.com/ReverseScale/RSMasonryDemo) | [中文](https://github.com/ReverseScale/RSMasonryDemo/blob/master/README_zh.md)

OC 版 Masonry 技能塔，带你用 Masonry 打怪升级 🤖

> 由浅入深的教你使用 Masonry 进行相对布局。

![](http://og1yl0w9z.bkt.clouddn.com/18-2-7/66774656.jpg)

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-4.5MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

### 🤖 要求

* iOS 8.0+
* Xcode 7.0+
* Objective-C

### 🎨 测试 UI 什么样子？

|1.列表页 |2.基本布局页 |3.相应监听页 |4.更新列表页 |5.九宫格页 |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| ![](http://og1yl0w9z.bkt.clouddn.com/18-2-7/94272819.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-2-7/78736004.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-2-7/13903426.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-2-7/45049499.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-2-7/80789116.jpg) |
| 通过 storyboard 搭建基本框架 | 基本的相对布局 | 根据键盘高度相应布局 | 根据网络数据自适应高度布局 | 九宫格相对布局 |

### 🚀 准备开始
#### 框架的优势
* 1.文件少，代码简洁
* 2.生动形象，学习曲线好
* 3.加入网络数据加载框架
* 4.具备较高自定义性

### 🎯 安装方法

#### 安装

### 1.手动安装:
`下载Demo后,将功能文件夹拖入到项目中, 导入头文件后开始使用。`
### 2.CocoaPods安装:
修改“Podfile”文件
```
pod 'Masonry', '~> 1.0.2'
```
控制台执行 Pods 安装命令 （ 简化安装：pod install --no-repo-update ）
```
pod install
```
> 如果 pod search 发现不是最新版本，在终端执行pod setup命令更新本地spec镜像缓存，重新搜索就OK了

### 🛠 配置

#### 开始学习

去打怪升级吧~

如果觉得力有不逮，就充一毛，又不是真找你要钱，给个 Stat 就好了✨

![](http://og1yl0w9z.bkt.clouddn.com/18-2-7/72661225.jpg)


#### 更新原生 VFL 布局

VFL是苹果推出的用来AutoLayout布局的一门比较形象的可视化格式语言，轻微体验一下。
```Swift
UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    // 间距
    NSNumber *margin = @20;
    
    // 添加水平方向的约束
    NSString *vflH = @"H:|-margin-[blueView]-margin-[redView(==blueView)]-margin-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView, redView);
    NSDictionary *mertrics = NSDictionaryOfVariableBindings(margin);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vflH options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:mertrics views:views];
    [self.view addConstraints:constraints];
    
    // 添加竖直方向的间距
    NSNumber *height = @40;
    NSString *vflV = @"V:[blueView(height)]-margin-|";
    NSDictionary *mertrics2 = NSDictionaryOfVariableBindings(margin, height);
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vflV options:kNilOptions metrics:mertrics2 views:views];
    [self.view addConstraints:constraints2];
```

### 📝 深入学习

这里只是基础教学，使用并不规范，如果想要深入学习，可以前往GitHub-SnapKit主页！（https://github.com/SnapKit）

OC Masonry：https://github.com/SnapKit/Masonry

Swift SnapKit：https://github.com/SnapKit/SnapKit


### 😬 联系

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io
