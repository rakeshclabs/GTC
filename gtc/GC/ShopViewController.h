//
//  ShopViewController.h
//  GTC
//
//  Created by fgh gf on 07/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iAd/iAd.h"
#import <AVFoundation/AVFoundation.h>

@interface ShopViewController : UIViewController  <AVAudioPlayerDelegate,ADBannerViewDelegate>
{
    __weak IBOutlet UILabel *remainingHint;
    __weak IBOutlet UILabel *remainingElimination;
    
}


@property (retain, nonatomic) IBOutlet UILabel *hints;

@property (retain, nonatomic) IBOutlet UILabel *eliminations;

- (IBAction)eliminationsbutton:(id)sender;
- (IBAction)hintsbutton:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *coinlabel;
- (IBAction)addcoinsbtn:(id)sender;
- (IBAction)hint1:(id)sender;
- (IBAction)hint3:(id)sender;
- (IBAction)hint6:(id)sender;
- (IBAction)elimination1:(id)sender;
- (IBAction)elimination3:(id)sender;
- (IBAction)elimination6:(id)sender;


@end
ADBannerView *bannerView;