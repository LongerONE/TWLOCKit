//
//  NSDate+TWL.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/28.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "NSDate+TWL.h"

@implementation NSDate (TWL)


+ (NSString *)twl_nowTimeIntervalString {
    NSDate *date = [NSDate date];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.f",timeInterval];
}

+ (NSString *)twl_nowTimeIntervalMSString {
    NSDate *date = [NSDate date];
    NSTimeInterval timeInterval = [date timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%.f",timeInterval];
}


- (NSString *)twl_stringWithFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    return [formatter stringFromDate:self];
}

@end
