//
//  LeadershipViewController.h
//  GTC
//
//  Created by Mac 23 on 28/08/12.
//
//

#import <UIKit/UIKit.h>
#import "iAd/iAd.h"
#import <AVFoundation/AVFoundation.h>

@interface LeadershipViewController : UIViewController <AVAudioPlayerDelegate,ADBannerViewDelegate>
- (IBAction)scorescreenbutton:(id)sender;

@property (strong,nonatomic) NSString *opponent_name;
@property (strong,nonatomic) NSString *user_name;
@property (strong,nonatomic) NSString *opponent_image;
@property (strong,nonatomic) NSString *user_image;
@property (strong,nonatomic) NSString *opponent_coins;
@property (strong,nonatomic) NSString *user_coins;
@property (strong,nonatomic) NSString *opponent_score;
@property (strong,nonatomic) NSString *user_score;
@property (retain, nonatomic) IBOutlet UILabel *answer1;

@property (retain, nonatomic) IBOutlet UILabel *answer2;
@property (retain, nonatomic) IBOutlet UILabel *answer3;


@property (retain, nonatomic) IBOutlet UILabel *answer4;


@property (retain, nonatomic) IBOutlet UILabel *answer5;


@property (strong,nonatomic) NSString *ans1;
@property (strong,nonatomic) NSString *ans2;
@property (strong,nonatomic) NSString *ans3;
@property (strong,nonatomic) NSString *ans4;
@property (strong,nonatomic) NSString *ans5;
@property  (nonatomic,retain)NSString *quicktime1;
@property  (nonatomic,retain)NSString *quicktime2;
@property  (nonatomic,retain)NSString *quicktime3;
@property  (nonatomic,retain)NSString *quicktime4;
@property  (nonatomic,retain)NSString *quicktime5;
@property (retain, nonatomic) IBOutlet UILabel *quickguess1;


@property (retain, nonatomic) IBOutlet UILabel *quickguess2;

@property (retain, nonatomic) IBOutlet UILabel *quickguess3;
@property (retain, nonatomic) IBOutlet UILabel *quickguess4;


@property (retain, nonatomic) IBOutlet UILabel *quickguess5;

@end
ADBannerView *bannerView;