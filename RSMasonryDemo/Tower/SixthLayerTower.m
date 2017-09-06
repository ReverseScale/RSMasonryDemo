
//
//  SixthLayerTower.m
//  RSMasonryDemo
//
//  Created by WhatsXie on 2017/9/6.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "SixthLayerTower.h"
#import "LibHeader.h"
@interface SixthLayerTower ()
@property (nonatomic, assign) BOOL isON;
@property (strong, nonatomic) UITextField *textField;
@end

@implementation SixthLayerTower

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupBlackView];
    [self frameLayout];
    
    // 注册键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)setupBlackView {
    self.textField = [UITextField new];
    [self.textField showPlaceHolder];
    self.textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.textField];
}

- (void)frameLayout {
    self.textField.frame = CGRectMake(10, self.view.frame.size.height - 40 - 40, self.view.frame.size.width - 20, 40);
}
- (void)masonryLayout {
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-40);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
}

#pragma mark -- 键盘即将出现 --
- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification {
    if (self.isON) {
        // 获取键盘基本信息（动画时长与键盘高度）
        NSDictionary *userInfo = [notification userInfo];
        CGRect rect = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        CGFloat keyboardHeight = CGRectGetHeight(rect);
        CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        
        // 修改下边距约束
        [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-keyboardHeight);
        }];
        
        // 更新约束
        [UIView animateWithDuration:keyboardDuration animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}
#pragma mark -- 键盘即将消失 --
- (void)keyboardWillHideNotification:(NSNotification *)notification {
    if (self.isON) {
        // 获得键盘动画时长
        NSDictionary *userInfo = [notification userInfo];
        CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        
        // 修改为以前的约束
        [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-40);
        }];

        // 更新约束
        [UIView animateWithDuration:keyboardDuration animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)onOffAction {
    self.isON = !self.isON;
    if (self.isON) {
        [self masonryLayout];
        self.navigationItem.rightBarButtonItem.title = @"不充";
    } else {
        [self.textField removeFromSuperview];
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
