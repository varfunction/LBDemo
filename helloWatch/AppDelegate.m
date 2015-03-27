//
//  AppDelegate.m
//  helloWatch
//
//  Created by ocean on 15/3/12.
//
//

#import "AppDelegate.h"
#import "ViewController.h"


#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>


@interface AppDelegate ()

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply{
    // Receives text input result from the WatchKit app extension.
    NSLog(@"111User Info: %@", userInfo);
    
    
    // Sends a confirmation message to the WatchKit app extension that the text input result was received.
//    _player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://stream.jewishmusicstream.com:8000"]];
//    [_player play];
    
    
    reply(@{@"Confirmation" : @"Text was received.",
            @"img" : UIImagePNGRepresentation([UIImage imageNamed:@"img1"])});
}

@end
