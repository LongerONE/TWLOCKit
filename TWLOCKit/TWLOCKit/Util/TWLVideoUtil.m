//
//  TWLVideoUtil.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/27.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLVideoUtil.h"
#import "TWLConst.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

typedef void(^TWLCompressionSuccessBlock)(NSString *resultPath, float memorySize, BOOL isSuccess);

#define CompressionVideoPath [NSHomeDirectory() stringByAppendingFormat:@"/Documents/CompressionVideoField"]

@implementation TWLVideoUtil

+ (void)convertMovToMp4WithFilePath:(NSString *)path sucess:(TWLStringBlock)successBlock failed:(TWLErrorBlock)failedBlock {
    if (path.length == 0) {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:404 userInfo:@{
            NSLocalizedDescriptionKey : @"文件路径错误"
        }];
        TWL_SAFE_BLOCK_CALL(failedBlock, error);
        return;
    }
    
    NSURL *sourceURL = [NSURL fileURLWithPath:path];
    if (!sourceURL) {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:404 userInfo:@{
            NSLocalizedDescriptionKey : @"文件路径错误"
        }];
        TWL_SAFE_BLOCK_CALL(failedBlock, error);
        return;
    }
    
    BOOL hasFile = [[NSFileManager defaultManager] fileExistsAtPath:path];
    NSLog(@"%@", hasFile ? @"视频文件存在" : @"视频文件不存在");
    if (!hasFile) {
        NSError *err = [NSError errorWithDomain:NSURLErrorDomain code:404 userInfo:@{
            NSLocalizedDescriptionKey : @"视频文件不存在"
        }];
        TWL_SAFE_BLOCK_CALL(failedBlock, err);
        return;
    }
    
    
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:[NSURL fileURLWithPath:path] options:nil];
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
    
    if ([compatiblePresets containsObject:AVAssetExportPresetMediumQuality])  {
        TWL_WEAKSELF;
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset presetName:AVAssetExportPresetPassthrough];
        NSString *exportPath = [NSString stringWithFormat:@"%@/%@.mp4",
                                [NSHomeDirectory() stringByAppendingString:@"/tmp"],
                                [self getCurrentMilliSecond]];
        [[NSFileManager defaultManager] removeItemAtPath:exportPath error:nil];
        exportSession.outputURL = [NSURL fileURLWithPath:exportPath];
        NSLog(@"%@", exportPath);
        exportSession.outputFileType = AVFileTypeMPEG4;
        [exportSession exportAsynchronouslyWithCompletionHandler:^{
            switch ([exportSession status]) {
                case AVAssetExportSessionStatusFailed: {
                    NSError *error = [exportSession error];
                    TWL_SAFE_BLOCK_CALL(failedBlock, error);
                }
                    break;
                case AVAssetExportSessionStatusCancelled: {
                    NSError *error = [exportSession error];
                    TWL_SAFE_BLOCK_CALL(failedBlock, error);
                }
                    break;
                case AVAssetExportSessionStatusCompleted: {
                    
                    [weakSelf compressedVideoOtherMethodWithURL:[NSURL fileURLWithPath:exportPath]
                                                compressionType:AVAssetExportPresetMediumQuality
                                          compressionResultPath:^(NSString * _Nonnull resultPath, float memorySize, BOOL isSuccess) {
                        if (isSuccess) {
                            TWL_SAFE_BLOCK_CALL(successBlock, resultPath);
                            
                        }else{
                            NSError *err = [NSError errorWithDomain:NSURLErrorDomain code:404 userInfo:@{
                                NSLocalizedDescriptionKey : @"视频转换失败"
                            }];
                            TWL_SAFE_BLOCK_CALL(failedBlock, err);
                        }
                    }];
                }
                    break;
                default:
                    break;
            }
        }];
    }
}


+ (void)compressedVideoOtherMethodWithURL:(NSURL *)url compressionType:(NSString *)compressionType compressionResultPath:(TWLCompressionSuccessBlock)resultPathBlock {
    
    NSString *resultPath;
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    CGFloat totalSize = (float)data.length / 1024 / 1024;
    if (totalSize < 0.1 ) {
        resultPathBlock (@"", 0, NO);
        return;
    } else {
        AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:url options:nil];
        NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
        // 所支持的压缩格式中是否有 所选的压缩格式
        if ([compatiblePresets containsObject:compressionType]) {
            AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:compressionType];
            NSDateFormatter *formater = [NSDate twl_formatter];
            
            [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
            NSFileManager *manager = [NSFileManager defaultManager];
            BOOL isExists = [manager fileExistsAtPath:CompressionVideoPath];
            
            if (!isExists) {
                [manager createDirectoryAtPath:CompressionVideoPath withIntermediateDirectories:YES attributes:nil error:nil];
            }
            
            resultPath = [CompressionVideoPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4", [formater stringFromDate:[NSDate date]]]];
            exportSession.outputURL = [NSURL fileURLWithPath:resultPath];
            exportSession.outputFileType = AVFileTypeMPEG4;
            exportSession.shouldOptimizeForNetworkUse = YES;
            
            [exportSession exportAsynchronouslyWithCompletionHandler:^(void) {
                if (exportSession.status == AVAssetExportSessionStatusCompleted) {
                    NSData *data = [NSData dataWithContentsOfFile:resultPath];
                    float memorySize = (float)data.length / 1024 / 1024;
                    resultPathBlock (resultPath, memorySize,YES);
                } else {
                    resultPathBlock (resultPath, 0, NO);
                }
            }];
        } else {
            resultPathBlock (@"", 0, NO);
        }
    }
}


/**
 *  清除沙盒文件中, 压缩后的视频所有, 在使用过压缩文件后, 不进行再次使用时, 可调用该方法, 进行删除
 */

+ (void)removeCompressedVideoFromDocuments {
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:CompressionVideoPath]) {
        [[NSFileManager defaultManager] removeItemAtPath:CompressionVideoPath error:nil];
    }
}



+ (NSString *)getCurrentMilliSecond {
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970] * 1000;
    NSString *timeString = [NSString stringWithFormat:@"%.0f", timeInterval];
    return timeString;
}


@end
