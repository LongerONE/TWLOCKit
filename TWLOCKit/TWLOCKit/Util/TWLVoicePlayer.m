//
//  TWLVoicePlayer.m
//  Pods-TWLOCKit
//
//  Created by 唐万龙 on 2020/5/14.
//

#import "TWLVoicePlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface TWLVoicePlayer()

@property (nonatomic, strong) AVPlayer *avPlayer;
@property (nonatomic, strong) AVPlayerItem *item;
@property (nonatomic, strong) NSURL *voiceURL;

@property (nonatomic, copy) TWLVoidBlock finishBlock;
@property (nonatomic, copy) TWLErrorBlock failedBlock;


@end

@implementation TWLVoicePlayer

static TWLVoicePlayer *player = nil;

+ (instancetype)sharePlayer {
    if (player == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            player = [[TWLVoicePlayer alloc] init];
        });
    }
    return player;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemDidFinishPlaying:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemDidFailedPlayToEndTime:) name:AVPlayerItemFailedToPlayToEndTimeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemNewErrorLogEntry:) name:AVPlayerItemNewErrorLogEntryNotification object:nil];
    }
    return self;
}

- (void)itemDidFinishPlaying:(NSNotification *)notification {
    if ([notification.object isEqual:self.item]) {
        [self callBackFinish];
    }
}

- (void)itemDidFailedPlayToEndTime:(NSNotification *)notification {
    if ([notification.object isEqual:self.item]) {
        [self callBackFailed];
    }
}


- (void)itemNewErrorLogEntry:(NSNotification *)notification {
    if ([notification.object isEqual:self.item]) {
        [self callBackFailed];
    }
}


- (void)playURL:(NSURL *)url finish:(TWLVoidBlock)finishBlock failed:(TWLErrorBlock)failedBlock {
    if ([self isPlaying]) {
        [self.avPlayer pause];
    }
 
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.finishBlock) {
            self.finishBlock();
        }
        
        self.finishBlock = finishBlock;
        self.failedBlock = failedBlock;
        self.voiceURL = url;
        
        self.item = [AVPlayerItem playerItemWithURL:url];
        self.avPlayer = [AVPlayer playerWithPlayerItem: self.item];
        [self.avPlayer addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        [self.item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        
        NSError *sessionError;
        NSError *activeError;
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:&sessionError];
        [session setActive:YES error:&activeError];
        
        [self.avPlayer play];
    });
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if ([object isEqual:self.avPlayer]) {
            if (self.avPlayer.status == AVPlayerStatusFailed || self.avPlayer.status == AVPlayerStatusUnknown) {
                [self callBackFailed];
            }
        }

        if ([object isEqual:self.item]) {
            if (self.item.status == AVPlayerItemStatusFailed || self.item.status == AVPlayerItemStatusUnknown) {
                [self callBackFailed];
            }
        }
    }
}


- (void)stopPlay {
    [self.avPlayer pause];
    [self callBackFinish];
}


- (BOOL)isPlaying {
    return self.avPlayer.rate != 0 && self.avPlayer.error == nil;
}

- (NSURL *)currentPlayingURL {
    return self.voiceURL;
}

- (void)callBackFinish {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.finishBlock) {
            self.finishBlock();
            
            self.finishBlock = nil;
            self.failedBlock = nil;
            self.voiceURL = nil;
            
            [self removeObserver];
        }
    });
}

- (void)callBackFailed {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.failedBlock) {
            self.failedBlock(self.avPlayer.error ?: self.item.error);
            
            self.finishBlock = nil;
            self.failedBlock = nil;
            self.voiceURL = nil;
            
            [self removeObserver];
        }
    });
}


- (void)removeObserver {
    @try {
        [self.avPlayer removeObserver:self forKeyPath:@"status"];
        [self.item removeObserver:self forKeyPath:@"status"];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

#pragma mark - 单例
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (player == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            player = [super allocWithZone:zone];
        });
    }
    return player;
}

- (id)copyWithZone:(NSZone *)zone {
    return player;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return player;
}



@end
