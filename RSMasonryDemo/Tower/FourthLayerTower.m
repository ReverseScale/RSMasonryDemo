//
//  FourthLayerTower.m
//  RSMasonryDemo
//
//  Created by WhatsXie on 2017/9/6.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "FourthLayerTower.h"
#import "LibHeader.h"
@interface FourthLayerTower ()
@property (nonatomic, assign) BOOL isON;
@property (nonatomic, strong) UIView *blackView;
@property (nonatomic, strong) UIView *grayView;
@end

@implementation FourthLayerTower

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupBlackView];
    [self frameLayout];
}

- (void)setupBlackView {
    self.blackView = UIView.new;
    [self.blackView showPlaceHolder];
    self.blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.blackView];
    
    self.grayView = UIView.new;
    [self.grayView showPlaceHolder];
    self.grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.grayView];
}

- (void)frameLayout {
    self.blackView.frame = CGRectMake(0, 70, self.view.frame.size.width, 200);
    self.grayView.frame = CGRectMake(0, 100, 100, 100);
}
- (void)masonryLayout {
    [self.blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    
    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(-20);
        make.top.equalTo(self.blackView.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_centerX);
        
        make.height.equalTo(self.blackView);
    }];
}

- (void)onOffAction {
    self.isON = !self.isON;
    if (self.isON) {
        [self masonryLayout];
        self.navigationItem.rightBarButtonItem.title = @"不充";
    } else {
        [self.blackView removeFromSuperview];
        [self setupBlackView];
        [self frameLayout];
        self.navigationItem.rightBarButtonItem.title = @"充一毛";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
