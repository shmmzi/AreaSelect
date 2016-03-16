//
//  AreaModel.m
//  AreaSelect
//
//  Created by xhw on 16/3/16.
//  Copyright © 2016年 xhw. All rights reserved.
//

#import "AreaModel.h"

@implementation AreaModel

- (id)initWithDic:(NSDictionary *)dict
{
    self = [super init];
    if(self)
    {
        self.areaID = [dict stringForKey:@"area_id"];
        self.parentID = [dict stringForKey:@"parent_id"];
        self.areaName = [dict stringForKey:@"area_name"];
        self.areaPY = [dict stringForKey:@"py_name"];
        self.areaType = [dict stringForKey:@"area_type"];
    }
    return self;
}

@end

@implementation NSDictionary (Additional)

- (NSString *)stringForKey:(NSString *)key
{
    NSString *result = nil;
    if([[self allKeys] containsObject:key])
    {
        result = [self objectForKey:key];
    }
    
    if([result isKindOfClass:[NSString class]] && isValidStr(result))
    {
        return result;
    }
    else if([result isKindOfClass:[NSNumber class]] && !IsNilOrNull(result))
    {
        return [(NSNumber *)result stringValue];
    }
    
    return nil;
}

@end