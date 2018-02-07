//
//  TableViewController.m
//  RSMasonryDemo
//
//  Created by WhatsXie on 2017/9/6.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (nonatomic, strong) NSArray *viewControllerArray;
@property (nonatomic, strong) NSArray *controllerTitleArray;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewControllerArray = @[@"FirstLayerTower",
                                 @"SecondLayerTower",
                                 @"ThirdLayerTower",
                                 @"FourthLayerTower",
                                 @"FifthLayerTower",
                                 @"SixthLayerTower",
                                 @"SeventhLayerTower",
                                 @"EighthLayerTower",
                                 @"NinthLayerTower"];
    
    self.controllerTitleArray = @[@"第一层",
                                  @"第二层",
                                  @"第三层",
                                  @"第四层",
                                  @"第五层",
                                  @"第六层",
                                  @"第七层",
                                  @"第八层",
                                  @"第九层",];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- TableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.viewControllerArray[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = self.controllerTitleArray[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
}
@end
