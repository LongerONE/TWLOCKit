//
//  TWLDownloader.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/7/23.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLDownloader.h"

@interface TWLDownloader ()<NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@property (nonatomic, copy) TWLFloatBlock progressBlock;
@property (nonatomic, copy) TWLStringBlock successBlock;
@property (nonatomic, copy) TWLErrorBlock failedBlcok;

@end

@implementation TWLDownloader

static TWLDownloader *downloader = nil;


+ (void)downloadFromUrl:(NSString *)url progress:(TWLFloatBlock)progressBlock success:(TWLStringBlock)successBlock failed:(TWLErrorBlock)failedBlcok {
    TWLDownloader *downloader = [TWLDownloader shared];
    downloader.progressBlock = progressBlock;
    downloader.successBlock = successBlock;
    downloader.failedBlcok = failedBlcok;
    
    [downloader downloadFromUrl:url];
}

- (void)downloadFromUrl:(NSString *)url  {
    NSURL *URL = [NSURL URLWithString: url];
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    self.downloadTask = [self.session downloadTaskWithURL:URL];
    [self.downloadTask resume];
}


#pragma mark <NSURLSessionDownloadDelegate> 实现方法
/**
 *  文件下载完毕时调用
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSTemporaryDirectory();
    
    downloadTask.
    
    // 文件将要移动到的指定目录
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    // 新文件路径
    NSString *newFilePath = [documentsPath stringByAppendingPathComponent:@"QQ_V5.4.0.dmg"];
    
    NSLog(@"File downloaded to: %@",newFilePath);
    
    // 移动文件到新路径
    [[NSFileManager defaultManager] moveItemAtPath:location.path toPath:newFilePath error:nil];
    
}

/**
 *  每次写入数据到临时文件时，就会调用一次这个方法。可在这里获得下载进度
 *
 *  @param bytesWritten              这次写入的文件大小
 *  @param totalBytesWritten         已经写入沙盒的文件大小
 *  @param totalBytesExpectedToWrite 文件总大小
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
    totalBytesWritten:(int64_t)totalBytesWritten
    totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float progress = 100.0 * totalBytesWritten / totalBytesExpectedToWrite;
    if (self.progressBlock) {
        self.progressBlock(progress);
    }
}






+ (instancetype)shared {
    if (downloader == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            downloader = [[TWLDownloader alloc] init];
        });
    }
    return downloader;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (downloader == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            downloader = [super allocWithZone:zone];
        });
    }
    return downloader;
}

- (id)copyWithZone:(NSZone *)zone {
    return downloader;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return downloader;
}


@end
