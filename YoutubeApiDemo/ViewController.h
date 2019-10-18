//
//  ViewController.h
//  YoutubeApiDemo
//
//  Created by Doan Phuong on 11/22/15.
//  Copyright © 2015 Phuong Doan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@interface ViewController : UIViewController <YTPlayerViewDelegate>
@property (nonatomic, strong) YTPlayerView *playerView;

@end

