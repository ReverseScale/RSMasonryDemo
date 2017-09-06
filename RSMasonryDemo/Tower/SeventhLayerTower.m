//
//  SeventhLayerTower.m
//  RSMasonryDemo
//
//  Created by WhatsXie on 2017/9/6.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "SeventhLayerTower.h"
#import "LibHeader.h"
@interface SeventhLayerTower ()
@property (nonatomic, assign) BOOL isON;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;
@end

@implementation SeventhLayerTower

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupBlackView];
    [self frameLayout];
}
- (void)setupBlackView {
    self.backgroundView = [UIView new];
    [self.backgroundView showPlaceHolder];
    self.backgroundView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.backgroundView];
    
    self.scrollView = [UIScrollView new];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.scrollView showPlaceHolder];
    [self.backgroundView addSubview:self.scrollView];
    
    self.containerView = [UIView new];
    [self.containerView showPlaceHolder];
    self.containerView.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0) saturation:( arc4random() % 128 / 256.0) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:0.6];
    [self.scrollView addSubview:self.containerView];
}

- (void)frameLayout {
    self.backgroundView.frame = CGRectMake(0, 70, 300, 400);
    self.scrollView.frame = CGRectMake(0, 0, 200, 300);
    self.containerView.frame = CGRectMake(0, 0, 200, 50);
}
- (void)masonryLayout {
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.backgroundView);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    int count = 20;
    UIView *lastView = nil;
    
    for (int i = 1; i <= count; ++i) {
        UIView *subv = [UIView new];
        [self.containerView addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:0.6];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.containerView);
            make.height.mas_equalTo(50);
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            } else {
                make.top.mas_equalTo(self.containerView.mas_top);
            }
            
        }];
        
        lastView = subv;
        [lastView showPlaceHolder];
    }
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];

}

- (void)onOffAction {
    self.isON = !self.isON;
    if (self.isON) {
        [self masonryLayout];
        self.navigationItem.rightBarButtonItem.title = @"不充";
    } else {
        [self.backgroundView removeFromSuperview];
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
