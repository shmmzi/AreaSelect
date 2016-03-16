//
//  AreaModel.h
//  AreaSelect
//
//  Created by xhw on 16/3/16.
//  Copyright © 2016年 xhw. All rights reserved.
//

#import <Foundation/Foundation.h>

#define isValidStr(_ref) ((IsNilOrNull(_ref)==NO) && ([_ref length]>0))

#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isKindOfClass:[NSNull class]]) )

@interface AreaModel : NSObject

@property (nonatomic,copy)NSString *areaID;
@property (nonatomic,copy)NSString *parentID;
@property (nonatomic,copy)NSString *areaName;
@property (nonatomic,copy)NSString *areaPY;
@property (nonatomic,copy)NSString *areaType;

- (id)initWithDic:(NSDictionary *)dict;

@end

@interface NSDictionary (Additional)

- (NSString *)stringForKey:(NSString *)key;

@end