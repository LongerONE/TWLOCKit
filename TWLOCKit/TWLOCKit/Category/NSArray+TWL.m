//
//  NSArray+TWL.m
 
//
//  Created by 唐万龙 on 2020/4/26.
//  Copyright © 2020 TangWanlong. All rights reserved.
//

#import "NSArray+TWL.h"

@implementation NSArray (TWL)


- (id)twl_objectAtIndex:(NSUInteger)index {
    if (self.count > index) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}

- (NSArray *)twl_addObject:(id _Nullable)obj {
    if ([obj isEqual:[NSNull null]]) {
        return self;
    } else if (!obj) {
        return self;
    } else {
        NSMutableArray *muArray = [NSMutableArray arrayWithArray:self];
        [muArray addObject:obj];
        return [NSArray arrayWithArray:muArray];
    }
}

@end
