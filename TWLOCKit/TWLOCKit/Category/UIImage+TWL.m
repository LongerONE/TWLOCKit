//
//  UIImage+TWL.m
//  Pods-TWLOCKit
//
//  Created by 唐万龙 on 2020/5/8.
//

#import "UIImage+TWL.h"

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


@end
