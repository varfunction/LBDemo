//
//  ViewController.m
//  helloWatch
//
//  Created by ocean on 15/3/12.
//
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>

@interface ViewController ()

@property (strong, nonatomic) AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        _player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://stream.jewishmusicstream.com:8000"]];
}

- (IBAction)start:(id)sender
{
    [_player play];
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    [self updateScreenShowInfo];
}

- (IBAction)stop:(id)sender
{
    [_player pause];
}

- (void)setControlCenterDuration:(NSMutableDictionary*)dict
{
    [dict setValue:[NSNumber numberWithDouble:100] forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    [dict setValue:[NSNumber numberWithDouble:100] forKey:MPMediaItemPropertyPlaybackDuration];
    [dict setValue:[NSNumber numberWithInt:1] forKey:MPNowPlayingInfoPropertyPlaybackRate];
}

- (void)updateScreenLock:(NSMutableDictionary*)dict image:(UIImage*)img
{
    if (img) {
        MPMediaItemArtwork *artwork = [[MPMediaItemArtwork alloc] initWithImage:img];
        [dict setObject:artwork forKey:MPMediaItemPropertyArtwork];
    }
}

- (void)setLockScreenImage:(NSMutableDictionary*)dict
{
    UIImage *img = [UIImage imageNamed:@"testImg"];
    [self updateScreenLock:dict image:img];
}

- (void)updateScreenShowInfo
{
    if (NSClassFromString(@"MPNowPlayingInfoCenter")) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        
        [dict setObject:@"MPMediaItemPropertyTitle" forKey:MPMediaItemPropertyTitle];
        [dict setObject:@"MPMediaItemPropertyAlbumTitle" forKey:MPMediaItemPropertyAlbumTitle];
        [dict setObject:@"MPMediaItemPropertyArtist" forKey:MPMediaItemPropertyArtist];
        
        [self setLockScreenImage:dict];
        [self setControlCenterDuration:dict];
        
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:dict];
    }
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeRemoteControl) {
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlPlay:
            {
                [_player play];
            }
                break;
            case UIEventSubtypeRemoteControlTogglePlayPause:  //ios7以下，以及线控会走这儿
            {
                
            }
                break;
            case UIEventSubtypeRemoteControlPause://ios7
                [_player pause];
                break;
            case UIEventSubtypeRemoteControlNextTrack:
                [_player play];
                break;
            case UIEventSubtypeRemoteControlPreviousTrack:
                [_player play];
                break;
            default:
                break;
        }
    }
}

@end
