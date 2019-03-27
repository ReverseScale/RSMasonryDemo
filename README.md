# RSMasonryDemo

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-4.5MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

[EN](https://github.com/ReverseScale/RSMasonryDemo) | [中文](https://github.com/ReverseScale/RSMasonryDemo/blob/master/README_zh.md)


OC Masonry skill tower, take you to upgrade with Masonry Daguai 🤖

> Shallow teach you to use Masonry relative layout.

![](https://s2.ax1x.com/2019/03/27/AaUHA0.jpg)

### 🤖 Requirements

* iOS 8.0+
* Xcode 7.0+
* Objective-C

### 🎨 Why test the UI?

|1.List Page | 2.Basic Layout Page | 3.Monitor Page | 4.Update List Page | 5.Jiugongge Page |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| ![](https://s2.ax1x.com/2019/03/27/AaUMpF.png) | ![](https://s2.ax1x.com/2019/03/27/AaUZT0.png) | ![](https://s2.ax1x.com/2019/03/27/AaUmkV.png) | ![](https://s2.ax1x.com/2019/03/27/AaUnYT.png) | ![](https://s2.ax1x.com/2019/03/27/AaUufU.png) |
| Basic framework through storyboard | Basic relative layout | Layout according to keyboard height | Adaptive height on network data | Relative layout of Jiugongge |

### 🚀 Getting started
#### The advantages of the framework
* 1. Less documents, code concise
* 2. Vivid image, learning curve is good
* 3. Join network data loading framework
* 4. Has a high custom

### 🎯 Installation

#### Install

### 1. Manual installation:
`After downloading the Demo, drag the function folder into the project and start using the header file. `
### 2.CocoaPods installation:
Modify "Podfile" file
```
pod 'Masonry', '~> 1.0.2'
```
Console Execute Pods Installation Command (Simplified Installation: pod install --no-repo-update)
```
pod install
```
> If the pod search found is not the latest version, the terminal pod setup command to update the local spec image cache, search again OK


### 🛠 Configuration

#### Start learning

Go to Daguai to upgrade it ~

If you feel that you have enough power, you will find it hard to find a Stat

![](http://og1yl0w9z.bkt.clouddn.com/18-2-7/72661225.jpg)

#### Update the native VFL layout

VFL is a visual format language that apple USES for its AutoLayout layout.
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


### 📝 Submission

Here is just basic teaching, not standardized, if you want further study, you can go to GitHub-SnapKit home page!（https://github.com/SnapKit）

OC Masonry：https://github.com/SnapKit/Masonry

Swift SnapKit：https://github.com/SnapKit/SnapKit


### 😬 Contributions

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io
