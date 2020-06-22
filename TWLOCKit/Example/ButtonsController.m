//
//  ButtonsController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "ButtonsController.h"
#import "TWLOCKit.h"

@interface ButtonsController ()

@end

@implementation ButtonsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"%@", [[TWLUIUtil visibleViewController] description]);
    
    
    NSMutableArray *arr = [NSMutableArray array];
    NSString *a;
    NSString *b = @"b";
    [arr twl_addObject:a];
    [arr twl_addObject:b];
    
    TWLButton *btn = [TWLButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 999;
    TWL_weakify(btn);
    [btn addTouchUpInsidBlock:^(TWLButton * _Nonnull twlBtn) {
        TWL_strongify(btn);
        TWLButton *btn2 = btn;
        
        twlBtn.backgroundColor = UIColor.redColor;
    }];
    
    NSLog(@"%@", arr.description);
}



- (IBAction)sendCode:(TWLSendCodeButton *)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.sendState = TWLSendCodeButtonStateSended;
    });
}


- (IBAction)submit:(TWLLoadingButton *)sender {
    sender.loadingState = TWLLoadingButtonStateLoading;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.loadingState = TWLLoadingButtonStateNormal;
    });
   
}




@end
