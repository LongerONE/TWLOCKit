//
//  TWLMacro.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/6/22.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#ifndef TWLMacro_h
#define TWLMacro_h



#pragma mark - Weak and strong
#define TWL_weakify(var) __weak typeof(var) twl_weak_##var = var;
#define TWL_strongify(var)  __strong typeof(var) var = twl_weak_##var;


#ifdef DEBUG
#   define TWLDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define TWLDLog(...)
#endif

#ifdef DEBUG
#   define TWL_IS_DEBUG 1
#else
#   define TWL_IS_DEBUG 0
#endif



#pragma mark - Version
#define TWL_iOSLater(x) @available(iOS x, *)

#pragma mark - Block
#define TWL_BLOCK_CALL_NO_P(block)\
(block == nil ?: block());\

#define TWL_BLOCK_CALL(block, parameter)\
(block == nil ? : block(parameter) );\

#define TWL_SAFE_BLOCK_CALL_NO_P(block)\
dispatch_async(dispatch_get_main_queue(), ^{\
(block == nil ?: block());\
});\

#define TWL_SAFE_BLOCK_CALL(block, parameter)\
dispatch_async(dispatch_get_main_queue(), ^{\
(block == nil ? : block(parameter) );\
});\



#endif /* TWLMacro_h */
