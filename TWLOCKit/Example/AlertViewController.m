//
//  AlertViewController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/28.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "AlertViewController.h"
#import "TWLAlert.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
}


- (IBAction)alert:(id)sender {
    [TWLAlert alertMsg:@"提示内容"];
}



- (IBAction)alertTitle:(id)sender {
    [TWLAlert alertTitle:@"提示" msg:@"该消息有标题"];
}




- (IBAction)alertMenus:(id)sender {
    NSArray *menus = @[ @"删除", @"取消", @"再看看"];
    [TWLAlert alertTitle:@"提示"
                     msg:@"是否删除"
                 actions:menus
            distructives:@[@"删除"]
                  cancel:@"取消"
                     tap:^(NSInteger integerResult) {
        NSLog(@"点击了：%@", menus[integerResult]);
    }];
}


- (IBAction)alertConfirm:(id)sender {
//    [TWLAlert alertTitle:@"提示" msg:@"两次密码不一致" confirm:@"确定" tap:^{
//        NSLog(@"确定");
//    }];
//
    
    [TWLAlert alertTitle:nil msg:@"两次密码不一致" confirm:@"确定" tap:nil];
}







- (IBAction)sheet:(id)sender {
    [TWLAlert sheetTitle:@"标题" msg:nil];
}






- (IBAction)sheetMenus:(id)sender {
    NSArray *menus = @[ @"删除", @"取消", @"再看看"];
    [TWLAlert sheetTitle:@"提示"
                     msg:@"是否删除"
                 actions:menus
            distructives:@[@"删除"]
                  cancel:@"取消"
                     tap:^(NSInteger integerResult) {
        NSLog(@"点击了：%@", menus[integerResult]);
    }];
}



- (IBAction)sheetMenu:(id)sender {
    
    [TWLAlert sheetTitle:@"选择照片" msg:nil actions:@[@"拍摄", @"从相册选择"] tap:^(NSInteger integerResult) {
        switch (integerResult) {
            case 0:
                NSLog(@"拍摄");
                break;
                
            case 1:
                NSLog(@"相册");
                break;
                
            default:
                break;
        }
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
