//
//  TWLTextField.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLTextField.h"

@implementation TWLTextField

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initActions];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initActions];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initActions];
    }
    return self;
}

- (void)initActions {
    [self addTarget:self action:@selector(textDidChanged:) forControlEvents:UIControlEventEditingChanged];
    [self addTarget:self action:@selector(editDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
}


- (void)textDidChanged:(TWLTextField *)textField {
    if (self.maxLength > 0) {
        if (self.text.length > self.maxLength) {
            self.text = [self.text substringToIndex:self.maxLength];
        }
    }
    
    __weak typeof(self) weakSelf = self;
    if (self.inputUpdateBlock) {
        self.inputUpdateBlock(weakSelf);
    }
}


- (void)editDidEnd:(TWLTextField *)textField {
    if (self.inputEndBlock) {
        __weak typeof(self) weakSelf = self;
        self.inputEndBlock(weakSelf);
    }
}


- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    
    if ([self respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    }
}

@end
