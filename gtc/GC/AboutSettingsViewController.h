//
//  AboutSettingsViewController.h
//  GTC
//
//  Created by Mac 23 on 06/09/12.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface AboutSettingsViewController : UIViewController<AVAudioPlayerDelegate>
- (IBAction)Back:(id)sender;
- (IBAction)terms:(id)sender;
- (IBAction)policy_btn:(id)sender;
- (IBAction)close_btn:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *aboutusimgview;
- (IBAction)backbtn:(id)sender;

@end
