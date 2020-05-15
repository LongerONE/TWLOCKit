//
//  NSObject+TWL.m
//  Pods-TWLOCKit
//
//  Created by 唐万龙 on 2020/5/8.
//

#import "NSObject+TWL.h"

@implementation NSObject (TWL)

- (id)twl_changeNullType {
    if ([self isEqual:[NSNull null]]) {
        return nil;
    } else if ([self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSArray class]]) {
        return [self changeType:self];
    } else {
        return self;
    }
}

//类型识别:将所有的NSNull类型转化成@""
- (id)changeType:(id)myObj {
    if ([myObj isKindOfClass:[NSDictionary class]]) {
        return [self nullDic:myObj];
    } else if([myObj isKindOfClass:[NSArray class]]) {
        return [self nullArr:myObj];
    } else if([myObj isKindOfClass:[NSString class]]) {
        return [self stringToString:myObj];
    } else if([myObj isKindOfClass:[NSNull class]]){
        return [self nullToString];
    } else {
        return myObj;
    }
}


//将NSDictionary中的Null类型的项目转化成@""
- (NSDictionary *)nullDic:(NSDictionary *)myDic {
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++) {
        id obj = [myDic objectForKey:keyArr[i]];
        
        obj = [self changeType:obj];
        
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}

//将NSDictionary中的Null类型的项目转化成@""
- (NSArray *)nullArr:(NSArray *)myArr {
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++) {
        id obj = myArr[i];
        
        obj = [self changeType:obj];
        
        [resArr addObject:obj];
    }
    return resArr;
}

- (NSString *)stringToString:(NSString *)string {
    return string;
}

//将Null类型的项目转化成@""
- (NSString *)nullToString {
    return @"";
}





@end
