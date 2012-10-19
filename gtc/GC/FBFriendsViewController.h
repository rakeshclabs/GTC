//
//  FBFriendsViewController.h
//  WordDraw
//
//  Created by Chirag Sharma on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "asyncimageview.h"
#import <MessageUI/MessageUI.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "FacebookManager.h"
@interface FBFriendsViewController : UIViewController<UITableViewDataSource,FBManagerDelegate, UITableViewDelegate, MFMailComposeViewControllerDelegate, AVAudioPlayerDelegate> {
    AsyncImageView *asyncImageView;
    __weak IBOutlet UILabel *friendName;
    UILabel *cellLabel;
    UIImageView *settingsView;
    NSMutableArray *arrayForPictures1;
    NSMutableArray *arrayForPictures2;
    NSDictionary *json;
    UIImageView *imageViewLoading;
    UIImageView *unableToCreate;
    NSTimer *timer;
    BOOL face;
 //   AVAudioPlayer *theAudio;
    UISwitch *soundSlider;
   
}

- (IBAction)settingsPressed:(id)sender;
- (void)PostForUsernameOrEmail:(NSString *)fbid;
- (void)okClicked:(id)sender;

@property (retain, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic, strong) NSArray *fbRegFriends;
@property (nonatomic, strong) NSArray *fbNotRegFriends;

@property (nonatomic,strong) NSString *audio;
@property (nonatomic,strong) NSString  *namecel;
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

@property (nonatomic,strong) NSString *game_id;

@property (nonatomic,strong) NSString *opponent_name;

@property (nonatomic,strong) NSString *opponent_image;
@property  (nonatomic,retain)NSString *us1_image;
@property  (nonatomic,retain)NSString *imageid1;
@property  (nonatomic,retain)NSString *imageid2;
@property  (nonatomic,retain)NSString *imageid3;
@property  (nonatomic,retain)NSString *imageid4;
@property  (nonatomic,retain)NSString *imageid5;
@property (nonatomic,strong) NSString *original_image1;
@property (nonatomic,strong) NSString *original_image2;
@property (nonatomic,strong) NSString *original_image3;
@property (nonatomic,strong) NSString *original_image4;
@property (nonatomic,strong) NSString *original_image5;


@end
