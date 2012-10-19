//
//  CreateViewController.h
//  GC
//
//  Created by Samar Singla on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "GameViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MessageUI/MessageUI.h>
#import "FacebookManager.h"
@interface CreateViewController : UIViewController <AVAudioPlayerDelegate,UITableViewDataSource,UIScrollViewDelegate,MFMailComposeViewControllerDelegate,UITableViewDelegate,UITextFieldDelegate,FBManagerDelegate>
{
    UIView *myView;
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *settingButton;
    AVAudioPlayer *audioPlayer;
    IBOutlet UIButton *createGame;
    NSTimer *timer;
    IBOutlet UILabel *myCounterLabel;
    IBOutlet UILabel *name;
    NSString *value;
    BOOL isDragging;
    BOOL isLoading;
    
    UIView *refreshHeaderView;
    UILabel *refreshLabel;
    UIImageView *refreshArrow;
    UIActivityIndicatorView *refreshSpinner;
    
    NSString *textPull;
    NSString *textRelease;
    NSString *textLoading;
    NSTimer *tournament;
    NSTimer *tournamentminutes;
    NSTimer *tournamenthours;
    NSTimer *tournamentdays;
    NSString *userName;
    

    NSMutableArray * registered, * notRegistered;
    UIScrollView *gamesScroll;
   // GameViewController *view;
}
- (IBAction)backbtn:(id)sender;
@property (nonatomic, retain) UILabel *myCounterLabel;
@property  (nonatomic,retain)IBOutlet UIButton *createGame;
@property (nonatomic,retain) IBOutlet UILabel *name;
@property  (nonatomic,retain)NSString *value;

@property  (nonatomic,retain)NSString *days_left;
@property  (nonatomic,retain)NSString *hours_left;
@property  (nonatomic,retain)NSString *minutes_left;
@property  (nonatomic,retain)NSString *seconds_left;
@property  (nonatomic,retain)NSString *access_token;
@property  (nonatomic,retain)NSString *oppenent_coins;
@property  (nonatomic,retain)NSString *user_coins;

@property  (nonatomic,retain)NSString *oppenent_name;
@property  (nonatomic,retain)NSString *pixelated_image;
@property  (nonatomic,retain)NSString *name1;
@property  (nonatomic,retain)NSString *audio;
@property  (nonatomic,retain)NSString *option1;
@property  (nonatomic,retain)NSString *option2;
@property  (nonatomic,retain)NSString *option3;
@property  (nonatomic,retain)NSString *option4;




@property  (nonatomic,retain)NSString *pixelated_image2;
@property  (nonatomic,retain)NSString *name2;
@property  (nonatomic,retain)NSString *audio2;
@property  (nonatomic,retain)NSString *option21;
@property  (nonatomic,retain)NSString *option22;
@property  (nonatomic,retain)NSString *option23;
@property  (nonatomic,retain)NSString *option24;



@property  (nonatomic,retain)NSString *pixelated_image3;
@property  (nonatomic,retain)NSString *name3;
@property  (nonatomic,retain)NSString *audio3;
@property  (nonatomic,retain)NSString *option31;
@property  (nonatomic,retain)NSString *option32;
@property  (nonatomic,retain)NSString *option33;
@property  (nonatomic,retain)NSString *option34;



@property  (nonatomic,retain)NSString *pixelated_image4;
@property  (nonatomic,retain)NSString *name4;
@property  (nonatomic,retain)NSString *audio4;
@property  (nonatomic,retain)NSString *option41;
@property  (nonatomic,retain)NSString *option42;
@property  (nonatomic,retain)NSString *option43;
@property  (nonatomic,retain)NSString *option44;


@property  (nonatomic,retain)NSString *pixelated_image5;
@property  (nonatomic,retain)NSString *name5;
@property  (nonatomic,retain)NSString *audio5;
@property  (nonatomic,retain)NSString *option51;
@property  (nonatomic,retain)NSString *option52;
@property  (nonatomic,retain)NSString *option53;
@property  (nonatomic,retain)NSString *option54;
@property  (nonatomic,retain)NSString *ucoin;
@property  (nonatomic,retain)NSString *ocoin;
@property  (nonatomic,retain)NSString *ourl;

@property  (nonatomic,retain)NSString *opponent_image;
@property  (nonatomic,retain)NSString *us_image;
@property  (nonatomic,retain)NSString *imageid1;
@property  (nonatomic,retain)NSString *imageid2;
@property  (nonatomic,retain)NSString *imageid3;
@property  (nonatomic,retain)NSString *imageid4;
@property  (nonatomic,retain)NSString *imageid5;
@property  (nonatomic,retain)NSMutableArray *arr;

@property  (nonatomic,retain)NSMutableArray *arr1;
@property  (nonatomic,retain)NSMutableArray *images;
@property  (nonatomic,retain)NSMutableArray *names;
@property  (nonatomic,retain)NSMutableArray *coinarray;

@property  (nonatomic,retain)NSMutableArray *ucoinarray;
@property  (nonatomic,retain)NSMutableArray *user_score_arrray;
@property  (nonatomic,retain)NSMutableArray *opponent_score_array;



@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property  (nonatomic,retain)NSMutableArray *gameidarray;
@property  (nonatomic,retain)NSMutableArray *user_accept_status_array;
@property (nonatomic,retain)NSMutableArray *game_nudge_status_array;


- (void)setupStrings;
- (void)addPullToRefreshHeader;
- (void)startLoading;
- (void)stopLoading;
- (void)refresh;

- (void)reloadData;

@property (nonatomic, retain) UIView *refreshHeaderView;
@property (nonatomic, retain) UILabel *refreshLabel;
@property (nonatomic, retain) UIImageView *refreshArrow;
@property (nonatomic, retain) UIActivityIndicatorView *refreshSpinner;
@property (nonatomic, copy) NSString *textPull;
@property (nonatomic, copy) NSString *textRelease;
@property (nonatomic, copy) NSString *textLoading;



-(IBAction)createGame:(id)sender;
-(void)updateCounter:(NSTimer *)theTimer;
-(void)countdownTimer;
@property  (nonatomic,retain)NSString *original_image1;
@property  (nonatomic,retain)NSString *original_image2;

@property  (nonatomic,retain)NSString *original_image3;

@property  (nonatomic,retain)NSString *original_image4;

@property  (nonatomic,retain)NSString *original_image5;



- (IBAction)settings:(id)sender;


@end
UIImageView *meImage ;

