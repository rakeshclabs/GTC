//
//  wonstarViewController.h
//  GTC
//
//  Created by Mac 23 on 18/09/12.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface wonstarViewController : UIViewController<UIGestureRecognizerDelegate,AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer;
}

@end
