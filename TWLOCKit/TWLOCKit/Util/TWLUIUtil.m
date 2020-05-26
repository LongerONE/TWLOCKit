//
//  TWLUIUtil.m
//  JKHousekeeper
//
//  Created by 唐万龙 on 2020/5/13.
//  Copyright © 2020 Lingday. All rights reserved.
//

#import "TWLUIUtil.h"
#import "AppDelegate.h"
#import "TWLConst.h"

@implementation TWLUIUtil


+ (CGFloat)safeAreaTop {
    if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.keyWindow.safeAreaInsets.top;
    } else {
        return UIApplication.sharedApplication.keyWindow.layoutMargins.top;
    }
}

+ (CGFloat)safeAreaBottom {
    if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom;
    } else {
        return UIApplication.sharedApplication.keyWindow.layoutMargins.bottom;
    }
}

+ (CGFloat)safeAreaLeft {
    if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.keyWindow.safeAreaInsets.left;
    } else {
        return UIApplication.sharedApplication.keyWindow.layoutMargins.left;
    }
}

+ (CGFloat)safeAreaRight {
    if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.keyWindow.safeAreaInsets.right;
    } else {
        return UIApplication.sharedApplication.keyWindow.layoutMargins.right;
    }
}


+ (UIViewController *)visibleViewController {
    UIViewController *rootViewController = TWL_APPDELEGATE.window.rootViewController;
    return [self visibleViewController:rootViewController];
}


+ (UIViewController *)visibleViewController:(UIViewController *)rootViewController {
    if (rootViewController.presentingViewController) {
        return [self visibleViewController:rootViewController.presentingViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        UIViewController *lastViewController = [navigationController visibleViewController];
        return [self visibleViewController:lastViewController];
    } else  if ([rootViewController isKindOfClass:[UITabBarController class]])  {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        UIViewController *selectedViewController = tabBarController.selectedViewController;
        return [self visibleViewController:selectedViewController];
    } else {
        return rootViewController;
    }
}

@end
