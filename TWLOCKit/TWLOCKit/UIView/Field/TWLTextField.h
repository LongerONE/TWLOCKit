//
//  TWLTextField.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


IB_DESIGNABLE
@interface TWLTextField : UITextField

@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

/// 输入最大长度
@property (nonatomic, assign) IBInspectable int maxLength;

@property (nonatomic, copy) void(^inputUpdateBlock)(TWLTextField *twlTextField);

@property (nonatomic, copy) void(^inputEndBlock)(TWLTextField *twlTextField);

/// 初始化操作
- (void)initActions;

@end

NS_ASSUME_NONNULL_END
