//
//  TWLDownloader.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/7/23.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWLBlocks.h"

NS_ASSUME_NONNULL_BEGIN

@interface TWLDownloader : NSObject

+ (void)downloadFromUrl:(NSString *)url progress:(TWLFloatBlock)progressBlock success:(TWLStringBlock)successBlock failed:(TWLErrorBlock)failedBlcok;

@end

NS_ASSUME_NONNULL_END
