//
//  DemoTableViewController.m
//  ChXEmptyDataViewDemo
//
//  Created by Xu Chen on 2018/9/7.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "DemoTableViewController.h"
#import "ChXEmptyDataView.h"

@interface DemoTableViewController ()
@property (nonatomic, strong) ChXEmptyDataView *emptyView;
@property (nonatomic, strong) UIButton *barButon;

@end

@implementation DemoTableViewController

- (ChXEmptyDataView *)emptyView {
    if (!_emptyView) {
        _emptyView = [ChXEmptyDataView emptyDataView];
    
        __weak __typeof(self)weakSelf = self;
        _emptyView.nextButtonDidSelecteBlock = ^(UIButton *btn) {
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        };
    }
    return _emptyView;
}

- (void)dealloc {
    NSLog(@"%@",[NSString stringWithFormat:@"%@ 类销毁了", NSStringFromClass([self class])]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = UIColor.groupTableViewBackgroundColor;
    
    [self.tableView addSubview:self.emptyView];
    
    UIButton *barButon = [UIButton buttonWithType:UIButtonTypeSystem];
    barButon.frame = CGRectMake(0, self.view.frame.size.height - 200, self.view.frame.size.width, 40);
    [barButon setTitle:@"点我选择不同类型空白图" forState:UIControlStateNormal];
    [self.view addSubview:barButon];
    [barButon addTarget:self action:@selector(barButonClicked) forControlEvents:UIControlEventTouchUpInside];
    self.barButon = barButon;
}

- (void)barButonClicked {
    UIAlertController *alertV = [UIAlertController alertControllerWithTitle:@"选择空白页类型" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"1. 未登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.emptyView.showType = EmptyTypeNotLogin;
        
        [self.barButon setTitle:action.title forState:UIControlStateNormal];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"2. 默认普通 无数据 + 无按钮" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.emptyView.showType = EmptyTypeNoData;
        
        [self.barButon setTitle:action.title forState:UIControlStateNormal];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"3. 无数据 + 无按钮视图 + 自定义图片、文字" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.emptyView.showType = EmptyTypeNoData;
        self.emptyView.imageName = @"emptyIcon_comment";
        self.emptyView.title = @"问题暂无评论";
        
        [self.barButon setTitle:action.title forState:UIControlStateNormal];
    }];
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"4. 无数据 + 按钮" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.emptyView.showType = EmptyTypeNoDataWithNextButton;
        self.emptyView.title = @"您还没有选购课程";
        self.emptyView.buttonTitle = @"选购课程";
        
        [self.barButon setTitle:action.title forState:UIControlStateNormal];
    }];
    UIAlertAction *action5 = [UIAlertAction actionWithTitle:@"5. 无下载数据（修改按钮背景颜色）" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.emptyView.showType = EmptyTypeNoDataWithNextButton;
        self.emptyView.title = @"您还没有下载过课程";
        self.emptyView.buttonTitle = @"开启下载";
        self.emptyView.buttonBackgroudColor = [UIColor colorWithRed:62.0/255.0 green:131.0/255.0 blue:229.0/255.0 alpha:1.0];
        
        [self.barButon setTitle:action.title forState:UIControlStateNormal];
    }];
    UIAlertAction *action6 = [UIAlertAction actionWithTitle:@"6. 带有子标题" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.emptyView.attributedTitle = @"亲爱的, 老用户xxx";
        self.emptyView.subTitle = @"您还没有报名学习，没有可加入的班级";
        self.emptyView.buttonTitle = @"选购课程";
        
        [self.barButon setTitle:action.title forState:UIControlStateNormal];
    }];
    UIAlertAction *action7 = [UIAlertAction actionWithTitle:@"7. 数据加载失败" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.emptyView.showType = EmptyTypeError;
        
        [self.barButon setTitle:action.title forState:UIControlStateNormal];
    }];
    
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertV addAction:action1];
    [alertV addAction:action2];
    [alertV addAction:action3];
    [alertV addAction:action4];
    [alertV addAction:action5];
    [alertV addAction:action6];
    [alertV addAction:action7];
    
    [alertV addAction:actionCancel];

    [self presentViewController:alertV animated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
