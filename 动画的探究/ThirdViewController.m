//
//  ThirdViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/13.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "ThirdViewController.h"
#import <pop/POP.h>
#import "ExampleCell.h"

@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"pop框架的动画使用";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}
#pragma mark - delegate/dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExampleCell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Facebook like And Send";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Wrong password";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"Custom VC Transition";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击选中的功能
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - lazy load
- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[ExampleCell class] forCellReuseIdentifier:@"ExampleCell"];
    return _tableView;
}

@end
