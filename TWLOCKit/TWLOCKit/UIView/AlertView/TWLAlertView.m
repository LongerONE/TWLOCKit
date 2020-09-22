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

@property (nonatomic, assign) TWLAlertViewPostion position;

@end

@implementation TWLAlertView


- (void)showCenterWithAnimation:(TWLAlertViewAnimtaion)animation finish:(TWLVoidBlock _Nullable)finishBlock {
    self.alpha = 0.0;
    self.position = TWLAlertViewPostionCenter;
    self.animation = animation;
    TWLButton *maskBtn = [TWLButton buttonWithType:UIButtonTypeCustom];
    maskBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    maskBtn.twl_w = TWL_SCREEN_WIDTH;
    maskBtn.twl_h = TWL_SCREEN_HEIGHT;
    [maskBtn addSubview:self];
    self.center = maskBtn.center;
    
    [UIApplication.sharedApplication.keyWindow addSubview:maskBtn];
    
    
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


- (void)showBottomFinish:(TWLVoidBlock _Nullable)finishBlock {
    self.position = TWLAlertViewPostionBottom;
    
    TWLButton *maskBtn = [TWLButton buttonWithType:UIButtonTypeCustom];
    maskBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    maskBtn.twl_w = TWL_SCREEN_WIDTH;
    maskBtn.twl_h = TWL_SCREEN_HEIGHT;
    [maskBtn addSubview:self];
    self.twl_y = TWL_SCREEN_HEIGHT;
    
    [UIApplication.sharedApplication.keyWindow addSubview:maskBtn];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        maskBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:self.maskAlpha];
        self.twl_y = TWL_SCREEN_HEIGHT + self.bottomOffset - self.twl_h;
    } completion:^(BOOL finished) {
        if (finishBlock) {
            finishBlock();
        }
    }];
    
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
    
    if (self.position == TWLAlertViewPostionCenter) {
        // 居中
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
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.twl_y = TWL_SCREEN_HEIGHT;
            self.superview.backgroundColor = [UIColor clearColor];
        } completion:^(BOOL finished) {
            [self.superview removeFromSuperview];
        }];
    }
    

}



@end
