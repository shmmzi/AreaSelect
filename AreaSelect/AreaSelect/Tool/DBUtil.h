//
//  DBUtil.h
//  AreaSelect
//
//  Created by xhw on 16/3/16.
//  Copyright © 2016年 xhw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AreaModel;

@interface DBUtil : NSObject

/**
 *  获取所有城市，并按照字母分组插入到字典中
 *  {
 *      “A”:[{city1},{city2}...],
 *      “B”:[{city1},{city2}...],
 *  }
 *
 *  @return
 */
+ (NSDictionary *)getAllCity;

/**
 *  根据城市名字获取城市数据，获取定位城市，历史记录中的数据
 *
 *  @param cityName
 *
 *  @return
 */
+ (AreaModel *)getCityWithName:(NSString *)cityName;

/**
 *  检索用，根据输入框内容动态获取符合条件的城市数据
 *
 *  @param key
 *
 *  @return
 */
+ (NSMutableArray *)getCitysWithKey:(NSString *)key;

@end
