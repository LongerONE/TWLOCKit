//
//  PlayerController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/14.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "PlayerController.h"
#import "TWLOCKit.h"

@interface PlayerController ()

@end

@implementation PlayerController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)playVoice:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@""];
    [[TWLVoicePlayer sharePlayer] playURL:url finish:^{
        NSLog(@"播放完成");
    } failed:^(NSError *errorResult) {
        NSLog(@"播放失败");
    }];
}



- (IBAction)stopPlayVoice:(UIButton *)sender {
    [[TWLVoicePlayer sharePlayer] stopPlay];
}


- (IBAction)checkStatus:(id)sender {
    BOOL isPlaying = [[TWLVoicePlayer sharePlayer] isPlaying];
    NSLog(@"%@", isPlaying ? @"播放中..." : @"未播放!");
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
