//
//  TWLSendCodeButton.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/6.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLSendCodeButton.h"
#import "TWLConst.h"

@interface TWLSendCodeButton ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) int remainTime; //剩余时间

@end

@implementation TWLSendCodeButton


- (void)setSendState:(TWLSendCodeButtonState)sendState {
    _sendState = sendState;
    
    switch (sendState) {
        case TWLSendCodeButtonStateNomal: {
            
        }
            break;
         
        case TWLSendCodeButtonStateSended: {
            self.enabled = NO;
            
            //默认倒计时 60 秒
            self.remainTime = self.countdown > 0 ? self.countdown : 60;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
            
            [self.timer fire];
        }
            break;
            
            
        case TWLSendCodeButtonStateTimeout: {
            self.enabled = YES;
            
            NSString *resendTitle = self.resendTitle.length > 0 ? self.resendTitle : @"重新发送";
            [self setTitle:resendTitle forState:UIControlStateNormal];
        }
            break;
    }
    
}


- (void)timerUpdate {
    if (self.remainTime == 0) {
          self.sendState = TWLSendCodeButtonStateTimeout;
          [self.timer invalidate];
      } else {
          NSString *resendTitle = self.resendTitle.length > 0 ? self.resendTitle : @"重新发送";
          NSString *unit = self.timeUnit.length > 0 ? self.timeUnit : @"秒";
          NSString *title = [NSString stringWithFormat:@"%@(%d%@)", resendTitle, self.remainTime, unit];
          [self setTitle:title forState:UIControlStateDisabled];
      }
      
      self.remainTime--;
}

- (void)dealloc {
    [self.timer invalidate];
}



@end
