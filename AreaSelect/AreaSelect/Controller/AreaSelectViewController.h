//
//  AreaSelectViewController.h
//  AreaSelect
//
//  Created by xhw on 16/3/16.
//  Copyright © 2016年 xhw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AreaModel.h"

#define TOP_OFFSET ([[UIApplication sharedApplication] statusBarFrame].size.height + 44.0)

@interface AreaSelectViewController : UIViewController

@property (nonatomic, copy) void(^selectedCityBlock)(AreaModel *);

@end
