//
//  TWLConst.h
//    
//
//  Created by 唐万龙 on 2020/4/23.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#ifndef TWLConst_h
#define TWLConst_h

#pragma mark - Screen
#define TWL_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define TWL_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define TWL_SCREEN_SCALE [UIScreen mainScreen].scale
#define TWL_ONE_PIXEL (1/[UIScreen mainScreen].scale)

#pragma mark - Safe area
#define TWL_SAFE_AREA_TOP [TWLUIUtil safeAreaTop]
#define TWL_SAFE_AREA_BOTTOM [TWLUIUtil safeAreaBottom]
#define TWL_SAFE_AREA_LEFT [TWLUIUtil safeAreaLeft]
#define TWL_SAFE_AREA_RIGHT [TWLUIUtil safeAreaRight]

#define TWL_WEAKSELF __weak typeof(self)weakSelf = self;
#define TWL_STRONGSELF __strong __typeof(weakSelf)strongSelf = weakSelf;

#define TWL_APPDELEGATE [[UIApplication sharedApplication] delegate]





#endif /* TWLConst_h */
