//
//  TWLVoicePlayer.h
//  Pods-TWLOCKit
//
//  Created by 唐万龙 on 2020/5/14.
//

#import <Foundation/Foundation.h>
#import "TWLBlocks.h"

NS_ASSUME_NONNULL_BEGIN

@interface TWLVoicePlayer : NSObject

/// 播放单例，可不使用单例模式
+ (instancetype)sharePlayer;

/// 播放音频文件
/// @param url url  可网络连接，可本地文件
/// @param finishBlock finishBlock description
/// @param failedBlock failedBlock description
- (void)playURL:(NSURL *)url finish:(TWLVoidBlock)finishBlock failed:(TWLErrorBlock)failedBlock;

/// 停止播放
- (void)stopPlay;

/// 是否正在播放
- (BOOL)isPlaying;

/// 正在播放的音频
- (NSURL *)currentPlayingURL;

@end

NS_ASSUME_NONNULL_END
