//
//  ViewController.m
//  AreaSelect
//
//  Created by xhw on 16/3/16.
//  Copyright © 2016年 xhw. All rights reserved.
//

#import "ViewController.h"
#import "AreaSelectViewController.h"
#import "AreaSelectView.h"

@interface ViewController ()
{
    UIButton *selectBtn;
    UIButton *selectBtn1;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(10,100,[UIScreen mainScreen].bounds.size.width - 20,50)];
    selectBtn.backgroundColor = [UIColor greenColor];
    [selectBtn setTitle:@"push新的ctrl显示" forState:UIControlStateNormal];
    [selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(selectBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectBtn];
    
    
    selectBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(10,200,[UIScreen mainScreen].bounds.size.width - 20,50)];
    selectBtn1.backgroundColor = [UIColor greenColor];
    [selectBtn1 setTitle:@"直接创建view" forState:UIControlStateNormal];
    [selectBtn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [selectBtn1 addTarget:self action:@selector(selectBtnAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectBtn1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectBtnAction
{
    AreaSelectViewController *ctrl = [[AreaSelectViewController alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
    
    __weak AreaSelectViewController *_ctrl = ctrl;
    [ctrl setSelectedCityBlock:^(AreaModel * info) {
        [selectBtn setTitle:info.areaName forState:UIControlStateNormal];
        [_ctrl.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)selectBtnAction1
{
    AreaSelectView *selectView = [[AreaSelectView alloc] initWithFrame:CGRectMake(0, TOP_OFFSET, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - TOP_OFFSET)];
    [self.view addSubview:selectView];
    
    __weak AreaSelectView *_selectView = selectView;
    [selectView setSelectedCityBlock:^(AreaModel * info) {
        [selectBtn1 setTitle:info.areaName forState:UIControlStateNormal];
        [_selectView removeFromSuperview];
    }];
}

@end
