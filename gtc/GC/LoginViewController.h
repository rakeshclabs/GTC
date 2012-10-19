//
//  LoginViewController.h
//  GC
//
//  Created by Samar Singla on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateViewController.h"
#import "ASIFormDataRequest.h"
#import <AVFoundation/AVFoundation.h>
#import "SVProgressHUD.h"
#import "FacebookManager.h"
@class CreateViewController;

@interface LoginViewController : UIViewController <ASIHTTPRequestDelegate ,AVAudioPlayerDelegate,FBManagerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    int count;
    AVAudioPlayer *audioPlayer;
    IBOutlet UITextField *userName;
    IBOutlet UITextField *password;
    IBOutlet UIButton *loginButton;
    IBOutlet UIButton *regisButton;
    IBOutlet UIActivityIndicatorView *indicator;
    CreateViewController *view;
     IBOutlet UILabel *lbl;
    UIImageView *activityImage;
    NSTimer *Timer;
    BOOL FBLogedIn;
    NSDictionary *jsonNew;
    NSData *imageData;
    UIAlertView *imageAlert;
    BOOL oldUser;
}
@property (nonatomic , retain) IBOutlet UITextField *userName;
@property (nonatomic , retain) IBOutlet UITextField *password;
@property  (nonatomic , retain) IBOutlet UIButton *loginButton;
@property   (nonatomic , retain) IBOutlet UIButton *regisButton;
@property   (nonatomic , retain) UIActivityIndicatorView *indicator;
@property   (nonatomic , retain) UILabel *lbl;
@property (strong,nonatomic) NSString *access;
-(IBAction)loginButton:(id)sender;
-(IBAction)hideKeyboard:(id)sender;
@property (strong,nonatomic) NSString *days_left;
@property (strong,nonatomic) NSString *hours_left;
@property (strong,nonatomic) NSString *minutes_left;
@property (strong,nonatomic) NSString *seconds_left;
//-(IBAction)Register:(id)sender;
@end
