//
//  EighthLayerTower.m
//  RSMasonryDemo
//
//  Created by WhatsXie on 2017/9/6.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "EighthLayerTower.h"
#import "LibHeader.h"
#import "NetworkManagement.h"

#import "EighthLayerTowerTableViewCell.h"
#import "TestModel.h"

#import <YYModel.h>

#define kTableViewCell @"EighthLayerTowerTableViewCell"

@interface EighthLayerTower ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *bigArray;
@end

@implementation EighthLayerTower

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"数据刷新" style:UIBarButtonItemStylePlain target:self action:@selector(onOffAction)];
    
    
    [self setupBlackView];
    [self masonryLayout];
    
    [self testNetwork];
}

- (void)testNetwork {
    NSDictionary *para = @{@"page":@"0",
                           @"per":@"10",
                           @"type":@"29"};
    
    [NetworkManagement tsetGetRequest:APIManagerRequestTypeGet parameters:para responseCache:nil success:^(id response) {
        [self handelTestDataWith:response];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}
- (void)handelTestDataWith:(id)response {
    TestModel *model = [TestModel yy_modelWithDictionary:response];
    self.bigArray = model.list;
    
    [self.tableView reloadData];
}

- (void)setupBlackView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:self.tableView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)masonryLayout {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)onOffAction {
    [self testNetwork];
}

// TableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bigArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EighthLayerTowerTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = (EighthLayerTowerTableViewCell *)[[[NSBundle  mainBundle] loadNibNamed:kTableViewCell owner:self options:nil] lastObject];
        tableView.separatorStyle = NO;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:0.2];
    cell.textDetailLabel.text = [self.bigArray[indexPath.row] objectForKey:@"text"];
    [cell showPlaceHolder];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
