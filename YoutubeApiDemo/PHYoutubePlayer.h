//
//  PHYoutubePlayer.h
//  YoutubeApiDemo
//
//  Created by Doan Van Phuong on 10/18/19.
//  Copyright © 2019 Phuong Doan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@class PHYoutubePlayer;

NS_ASSUME_NONNULL_BEGIN

@protocol PHYoutubePlayerDelegate <NSObject>

- (void)PHYoutubePlayerDidBecomeReady:(PHYoutubePlayer *)phYoutubePlayer;

@end

@interface PHYoutubePlayer : UIView
@property (nonatomic, strong) YTPlayerView *ytplayerView;
@property (nonatomic, weak) id<PHYoutubePlayerDelegate>delegate;
- (void)playVideoById:(NSString *)videoId autoPlay:(BOOL)autoPlay;
- (void)playVideoById:(NSString *)videoId startSecond:(float)startSecond endSecond:(float)endSecond autoPlay:(BOOL)autoPlay;
- (void)play;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
