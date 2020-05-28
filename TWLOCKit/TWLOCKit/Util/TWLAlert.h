//
//  TWLAlert.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/28.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWLBlocks.h"

NS_ASSUME_NONNULL_BEGIN

@interface TWLAlert : NSObject


#pragma mark - Alert
/// 提示信息，使用系统控件
/// @param msg 提示信息
+ (void)alertMsg:(NSString *)msg;


/// 提示信息，使用系统控件
/// @param title 标题
/// @param msg 信息
+ (void)alertTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg;


/// 提示信息及确定按钮
/// @param title 标题
/// @param msg 信息
/// @param confirm 确定按钮名称
/// @param tapBlock 点击回调
+ (void)alertTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg
           confirm:(NSString *)confirm
               tap:(TWLVoidBlock _Nullable)tapBlock;

/// 提示信息及多个按钮
/// @param title 标题
/// @param msg 信息
/// @param actions 所有操作按钮，如： @[@"取消", @"确定", @"删除"]
/// @param distructives 毁灭性操作按标题数组，如 @[@"删除"]
/// @param cancel 取消标题，如 @"取消"
/// @param tapBlock 点击回调
+ (void)alertTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg
           actions:(NSArray<NSString *> *)actions
      distructives:(NSArray<NSString *> * _Nullable)distructives
            cancel:(NSString * _Nullable)cancel
               tap:(TWLIntegerBlock _Nullable)tapBlock;


#pragma mark - Sheet

/// Action sheet 风格提示
/// @param title 标题
/// @param msg 内容
+ (void)sheetTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg;


/// Action sheet 风格提示
/// @param title 标题
/// @param msg 内容
/// @param actions 按钮
/// @param tapBlock 点击回调
+ (void)sheetTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg
           actions:(NSArray<NSString *> *)actions
               tap:(TWLIntegerBlock _Nullable)tapBlock;



/// Action sheet 风格提示
/// @param title 标题
/// @param msg 内容
/// @param actions 按钮
/// @param distructives 毁灭性按钮
/// @param cancel 取消按钮标题
/// @param tapBlock 点击回调
+ (void)sheetTitle:(NSString * _Nullable)title
               msg:(NSString * _Nullable)msg
           actions:(NSArray<NSString *> *)actions
      distructives:(NSArray<NSString *> * _Nullable)distructives
            cancel:(NSString * _Nullable)cancel
               tap:(TWLIntegerBlock _Nullable)tapBlock;

@end

NS_ASSUME_NONNULL_END
