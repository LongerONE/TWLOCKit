//
//  FieldController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "FieldController.h"
#import "TWLTextField.h"

@interface FieldController ()

@property (weak, nonatomic) IBOutlet TWLTextField *textField;


@end

@implementation FieldController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.textField setInputUpdateBlock:^(TWLTextField * _Nonnull twlTextField) {
        NSLog(@"%@", twlTextField.text);
    }];
    
    [self.textField setInputEndBlock:^(TWLTextField * _Nonnull twlTextField) {
        NSLog(@"Input end.");
    }];
    
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    [self.view endEditing:YES];
}

@end
