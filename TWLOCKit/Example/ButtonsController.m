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
