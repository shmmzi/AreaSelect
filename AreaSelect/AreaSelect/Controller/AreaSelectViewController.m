//
//  AreaSelectViewController.m
//  AreaSelect
//
//  Created by xhw on 16/3/16.
//  Copyright © 2016年 xhw. All rights reserved.
//

#import "AreaSelectViewController.h"
#import "AreaSelectView.h"

@interface AreaSelectViewController()

@property (nonatomic,strong)AreaSelectView *areaSelectView;

@end

@implementation AreaSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"城市选择";
    self.view.backgroundColor = [UIColor whiteColor];

    self.areaSelectView = [[AreaSelectView alloc] initWithFrame:CGRectMake(0, TOP_OFFSET, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - TOP_OFFSET)];
    self.areaSelectView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.areaSelectView ];
    
    if(self.selectedCityBlock)
    {
        self.areaSelectView.selectedCityBlock = self.selectedCityBlock;
    }
    
}

@end
