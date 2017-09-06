//
//  SecondLayerTower.m
//  RSMasonryDemo
//
//  Created by WhatsXie on 2017/9/6.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "SecondLayerTower.h"
#import "LibHeader.h"

@interface SecondLayerTower ()
@property (nonatomic, assign) BOOL isON;
@property (nonatomic, strong) UIView *blackView;
@property (nonatomic, strong) UIView *redView;
@end

@implementation SecondLayerTower

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
    
    self.redView = UIView.new;
    [self.redView showPlaceHolder];
    self.redView.backgroundColor = [UIColor redColor];
    [self.blackView addSubview:self.redView];
}

- (void)frameLayout {
    self.blackView.frame = CGRectMake(0, 70, self.view.frame.size.width, 200);
    self.redView.frame = CGRectMake(0, 0, 100, 100);
}
- (void)masonryLayout {
    [self.blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(self.blackView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
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
