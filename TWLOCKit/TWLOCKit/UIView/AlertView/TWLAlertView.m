//
//  TWLAlertView.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/9/22.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLAlertView.h"


@interface TWLAlertView()

@property (nonatomic, assign) TWLAlertViewAnimtaion animation;

@end

@implementation TWLAlertView


- (void)showCenterWithAnimation:(TWLAlertViewAnimtaion)animation finish:(TWLVoidBlock _Nullable)finishBlock {
    self.alpha = 0.0;
    self.animation = animation;
    TWLButton *maskBtn = [TWLButton buttonWithType:UIButtonTypeCustom];
    maskBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    maskBtn.twl_w = TWL_SCREEN_WIDTH;
    maskBtn.twl_h = TWL_SCREEN_HEIGHT;
    [maskBtn addSubview:self];
    self.center = maskBtn.center;
    
    [TWL_APPDELEGATE.window addSubview:maskBtn];
    
    
    if (animation == TWLAlertViewAnimtaionZoom) {
        self.transform = CGAffineTransformMakeScale(0.7, 0.7);
    }
    
    if (animation == TWLAlertViewAnimtaionZoom) {
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformMakeScale(1.1, 1.1);
            self.alpha = 1.0;
            maskBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:self.maskAlpha];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                self.transform = CGAffineTransformMakeScale(1.0, 1.0);
            } completion:^(BOOL finished) {
                if (finishBlock) {
                    finishBlock();
                }
            }];
        }];
    } else if (animation == TWLAlertViewAnimtaionFade) {
        [UIView animateWithDuration:0.3 animations:^{
            maskBtn.alpha = 1.0;
            self.alpha = 1.0;
            maskBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:self.maskAlpha];
        } completion:^(BOOL finished) {
            if (finishBlock) {
                finishBlock();
            }
        }];
    }
    
    
    
    if (self.canTapMaskDismiss) {
        TWL_WEAKSELF;
        [maskBtn addTouchUpInsidBlock:^(TWLButton * _Nonnull twlBtn) {
            [weakSelf dismiss];
        }];
    }

}


- (void)dismiss {
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    
    if (self.animation == TWLAlertViewAnimtaionFade) {
        [UIView animateWithDuration:0.3 animations:^{
            self.superview.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self.superview removeFromSuperview];
        }];
    } else {
        [UIView animateWithDuration:0.1 animations:^{
            self.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                self.superview.alpha = 0.0;
                self.transform = CGAffineTransformMakeScale(0.7, 0.7);
            } completion:^(BOOL finished) {
                [self.superview removeFromSuperview];
            }];
        }];
    }
}



@end
