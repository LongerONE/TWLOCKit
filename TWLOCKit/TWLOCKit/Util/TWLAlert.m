//
//  TWLAlert.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/28.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLAlert.h"
#import "TWLUIUtil.h"
#import "NSArray+TWL.h"

#import <UIKit/UIKit.h>

@interface TWLAlert ()

@property (nonatomic, assign) float dismissTimeInterval;

@end


@implementation TWLAlert

static TWLAlert *manager = nil;


+ (instancetype)shared {
    if (manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[TWLAlert alloc] init];
            
            ///默认显示时间 1.5s
            manager.dismissTimeInterval = 1.7;
        });
    }
    return manager;
}


+ (void)alertMsg:(NSString *)msg {
    [[self shared] alertMsg:msg];
}

- (void)alertMsg:(NSString *)msg {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [[TWLUIUtil visibleViewController] presentViewController:alertVC animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.dismissTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertVC dismissViewControllerAnimated:YES completion:^{
            
        }];
    });
}


+ (void)alertTitle:(NSString * _Nullable)title msg:(NSString * _Nullable)msg {
    [[self shared] alertTitle:title msg:msg];
}

- (void)alertTitle:(NSString * _Nullable)title msg:(NSString * _Nullable)msg {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [[TWLUIUtil visibleViewController] presentViewController:alertVC animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.dismissTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertVC dismissViewControllerAnimated:YES completion:^{
            
        }];
    });
}


+ (void)alertTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg
           confirm:(NSString *)confirm
               tap:(TWLVoidBlock _Nullable)tapBlock {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:confirm style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (tapBlock) {
            tapBlock();
        }
    }];
    [alertVC addAction:action];

    [[TWLUIUtil visibleViewController] presentViewController:alertVC animated:YES completion:nil];
}

+ (void)alertTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg
           actions:(NSArray<NSString *> *)actions
      distructives:(NSArray<NSString *> * _Nullable)distructives
            cancel:(NSString * _Nullable)cancel
               tap:(TWLIntegerBlock _Nullable)tapBlock {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < actions.count; i++) {
        NSString *menu = actions[i];
        UIAlertActionStyle style = UIAlertActionStyleDefault;
        if ([distructives containsObject:menu]) {
            style = UIAlertActionStyleDestructive;
        }
        
        if ([cancel isEqualToString:menu]) {
            style = UIAlertActionStyleCancel;
        }
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:menu style:style handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(i);
            }
        }];
        [alertVC addAction:action];
    }
    
    
    [[TWLUIUtil visibleViewController] presentViewController:alertVC animated:YES completion:nil];
}


+ (void)sheetTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg {
    [[self shared] sheetTitle:title msg:msg];
}


- (void)sheetTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
        [[TWLUIUtil visibleViewController] presentViewController:alertVC animated:YES completion:nil];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.dismissTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alertVC dismissViewControllerAnimated:YES completion:^{
                
            }];
        });
    
}


+ (void)sheetTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg
           actions:(NSArray<NSString *> *)actions
               tap:(TWLIntegerBlock _Nullable)tapBlock {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < actions.count; i++) {
        NSString *menu = actions[i];
        UIAlertAction *action = [UIAlertAction actionWithTitle:menu style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(i);
            }
        }];
        [alertVC addAction:action];
    }

    [[TWLUIUtil visibleViewController] presentViewController:alertVC animated:YES completion:nil];
}


+ (void)sheetTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg
           actions:(NSArray<NSString *> *)actions
      distructives:(NSArray<NSString *> * _Nullable)distructives
            cancel:(NSString * _Nullable)cancel
               tap:(TWLIntegerBlock _Nullable)tapBlock {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < actions.count; i++) {
        NSString *menu = actions[i];
        UIAlertActionStyle style = UIAlertActionStyleDefault;
        if ([distructives containsObject:menu]) {
            style = UIAlertActionStyleDestructive;
        }
        
        if ([cancel isEqualToString:menu]) {
            style = UIAlertActionStyleCancel;
        }
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:menu style:style handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(i);
            }
        }];
        [alertVC addAction:action];
    }
    
    
    [[TWLUIUtil visibleViewController] presentViewController:alertVC animated:YES completion:nil];
}



+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [super allocWithZone:zone];
        });
    }
    return manager;
}

- (id)copyWithZone:(NSZone *)zone {
    return manager;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return manager;
}


@end
