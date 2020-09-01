//
//  StringController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/7/21.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "StringController.h"
#import "NSString+TWL.h"

@interface StringController ()

@end

@implementation StringController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @" Feedback post: New moderator reinstatement and appeal process revisions The new moderator agreement is now live for moderators to accept across the…";
    CGFloat height = [str twl_heightWithWidth:100 fontSize:13.0];
    NSLog(@"%f", height);
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
