//
//  NSMutableDictionary+TWL.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/4/29.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "NSMutableDictionary+TWL.h"

@implementation NSMutableDictionary (TWL)


- (void)twl_setObj:(id)anObject forKey:(id <NSCopying>)key {
    if ([anObject isEqual:[NSNull null]]) {
        return;
    } else if (anObject) {
        [self setObject:anObject forKey:key];
    }
};


@end
