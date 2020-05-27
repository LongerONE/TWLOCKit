//
//  TWLVideoUtil.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/27.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWLBlocks.h"

NS_ASSUME_NONNULL_BEGIN

@interface TWLVideoUtil : NSObject


/// 转换视频格式到 MP4
/// @param path 原视频路径
/// @param successBlock 转换成功后视频路径
/// @param failedBlock 失败
+ (void)convertMovToMp4WithFilePath:(NSString *)path sucess:(TWLStringBlock)successBlock failed:(TWLErrorBlock)failedBlock;


/// 删除已转换的视频
+ (void)removeCompressedVideoFromDocuments;

@end

NS_ASSUME_NONNULL_END
