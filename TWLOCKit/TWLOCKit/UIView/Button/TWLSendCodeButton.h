//
//  TWLSendCodeButton.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/6.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLGradientNormalButton.h"

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, TWLSendCodeButtonState) {
    TWLSendCodeButtonStateNomal = 0,  //未发送验证码
    TWLSendCodeButtonStateSended = 1,  //已发送验证码
    TWLSendCodeButtonStateTimeout = 2   //已超时，需重新发送
};

IB_DESIGNABLE
@interface TWLSendCodeButton : TWLGradientNormalButton


@property (nonatomic, assign) TWLSendCodeButtonState sendState;

/// 倒计时
@property (nonatomic, assign) IBInspectable int countdown;

/// 重新发送标题
@property (nonatomic, copy) IBInspectable NSString *resendTitle;

/// 时间单位如： 秒
@property (nonatomic, copy) IBInspectable NSString *timeUnit;

@end

NS_ASSUME_NONNULL_END
