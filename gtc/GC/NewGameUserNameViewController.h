//
//  NewGameUserNameViewController.h
//  GC
//
//  Created by fgh gf on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"
#import "MediaPlayer/MediaPlayer.h"
#import "UIView+Animation.h"
#import "GPUImageFastBlurFilter.h"
#import "asyncimageview.h"
static int curveValues[] = {
    UIViewAnimationOptionCurveEaseInOut,
    UIViewAnimationOptionCurveEaseIn,
   UIViewAnimationOptionCurveEaseOut,
    UIViewAnimationOptionCurveLinear
    
};


@interface NewGameUserNameViewController : UIViewController <AVAudioPlayerDelegate,AVAudioRecorderDelegate>
{   IBOutlet UIView *view1;
    IBOutlet UIImageView *imageView;
    //   UIViewAnimationTransition *slideShow;
    IBOutlet UIButton *button1;
    UIImage *source;
    double countdown;
    double countdown1;
    double countdown2;
    double countdown3;
    
    double countdown4;
    NSTimer *timer;
    NSTimer *timer12;
    NSTimer *timer13;
    NSTimer *timer14;
    NSTimer *timer15;
    
    NSTimer *timer2;
    NSTimer *timer22;
    NSTimer *timer23;
    NSTimer *timer24;
    NSTimer *timer25;
    
    UIImage *image2;
    UIImage *image3 ;
    UIImage *image4;
    UIImage *image5;
    
    NSString *coins2;
    UIView *myView;
   
    
    
    
 GPUImageFastBlurFilter *Gpu;
    
}

@property (retain, nonatomic) IBOutlet UIImageView *progimg1;
@property (retain, nonatomic) IBOutlet UILabel *name;
@property (retain, nonatomic) IBOutlet UILabel *me;

//@property (strong,nonatomic) UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UIView *view2;

@property (nonatomic, retain) IBOutlet UIView *view3;


@property (nonatomic,retain)IBOutlet UIImageView *imageView;

@property (nonatomic , retain)IBOutlet UIView *view1;
@property (nonatomic , retain)IBOutlet UIButton *button1;
-(IBAction)button1:(id)sender;
//-(void) slideView:(UIView *)uiv_slide toReveal:(UIView *)uiv_reveal withDuration:(double)d_duration;


@property (retain, nonatomic) IBOutlet UIImageView *usernameimageviewleft;
@property (retain, nonatomic) IBOutlet UIImageView *usernameimageviewright;

@property (retain, nonatomic) IBOutlet UIProgressView *prog1;

@property (retain, nonatomic) IBOutlet  UIProgressView *prog2;
@property (retain, nonatomic) IBOutlet UIProgressView *prog3;
@property (retain, nonatomic) IBOutlet UIProgressView *prog4;
@property (retain, nonatomic) IBOutlet UIProgressView *prog5;


@property (retain, nonatomic) IBOutlet UILabel *time1;
@property (retain, nonatomic) IBOutlet UILabel *time2;
@property (retain, nonatomic) IBOutlet UILabel *time3;
@property (retain, nonatomic) IBOutlet UILabel *time4;
@property (retain, nonatomic) IBOutlet UILabel *time5;
@property (retain, nonatomic) IBOutlet UIButton *progbtn1;
@property (retain, nonatomic) IBOutlet UIButton *progbtn2;
@property (retain, nonatomic) IBOutlet UIButton *progbtn3;
@property (retain, nonatomic) IBOutlet UIButton *progbtn4;
@property (retain, nonatomic) IBOutlet UIButton *progbtn5;

@property (nonatomic,strong) NSString *audio;
@property (nonatomic,strong) NSString  *namecel;
@property (nonatomic,strong) NSString  *oppcount;
@property (nonatomic,strong) NSString *pixelated_image;
@property (nonatomic,strong) NSString *option1;
@property (nonatomic,strong) NSString *option2;
@property (nonatomic,strong) NSString *option3;
@property (nonatomic,strong) NSString *option4;
@property (nonatomic,strong) NSString *audio2;
@property (nonatomic,strong) NSString  *name2;
@property (nonatomic,strong) NSString *pixelated_image2;
@property (nonatomic,strong) NSString *option21;
@property (nonatomic,strong) NSString *option22;
@property (nonatomic,strong) NSString *option23;
@property (nonatomic,strong) NSString *option24;
@property (nonatomic,strong) NSString *audioc;
@property (nonatomic,strong) NSString  *namec;
@property (nonatomic,strong) NSString *pixelated_imagec;
@property (nonatomic,strong) NSString *option21c;
@property (nonatomic,strong) NSString *option22c;
@property (nonatomic,strong) NSString *option23c;
@property (nonatomic,strong) NSString *option24c;


