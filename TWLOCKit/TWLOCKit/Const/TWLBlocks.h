//
//  TWLBlocks.h
//    
//
//  Created by 唐万龙 on 2020/4/23.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#ifndef TWLBlocks_h
#define TWLBlocks_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TWLVoidBlock)(void);
typedef void(^TWLIDBlock)(id idResult);
typedef void(^TWLULongLongBlock) (unsigned long long uLongLongResult);
typedef void(^TWLDataBlock)(NSData *dataResult);
typedef void(^TWLErrorBlock)(NSError *errorResult);
typedef void(^TWLBOOLBlock)(BOOL boolResult);
typedef void(^TWLFloatBlock)(float floatResult);
typedef void(^TWLIntegerBlock)(NSInteger integerResult);
typedef void(^TWLUIntegerBlock)(NSUInteger uIntegerResult);
typedef void(^TWLMuArrayBlock)(NSMutableArray *muArrayResult);
typedef void(^TWLArrayBlock)(NSArray *arrayResult);
typedef void(^TWLDictionaryBlock)(NSDictionary *dictResult);
typedef void(^TWLMuDictionaryBlock)(NSMutableDictionary *muDictBlock);
typedef void(^TWLStringBlock)(NSString *stringResult);


#endif /* TWLBlocks_h */
