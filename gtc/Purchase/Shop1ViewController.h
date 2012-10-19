//
//  Shop1ViewController.h
//  GTC
//
//  Created by Samar Singla on 30/08/12.
//  Copyright (c) 2012 samarsingla@me.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InAppManager.h"
#import "FontLabel.h"
//#import "DatabaseHandler.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "SVProgressHUD.h"
//#import "CoinBombPass.h"
#import "Reachability.h"
#import "iAd/iAd.h"


@interface Shop1ViewController : UIViewController<AVAudioPlayerDelegate,UITableViewDataSource,InAppManagerDelegate, UITableViewDelegate,ADBannerViewDelegate>{
    AVAudioPlayer *BS_player_blue;
    ADBannerView *bannerView;
    AVAudioPlayer* audioPlayercountdown,*audioPlayer;
}
- (IBAction)shopbuttonactn:(id)sender;
- (IBAction)shopupdatecoinbutton:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (retain, nonatomic) IBOutlet UILabel *coinlabel;

@end
