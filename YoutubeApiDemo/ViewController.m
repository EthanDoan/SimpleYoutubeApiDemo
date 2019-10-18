//
//  ViewController.m
//  YoutubeApiDemo
//
//  Created by Doan Phuong on 11/22/15.
//  Copyright © 2015 Phuong Doan. All rights reserved.
//

#import "ViewController.h"
#import "PHYoutubePlayer.h"

@interface ViewController () <PHYoutubePlayerDelegate>
@property (nonatomic, strong) PHYoutubePlayer *phYoutubePlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupButton];
    
    //using wrapper class
    self.phYoutubePlayer = [[PHYoutubePlayer alloc] initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 250)];
//    self.phYoutubePlayer.alpha = 0;
//    [self.phYoutubePlayer setUserInteractionEnabled:NO];
    self.phYoutubePlayer.delegate = self;
    [self.view addSubview:self.phYoutubePlayer];
    [self.phYoutubePlayer playVideoById:@"0NXnFSTCmJI" startSecond:600.0 endSecond:1000.0 autoPlay:YES];
    
    /*
    NSDictionary *playerVars = @{
        @"playsinline" : @1,
    };
    [self setupYTView];
    //load the video, initialize webview
    [self.playerView loadWithVideoId:@"JUAlTiAcX8M" playerVars:playerVars];
    */
}

- (void)setupButton {
    UIButton *playBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [playBtn setTitle:@"Play" forState:UIControlStateNormal];
    [playBtn setTintColor:[UIColor blueColor]];
    [playBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(playVideo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBtn];
    [playBtn setCenter:self.view.center];
}

/*
- (void)setupYTView {
    self.playerView = [[YTPlayerView alloc] initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 250)];
    self.playerView.delegate = self;
    [self.view addSubview:self.playerView];
}
*/
 
#pragma mark - PHYoutubePlayerDelegate

- (void)PHYoutubePlayerDidBecomeReady:(PHYoutubePlayer *)phYoutubePlayer {

}

/*
- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state{
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

- (void)playerViewDidBecomeReady:(YTPlayerView *)playerView {
    NSLog(@"playerViewDidBecomeReady");
    //set video auto play here
}
*/


- (IBAction)playVideo:(id)sender {
    
    //play the loaded video within time range only
//    [self.playerView cueVideoById:@"JUAlTiAcX8M" startSeconds:100.0 endSeconds:110.0 suggestedQuality:kYTPlaybackQualityAuto];
//    [self.playerView playVideo];
        
    [self.phYoutubePlayer play];
    
}

@end
