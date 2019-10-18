//
//  ViewController.m
//  YoutubeApiDemo
//
//  Created by Doan Phuong on 11/22/15.
//  Copyright © 2015 Phuong Doan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.    
    NSDictionary *playerVars = @{
                                 @"playsinline" : @1,
                                 };
    
    [self setupYTView];
    [self setupButton];
    
    //load the video, initialize webview
    [self.playerView loadWithVideoId:@"JUAlTiAcX8M" playerVars:playerVars];
            
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

- (void)setupYTView {
    self.playerView = [[YTPlayerView alloc] initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 250)];
    self.playerView.delegate = self;
    [self.view addSubview:self.playerView];
}

- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state{
    switch (state) {
        case kYTPlayerStatePlaying:
            NSLog(@"Star Playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playVideo:(id)sender {
    
    //play the loaded video within time range only
    [self.playerView cueVideoById:@"JUAlTiAcX8M" startSeconds:100.0 endSeconds:110.0 suggestedQuality:kYTPlaybackQualityAuto];
    [self.playerView playVideo];
        
}

- (IBAction)stopVideo:(id)sender {
    [self.playerView stopVideo];
}
@end
