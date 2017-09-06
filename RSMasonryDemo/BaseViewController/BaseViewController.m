//
//  BaseViewController.m
//  RSMasonryDemo
//
//  Created by WhatsXie on 2017/9/6.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, assign) BOOL isON;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"充一毛" style:UIBarButtonItemStylePlain target:self action:@selector(onOffAction)];
}


- (void)onOffAction {
    self.isON = !self.isON;
    if (self.isON) {
        self.navigationItem.rightBarButtonItem.title = @"不充";
    } else {
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
