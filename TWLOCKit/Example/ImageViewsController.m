//
//  ImageViewsController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "ImageViewsController.h"

@interface ImageViewsController ()

@property (weak, nonatomic) IBOutlet TWLImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *lbl;


@end

@implementation ImageViewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}




- (IBAction)slide:(UISlider *)sender {
    self.lbl.text = [NSString stringWithFormat:@"模糊半径：%f", sender.value];
    UIImage *img = [UIImage imageNamed:@"1"];
    [img twl_convertToBlurImageWithRadius:sender.value finish:^(UIImage * _Nonnull image) {
        self.imgView.image = image;
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
