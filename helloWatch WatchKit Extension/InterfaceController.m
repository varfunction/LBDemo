//
//  InterfaceController.m
//  helloWatch WatchKit Extension
//
//  Created by ocean on 15/3/12.
//
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceImage *image;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)pressPlay
{
//    [self.image setImageNamed:@"img3"];
//    [self.image setImage:[UIImage imageNamed:@"img2"]];
    NSLog(@"999");
    [self.image setImageData:UIImagePNGRepresentation([UIImage imageNamed:@"img2"])];

    
//    BOOL didOpenParent = [WKInterfaceController openParentApplication:@{@"status" : @YES} reply:^(NSDictionary *replyInfo, NSError *error) {
////        NSLog(@"Reply Info: %@", replyInfo);
////        dispatch_sync(dispatch_get_main_queue(), ^{
////        });
//        [self.image setImageData:replyInfo[@"img"]];
//        NSLog(@"Error: %@", [error localizedDescription]);
//    }];
//    
//    NSLog(@"Did open parent application? %i", didOpenParent);
    
}

@end



