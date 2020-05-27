//
//  TWLHeader.h
//
//  Created by 唐万龙 on 2020/4/23.
//  Copyright © 2020 唐万龙. All rights reserved.
//

/// 唐万龙个人封装库

#ifndef TWLHeader_h
#define TWLHeader_h

#if __has_include(<TWLOCKit/TWLOCKit.h>)

#import <TWLOCKit/TWLConst.h>
#import <TWLOCKit/TWLBlocks.h>
#import <TWLOCKit/TWLView.h>
#import <TWLOCKit/TWLWebView.h>
#import <TWLOCKit/TWLButton.h>
#import <TWLOCKit/TWLGradientButton.h>
#import <TWLOCKit/TWLGradientNormalButton.h>
#import <TWLOCKit/TWLSendCodeButton.h>
#import <TWLOCKit/TWLLoadingButton.h>
#import <TWLOCKit/TWLImageView.h>
#import <TWLOCKit/TWLTextField.h>
#import <TWLOCKit/TWLTextView.h>

#import <TWLOCKit/NSDictionary+TWL.h>
#import <TWLOCKit/NSMutableDictionary+TWL.h>
#import <TWLOCKit/NSString+TWL.h>
#import <TWLOCKit/NSArray+TWL.h>
#import <TWLOCKit/NSMutableArray+TWL.h>
#import <TWLOCKit/UIColor+TWL.h>
#import <TWLOCKit/UIView+TWL.h>
#import <TWLOCKit/UIImage+TWL.h>
#import <TWLOCKit/NSObject+TWL.h>

#import <TWLOCKit/TWLSecurity.h>

#import <TWLOCKit/TWLUIUtil.h>
#import <TWLOCKit/TWLVoicePlayer.h>
#import <TWLOCKit/TWLVideoUtil.h>

#else

#import "TWLConst.h"
#import "TWLBlocks.h"
#import "TWLView.h"
#import "TWLWebView.h"
#import "TWLButton.h"
#import "TWLGradientButton.h"
#import "TWLGradientNormalButton.h"
#import "TWLSendCodeButton.h"
#import "TWLLoadingButton.h"
#import "TWLImageView.h"
#import "TWLTextField.h"
#import "TWLTextView.h"

#import "NSDictionary+TWL.h"
#import "NSMutableDictionary+TWL.h"
#import "NSString+TWL.h"
#import "NSArray+TWL.h"
#import "NSMutableArray+TWL.h"
#import "UIColor+TWL.h"
#import "UIView+TWL.h"
#import "UIImage+TWL.h"
#import "NSObject+TWL.h"

#import "TWLSecurity.h"
#import "TWLUIUtil.h"
#import "TWLVoicePlayer.h"
#import "TWLVideoUtil.h"

#endif

#endif /* TWLHeader_h */
