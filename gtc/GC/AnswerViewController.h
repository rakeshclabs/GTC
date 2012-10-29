//
//  AnswerViewController.h
//  GC
//
//  Created by fgh gf on 19/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <AVFoundation/AVFoundation.h>
#import "FacebookManager.h"
@interface AnswerViewController : UIViewController  <AVAudioPlayerDelegate,ADBannerViewDelegate,UIGestureRecognizerDelegate,FBManagerDelegate>
{
    UIImageView *activityImage;
     id<FBManagerDelegate>_Delegate;
}

@property (retain, nonatomic) IBOutlet UILabel *oppcoinslabel;
@property (retain, nonatomic) IBOutlet UILabel *answer1;
@property (retain, nonatomic) IBOutlet UILabel *answer2;
@property (retain, nonatomic) IBOutlet UILabel *answer3;
@property (retain, nonatomic) IBOutlet UILabel *answer4;
@property (retain, nonatomic) IBOutlet UILabel *answer5;
@property (retain, nonatomic) IBOutlet UILabel *time1;

@property (retain, nonatomic) IBOutlet UILabel *time2;
@property (retain, nonatomic) IBOutlet UILabel *time3;
@property (retain, nonatomic) IBOutlet UILabel *time4;
@property (retain, nonatomic) IBOutlet UILabel *time5;
@property (retain, nonatomic) IBOutlet UIImageView *img1;
@property (strong,nonatomic) NSString *str6; 
@property (strong,nonatomic) NSString *str7;
@property (strong,nonatomic) NSString *str8;
@property (strong,nonatomic) NSString *str9;
@property (strong,nonatomic) NSString *str10;
@property (strong,nonatomic) NSString *str11;
@property (strong,nonatomic) NSString *str12;
@property (strong,nonatomic) NSString *str13;
@property (strong,nonatomic) NSString *str14;
@property (strong,nonatomic) NSString *str15;
@property (strong,nonatomic) NSString *a1;
@property (strong,nonatomic) NSString *a2;
@property (strong,nonatomic) NSString *a3;
@property (strong,nonatomic) NSString *a4;
@property (strong,nonatomic) NSString *a5;
@property (strong,nonatomic) NSString *u1;
@property (strong,nonatomic) NSString *u2;
@property (strong,nonatomic) NSString *u3;
@property (strong,nonatomic) NSString *u4;
@property (strong,nonatomic) NSString *u5;
@property (strong,nonatomic) NSString *game_id;

@property (strong,nonatomic) NSString *opponent_name;
@property (strong,nonatomic) NSString *opponent_image;
@property (strong,nonatomic) NSString *us_image;
@property (retain, nonatomic) IBOutlet UIImageView *myImage;
@property (retain, nonatomic) IBOutlet UILabel *oppnamelabel1;


@property (strong,nonatomic) NSString *otime1;
@property (strong,nonatomic) NSString *otime2;
@property (retain, nonatomic) IBOutlet UILabel *oppnamelabel;

@property (strong,nonatomic) NSString *otime3;
@property (strong,nonatomic) NSString *otime4;
@property (strong,nonatomic) NSString *otime5;

@property (retain, nonatomic) IBOutlet UIImageView *ot1;

@property (retain, nonatomic) IBOutlet UIImageView *ot2;

@property (retain, nonatomic) IBOutlet UIImageView *ot3;

@property (retain, nonatomic) IBOutlet UIImageView *ot4;
@property (strong,nonatomic) NSString *access_token;
@property (retain, nonatomic) IBOutlet UIImageView *ot5;
@property (retain, nonatomic) IBOutlet UIImageView *ut1;
@property (retain, nonatomic) IBOutlet UIImageView *ut2;
@property (retain, nonatomic) IBOutlet UIImageView *ut3;
@property (retain, nonatomic) IBOutlet UIImageView *ut4;
@property (retain, nonatomic) IBOutlet UIImageView *ut5;

@property (retain, nonatomic) IBOutlet UILabel *coins1;
@property (retain, nonatomic) IBOutlet UILabel *opp_coins;


@property (retain, nonatomic) IBOutlet UILabel *opponent_coins_previous;
@property (retain, nonatomic) IBOutlet UILabel *user_coins_previous;
@property (strong,nonatomic) NSString *opponent_coins_p;
@property (strong,nonatomic) NSString *user_coins_p;

@property (strong,nonatomic) NSString *user_score;
@property (strong,nonatomic) NSString *opponent_score;



@property (retain, nonatomic) IBOutlet UILabel *opptime1;

@property (retain, nonatomic) IBOutlet UILabel *opptime2;

@property (retain, nonatomic) IBOutlet UILabel *opptime3;
@property (retain, nonatomic) IBOutlet UILabel *opptime4;

@property (retain, nonatomic) IBOutlet UILabel *opptime5;
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
@property  (nonatomic,retain)NSString *quicktime1;
@property  (nonatomic,retain)NSString *quicktime2;
@property  (nonatomic,retain)NSString *quicktime3;
@property  (nonatomic,retain)NSString *quicktime4;
@property  (nonatomic,retain)NSString *quicktime5;




@end
ADBannerView *bannerView;
