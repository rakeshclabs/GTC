//
//  ScoreViewController.h
//  GTC
//
//  Created by Mac 23 on 22/08/12.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FacebookManager.h"
#import <iAd/iAd.h>
@interface ScoreViewController : UIViewController <AVAudioPlayerDelegate,ADBannerViewDelegate>
{
    __weak IBOutlet UILabel *textView;
    __weak IBOutlet UILabel *textView1;
    __weak IBOutlet UIImageView *coinImageView;
    __weak IBOutlet UILabel *finalScore;
    __weak IBOutlet UIImageView *backgroundImageView;
    
}
@property (retain, nonatomic) IBOutlet UILabel *opponentname;
@property (retain, nonatomic) IBOutlet UILabel *username;
@property (strong,nonatomic) NSString *opponent_name;
@property (strong,nonatomic) NSString *user_name;
@property (strong,nonatomic) NSString *opponent_image;
@property (strong,nonatomic) NSString *user_image;
@property (strong,nonatomic) NSString *opponent_coins;
@property (strong,nonatomic) NSString *user_coins;
@property (strong,nonatomic) NSString *opponent_score;
@property (strong,nonatomic) NSString *user_score;
@property (retain, nonatomic) IBOutlet UILabel *opscorelabel;
@property (retain, nonatomic) IBOutlet UILabel *userscorelabel;

@property (retain, nonatomic) IBOutlet UILabel *oppcoinslabel;
@property (retain, nonatomic) IBOutlet UILabel *ucoinslabel;
@property (retain, nonatomic) IBOutlet UIImageView *oppimageview;
@property (retain, nonatomic) IBOutlet UIImageView *userimageview;
@property (retain, nonatomic) IBOutlet UIImageView *star1;
@property (retain, nonatomic) IBOutlet UIImageView *star2;
@property (retain, nonatomic) IBOutlet UIImageView *star3;
@property (retain, nonatomic) IBOutlet UIImageView *star4;
@property (retain, nonatomic) IBOutlet UIImageView *star5;
@property (retain, nonatomic) IBOutlet UIImageView *star6;
@property (retain, nonatomic) IBOutlet UIImageView *star7;
@property (retain, nonatomic) IBOutlet UIImageView *star8;
@property (retain, nonatomic) IBOutlet UIImageView *star9;

@property (retain, nonatomic) IBOutlet UIImageView *star10;
@end
ADBannerView *bannerView;
