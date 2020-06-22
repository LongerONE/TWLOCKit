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

#endif /* TWLMacro_h */
