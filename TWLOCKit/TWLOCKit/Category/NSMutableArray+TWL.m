//
//  NSMutableArray+TWL.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/4/30.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "NSMutableArray+TWL.h"

@implementation NSMutableArray (TWL)


- (void)twl_addObject:(id _Nullable)obj {
    if ([obj isEqual:[NSNull null]]) {
       return;
    } else if (!obj) {
        return;
    } else {
        [self addObject:obj];
    }
}

@end
