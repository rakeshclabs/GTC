//
//  HomeViewController.h
//  GTC
//
//  Created by Mac 23 on 20/08/12.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "CreateViewController.h"
#import "FacebookManager.h"
#import "iAd/iAd.h"
@interface HomeViewController : UIViewController<FBManagerDelegate,ADBannerViewDelegate>
{
    UIImageView *activityImage;
    int count;
}


- (IBAction)settingsShow:(id)sender;

@property (strong,nonatomic) NSString *days_left;
@property (strong,nonatomic) NSString *hours_left;
@property (strong,nonatomic) NSString *minutes_left;
@property (strong,nonatomic) NSString *seconds_left;

@end
UIButton *Sound_OnOff;
UIAlertView *settingalert;
CreateViewController *view;
NSTimer *Timer;
BOOL FBLogedIn;
ADBannerView *bannerView;
UIImageView *splashrotating;