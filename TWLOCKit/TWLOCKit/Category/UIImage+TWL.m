//
//  UIImage+TWL.m
//  Pods-TWLOCKit
//
//  Created by 唐万龙 on 2020/5/8.
//

#import "UIImage+TWL.h"
#import "TWLConst.h"

@implementation UIImage (TWL)


- (void)twl_convertToBlurImageFinish:(void(^)(UIImage *image))finishBlock {
    [self twl_convertToBlurImageWithRadius:6.0 finish:finishBlock];
}

- (void)twl_convertToBlurImageWithRadius:(float)radius finish:(void(^)(UIImage *image))finishBlock {
    dispatch_async(dispatch_queue_create(0, 0), ^{
        CIFilter *gaussianBlurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
        [gaussianBlurFilter setDefaults];
        CIImage *inputImage = [CIImage imageWithCGImage:[self CGImage]];
        [gaussianBlurFilter setValue:inputImage forKey:kCIInputImageKey];
        [gaussianBlurFilter setValue:[NSNumber numberWithFloat:radius] forKey:kCIInputRadiusKey];
        CIImage *outputImage = [gaussianBlurFilter outputImage];
        CIContext *context   = [CIContext contextWithOptions:nil];
        CGImageRef cgimg     = [context createCGImage:outputImage fromRect:[inputImage extent]];  // note, use input image extent if you want it the same size, the output image extent is larger
        UIImage *convertedImage = [UIImage imageWithCGImage:cgimg];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            finishBlock(convertedImage);
        });
    });
}




- (void)twl_compressWithSize:(CGSize)size finish:(void(^)(UIImage *image))finishBlock {
    dispatch_async(dispatch_queue_create(0, 0), ^{
        if (self.size.width == 0.0 || self.size.height == 0.0) {
            finishBlock(nil);
            return;
        }
        
        CGFloat maxWidth = MAX(size.width, size.height);
        CGSize absoluteSize;
        if (self.size.width > self.size.height) {
            CGFloat height = maxWidth * self.size.height / self.size.width;
            absoluteSize = CGSizeMake(maxWidth * TWL_SCREEN_SCALE, height * TWL_SCREEN_SCALE);
        } else {
            CGFloat width = maxWidth * self.size.width / self.size.height;
            absoluteSize = CGSizeMake(width * TWL_SCREEN_SCALE, maxWidth * TWL_SCREEN_SCALE);
        }
        
        UIGraphicsBeginImageContext(absoluteSize);
        [self drawInRect:CGRectMake(0, 0, absoluteSize.width, absoluteSize.height)];
        UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            finishBlock(resultImage);
        });
    });
}


@end
