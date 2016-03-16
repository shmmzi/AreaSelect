//
//  DBUtil.m
//  AreaSelect
//
//  Created by xhw on 16/3/16.
//  Copyright © 2016年 xhw. All rights reserved.
//

#import "DBUtil.h"
#import "SQLiteManager.h"
#import "AreaModel.h"

@implementation DBUtil

+(SQLiteManager *)sharedManager
{
    static SQLiteManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        NSString *dbPath = [[NSBundle mainBundle]pathForResource:@"area" ofType:@"db"];
        sharedInstance = [[SQLiteManager alloc]initWithDatabaseNamed:dbPath];
    });
    return sharedInstance;
}

+ (NSDictionary *)getAllCity
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSArray *letters = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    
    for(NSString *letter in letters)
    {
        NSMutableArray *subArray = [NSMutableArray array];
        
        
        NSString *sql = [NSString stringWithFormat:@"Select * from areas where area_type = \"2\" And py_name like '%@%%' order by py_name",[letter lowercaseString]];
        
        NSArray *tmpArray = [[DBUtil sharedManager] getRowsForQuery:sql];
        for (NSDictionary *item in tmpArray)
        {
            AreaModel *model = [[AreaModel alloc] initWithDic:item];
            if(![model.areaName isEqualToString:@"省直辖县级行政单位"])
            {
                [subArray addObject:model];
            }
        }
        
        if(subArray.count > 0)
        {
            [dict setObject:subArray forKey:letter];
        }
    }
    
    return dict;
}


+ (NSMutableArray *)getCitysWithKey:(NSString *)key
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSString *sql = [NSString stringWithFormat:@"Select * from areas where area_type = \"2\" And (py_name like '%%%@%%' or area_name like '%%%@%%') order by py_name",key,key];
    
    NSArray *tmpArray = [[DBUtil sharedManager] getRowsForQuery:sql];
    for (NSDictionary *item in tmpArray)
    {
        AreaModel *model = [[AreaModel alloc] initWithDic:item];
        if(![model.areaName isEqualToString:@"省直辖县级行政单位"])
        {
            [array addObject:model];
        }
    }
    
    return array;
}

+ (AreaModel *)getCityWithName:(NSString *)cityName
{
    if(!isValidStr(cityName))
    {
        return nil;
    }
    NSString *sql = [NSString stringWithFormat:
                     @"Select * from areas where area_name = \"%@\"", cityName];
    NSArray *tmpArray = [[DBUtil sharedManager] getRowsForQuery:sql];
    if(tmpArray.count > 0)
    {
        NSDictionary *item = tmpArray.firstObject;
        AreaModel *model = [[AreaModel alloc] initWithDic:item];
        return model;
    }
    return nil;
}

@end
