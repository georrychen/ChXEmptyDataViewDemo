//
//  ViewController.m
//  ChXEmptyDataViewDemo
//
//  Created by Xu Chen on 2018/9/7.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "ViewController.h"
#import "ChXEmptyDataView.h"
#import "DemoTableViewController.h"

@interface ViewController ()
@property (nonatomic, strong) ChXEmptyDataView *emptyView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.emptyView];
}

- (ChXEmptyDataView *)emptyView {
    if (!_emptyView) {
        _emptyView = [ChXEmptyDataView emptyDataView];
        
        _emptyView.showType = EmptyTypeNoDataWithNextButton;
        _emptyView.title = @"选择不同类型的空白页";
        _emptyView.buttonTitle = @"点我选择";
        
        __weak __typeof(self)weakSelf = self;
        _emptyView.nextButtonDidSelecteBlock = ^(UIButton *btn) {
            NSString *tipString = [NSString stringWithFormat:@"标题为 <%@> 的按钮被点击了",btn.titleLabel.text];
            NSLog(@"%@",tipString);
            
            DemoTableViewController *demoVc = [[DemoTableViewController alloc] init];
            [weakSelf presentViewController:demoVc animated:YES completion:nil];
        };
    }
    return _emptyView;
}

- (void)dealloc {
    NSLog(@"%@",[NSString stringWithFormat:@"%@ 类销毁了", NSStringFromClass([self class])]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
