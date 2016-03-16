//
//  AreaSelectView.h
//  AreaSelect
//
//  Created by xhw on 16/3/16.
//  Copyright © 2016年 xhw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AreaModel.h"

@interface AreaSelectView : UIView

@property (nonatomic, copy) void(^selectedCityBlock)(AreaModel *);

@end
