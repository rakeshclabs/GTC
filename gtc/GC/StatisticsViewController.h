//
//  StatisticsViewController.h
//  GTC
//
//  Created by Mac 23 on 10/09/12.
//
//

#import <UIKit/UIKit.h>

@interface StatisticsViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *totalgames;
@property (retain, nonatomic) IBOutlet UILabel *avgguesstime;
@property (retain, nonatomic) IBOutlet UILabel *quickestguesstime;
@property (retain, nonatomic) IBOutlet UILabel *coinsearned;
@property (retain, nonatomic) IBOutlet UILabel *starsearned;

@end