@property (nonatomic,strong) NSString *audio4;
@property (nonatomic,strong) NSString  *name4;
@property (nonatomic,strong) NSString *pixelated_image4;
@property (nonatomic,strong) NSString *option41;
@property (nonatomic,strong) NSString *option42;
@property (nonatomic,strong) NSString *option43;
@property (nonatomic,strong) NSString *option44;


@property (nonatomic,strong) NSString *audio5;
@property (nonatomic,strong) NSString  *name5;
@property (nonatomic,strong) NSString *pixelated_image5;
@property (nonatomic,strong) NSString *option51;
@property (nonatomic,strong) NSString *option52;
@property (nonatomic,strong) NSString *option53;
@property (nonatomic,strong) NSString *option54;

@property (nonatomic,strong) NSString *access_token;

@property (nonatomic,strong) NSString *original_image1;
@property (nonatomic,strong) NSString *original_image2;
@property (nonatomic,strong) NSString *original_image3;
@property (nonatomic,strong) NSString *original_image4;
@property (nonatomic,strong) NSString *original_image5;




@property (retain, nonatomic) IBOutlet UILabel *oppcoinslabel;
@property (retain, nonatomic) IBOutlet UILabel *usercoinslabel;

@property (nonatomic,strong) NSString *opponent_name;

@property (nonatomic,strong) NSString *opponent_image;
@property (nonatomic,strong) NSString *us_image;

@property (nonatomic,strong) NSString *game_id;
@property (nonatomic,strong) NSString *opptime1;
@property (nonatomic,strong) NSString *opptime2;
@property (nonatomic,strong) NSString *opptime3;
@property (nonatomic,strong) NSString *opptime4;
@property (nonatomic,strong) NSString *opptime5;

@property (nonatomic,strong) NSString *opponent_coins;
@property (nonatomic,strong) NSString *user_coins;
@property (retain, nonatomic) IBOutlet UIImageView *star1;
@property  (nonatomic,retain)NSString *imageid1;
@property  (nonatomic,retain)NSString *imageid2;
@property  (nonatomic,retain)NSString *imageid3;
@property  (nonatomic,retain)NSString *imageid4;
@property  (nonatomic,retain)NSString *imageid5;

@property  (nonatomic,retain)NSString *ans1;
@property  (nonatomic,retain)NSString *ans2;
@property  (nonatomic,retain)NSString *ans3;
@property  (nonatomic,retain)NSString *ans4;
@property  (nonatomic,retain)NSString *ans5;


@property  (nonatomic,retain)NSString *quicktime1;
@property  (nonatomic,retain)NSString *quicktime2;
@property  (nonatomic,retain)NSString *quicktime3;
@property  (nonatomic,retain)NSString *quicktime4;
@property  (nonatomic,retain)NSString *quicktime5;

@property  (nonatomic,retain)NSString *user_score;
@property  (nonatomic,retain)NSString *opponent_score;




@property (retain, nonatomic) IBOutlet UIImageView *star2;

@property (retain, nonatomic) IBOutlet UIImageView *star3;

@property (retain, nonatomic) IBOutlet UIImageView *star4;

@property (retain, nonatomic) IBOutlet UIImageView *star5;
@property (retain, nonatomic) IBOutlet UIImageView *star6;
@property (retain, nonatomic) IBOutlet UIImageView *star7;
@property (retain, nonatomic) IBOutlet UIImageView *star8;
@property (retain, nonatomic) IBOutlet UIImageView *star9;
@property (retain, nonatomic) IBOutlet UIImageView *star10;
@property (retain, nonatomic) IBOutlet UIImageView *celebimagebox;

@property (retain, nonatomic) IBOutlet UIImageView *timebackground;
- (IBAction)back1:(id)sender;
@end



