//
//  PHYoutubePlayer.m
//  YoutubeApiDemo
//
//  Created by Doan Van Phuong on 10/18/19.
//  Copyright © 2019 Phuong Doan. All rights reserved.
//

#import "PHYoutubePlayer.h"

@interface PHYoutubePlayer() <YTPlayerViewDelegate>
@property (assign, nonatomic) BOOL isAutoplay;
@property (strong, nonatomic) NSString *currentVideoId;
@property (assign, nonatomic) float startSecond;
@property (assign, nonatomic) float endSecond;
@end

@implementation PHYoutubePlayer

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.isAutoplay = NO;
        self.startSecond = 0;
        self.endSecond = 0;
        self.ytplayerView = [[YTPlayerView alloc] initWithFrame:frame];
        [self addSubview:self.ytplayerView];
        [self.ytplayerView setCenter:self.center];
        self.ytplayerView.delegate = self;
    }
    return self;
}

- (void)playVideoById:(NSString *)videoId autoPlay:(BOOL)autoPlay {
    NSDictionary *playerVars = @{ @"playsinline" : @1 };
    self.startSecond = 0;
    self.endSecond = 0;
    [self.ytplayerView loadWithVideoId:videoId playerVars:playerVars];
    self.isAutoplay = autoPlay;
}

- (void)playVideoById:(NSString *)videoId
          startSecond:(float)startSecond
            endSecond:(float)endSecond
             autoPlay:(BOOL)autoPlay {
    NSDictionary *playerVars = @{ @"playsinline" : @1 };
    [self.ytplayerView loadWithVideoId:videoId playerVars:playerVars];
    self.startSecond = startSecond;
    self.endSecond = endSecond;
    self.currentVideoId = videoId;
    self.isAutoplay = autoPlay;
}

- (void)play {
    if (self.ytplayerView.playerState == kYTPlayerStatePlaying) {
        return;
    }
    if (self.startSecond > 0 && self.endSecond > 0) {
        [self.ytplayerView cueVideoById:self.currentVideoId startSeconds:self.startSecond endSeconds:self.endSecond suggestedQuality:kYTPlaybackQualityAuto];
    }
    [self.ytplayerView playVideo];
}

- (void)stop {
    [self.ytplayerView stopVideo];
}

#pragma mark - YTPlayerViewDelegate

- (void)playerViewDidBecomeReady:(YTPlayerView *)playerView {
    if (self.isAutoplay) {
        [self play];
    }
    [self.delegate PHYoutubePlayerDidBecomeReady:self];
}

- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    switch (state) {
        case kYTPlayerStateUnstarted: {
            NSLog(@"kYTPlayerStateUnstarted");
        }
            break;
        case kYTPlayerStateEnded: {
            NSLog(@"kYTPlayerStateEnded");
        }
            break;
        case kYTPlayerStateBuffering: {
            NSLog(@"kYTPlayerStateBuffering");
        }
            break;
        case kYTPlayerStatePlaying:
            NSLog(@"Star Playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            break;
        default:
            NSLog(@"kYTPlayerStateUnknown");
            break;
    }
}

- (void)playerView:(YTPlayerView *)playerView receivedError:(YTPlayerError)error {
    switch (error) {
        case kYTPlayerErrorInvalidParam: {
            NSLog(@"kYTPlayerErrorInvalidParam");
        }
            break;
        case kYTPlayerErrorHTML5Error: {
            NSLog(@"kYTPlayerErrorHTML5Error");
        }
            break;
        case kYTPlayerErrorVideoNotFound: {
            NSLog(@"kYTPlayerErrorVideoNotFound");
        }
            break;
        case kYTPlayerErrorNotEmbeddable: {
            NSLog(@"kYTPlayerErrorNotEmbeddable");
        }
            break;
        default:
            NSLog(@"kYTPlayerErrorUnknown");
            break;
    }
}

@end
