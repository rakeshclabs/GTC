//
//  AccountSettingsViewController.h
//  GTC
//
//  Created by Mac 23 on 06/09/12.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AccountSettingsViewController : UIViewController<AVAudioPlayerDelegate>
{
    __weak IBOutlet UIButton *saveButton;
    NSString *status;
}
- (IBAction)backbutton:(id)sender;
- (IBAction)saveandclose:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *logout;
- (IBAction)logout:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *username;
@property (retain, nonatomic) IBOutlet UITextField *password;
@property (retain, nonatomic) IBOutlet UITextField *newpassword;
@property (retain, nonatomic) IBOutlet UITextField *retypepassword;
@property(retain,nonatomic) NSString *user;

@end
