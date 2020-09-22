//
//  DownloadController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/7/23.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "AlertController.h"
#import "TWLOCKit.h"
#import "MenuView.h"

@interface AlertController ()

@end

@implementation AlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}





- (IBAction)alert:(UIButton *)sender {
    
    MenuView *view = [MenuView loadFromNib];
    view.maskAlpha = 0.6;
    view.canTapMaskDismiss = YES;
    [view showCenterWithAnimation:TWLAlertViewAnimtaionFade finish:^{
        NSLog(@"MenuView animation finish.");
    }];
    
}





@end
