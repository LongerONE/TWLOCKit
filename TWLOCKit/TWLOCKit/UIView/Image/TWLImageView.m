//
//  TWLImageView.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLImageView.h"
#import "TWLConst.h"
#import "NSString+TWL.h"
#import "UIImage+TWL.h"


static NSCache *_cache;

@implementation TWLImageView


- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    
    self.layer.borderColor = borderColor.CGColor;
}


- (void)setOnePixelBorder:(BOOL)onePixelBorder {
    _onePixelBorder = onePixelBorder;

    self.layer.borderWidth = onePixelBorder ? TWL_ONE_PIXEL : self.borderWidth;
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    
    self.layer.cornerRadius = self.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    
    if (!self.onePixelBorder) {
        self.layer.borderWidth = borderWidth;
    }
}

- (void)setShadowColor:(UIColor *)shadowColor {
    _shadowColor = shadowColor;
    
    self.layer.shadowColor = [shadowColor CGColor];
}


- (void)setShadowOffset:(CGSize)shadowOffset {
    _shadowOffset = shadowOffset;
    
    self.layer.shadowOffset = shadowOffset;
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    _shadowRadius = shadowRadius;
    
    self.layer.shadowRadius = shadowRadius;
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity {
    CGFloat opacity = shadowOpacity > 1 ? 1 : shadowOpacity;
    _shadowOpacity = opacity;
    
    self.layer.shadowOpacity = opacity;
}


- (void)setPlaceholderImg:(UIImage *)placeholderImg {
    _placeholderImg = placeholderImg;
    if (!self.image) {
        self.image = placeholderImg;
    }
}

- (void)setImgUrl:(NSString *)imgUrl {
    if (![self.imgUrl isEqualToString:imgUrl]) {
        // url 变化
        self.image = self.placeholderImg;
    }
    
    _imgUrl = imgUrl;
    
    NSURL *URL = [NSURL URLWithString:imgUrl.twl_toUrlEncode];
    // 读取缓存
    if (!_cache) {
        _cache = [[NSCache alloc] init];
    }
    
    UIImage *cacheImg = [_cache objectForKey:imgUrl];
    if (cacheImg) {
        self.image = cacheImg;
    } else {
        TWL_WEAKSELF;
        CGSize size = self.frame.size;
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:URL
                                                                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data.length) {
                UIImage *img = [UIImage imageWithData:data];
                if (weakSelf.optimizeMem) {
                    [img twl_compressWithSize:size finish:^(UIImage * _Nonnull image) {
                        [weakSelf showImage:image url:weakSelf.imgUrl];
                    }];
                } else {
                    [weakSelf showImage:img url:weakSelf.imgUrl];
                }
            }
        }];
        [task resume];
    }
}



- (void)showImage:(UIImage *)img url:(NSString *)imgUrl {
    [_cache setObject:img forKey:imgUrl];
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([imgUrl isEqualToString:self.imgUrl]) {
            self.image = img;
        }
    });
}

@end
