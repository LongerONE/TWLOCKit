//
//  DownloadController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/7/23.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "DownloadController.h"
#import "TWLOCKit.h"

@interface DownloadController ()


@property (weak, nonatomic) IBOutlet UILabel *progressLbl;


@end

@implementation DownloadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)start:(id)sender {
//    NSString *url = @"https://nas.longer.ink:8888/%E7%8E%8B%E8%80%85%E8%8D%A3%E8%80%80/%E8%A5%BF%E6%96%BD_%E5%A4%A7%E5%8E%85.mp";
//    [TWLDownloader downloadFromUrl:url progress:^(float floatResult) {
//        self.progressLbl.text = [NSString stringWithFormat:@"%.2f", floatResult];
//    } success:^(NSString *stringResult) {
//        
//    } failed:^(NSError *errorResult) {
//            
//    }];
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
