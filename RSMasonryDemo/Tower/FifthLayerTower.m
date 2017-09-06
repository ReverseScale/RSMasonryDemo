//
//  FifthLayerTower.m
//  RSMasonryDemo
//
//  Created by WhatsXie on 2017/9/6.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "FifthLayerTower.h"
#import "LibHeader.h"
@interface FifthLayerTower ()
@property (nonatomic, assign) BOOL isON;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@end

@implementation FifthLayerTower

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupBlackView];
    [self frameLayout];
}

- (void)setupBlackView {
    self.greenView = UIView.new;
    [self.greenView showPlaceHolder];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    self.redView = UIView.new;
    [self.redView showPlaceHolder];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    self.blueView = UIView.new;
    [self.blueView showPlaceHolder];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
}

- (void)frameLayout {
    self.greenView.frame = CGRectMake(0, 70, self.view.frame.size.width, 200);
    self.redView.frame = CGRectMake(0, 0, 100, 100);
    self.blueView.frame = CGRectMake(50, 50, 100, 100);
}
- (void)masonryLayout {
    static int padding1 = 20;
    
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
    
    
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.centerY.mas_equalTo(self.greenView);
        make.width.equalTo(self.blueView);
        make.left.equalTo(self.greenView.mas_left).offset(padding1);
        make.right.equalTo(self.blueView.mas_left).offset(-padding1);
    }];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.redView);
        make.centerY.mas_equalTo(self.greenView);
        make.width.equalTo(self.redView);
        make.left.equalTo(self.redView.mas_right).offset(padding1);
        make.right.equalTo(self.greenView.mas_right).offset(-padding1);
    }];
}

- (void)onOffAction {
    self.isON = !self.isON;
    if (self.isON) {
        [self masonryLayout];
        self.navigationItem.rightBarButtonItem.title = @"不充";
    } else {
        [self.greenView removeFromSuperview];
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
