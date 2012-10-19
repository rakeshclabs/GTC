//
//  LeadershipViewController.m
//  GTC
//
//  Created by Mac 23 on 28/08/12.
//
//

#import "LeadershipViewController.h"
#import "ScoreViewController.h"
@interface LeadershipViewController ()

@end

@implementation LeadershipViewController
@synthesize quickguess1;
@synthesize quickguess2;
@synthesize quickguess3;
@synthesize quickguess4;
@synthesize quickguess5;
@synthesize answer1;
@synthesize answer2;
@synthesize answer3;
@synthesize answer4;
@synthesize answer5;
AVAudioPlayer *audioPlayer;
@synthesize opponent_image,user_image,opponent_coins,user_coins,user_name,opponent_name,opponent_score,user_score,ans1,ans2,ans3,ans4,ans5,quicktime1,quicktime2,quicktime3,quicktime4,quicktime5;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self AddBanner];
    NSURL *url20 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Mltimedia_button_click"ofType:@"mp3"]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:url20
                   error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        audioPlayer.delegate = self;
        [audioPlayer prepareToPlay];
    }

    answer1.text=ans1;
    answer2.text=ans2;
    answer3.text=ans3;
    answer4.text=ans4;
    answer5.text=ans5;
    quickguess1.text=[quicktime1 stringByAppendingString:@"s"];
    quickguess2.text=[quicktime2 stringByAppendingString:@"s"];
    quickguess3.text=[quicktime3 stringByAppendingString:@"s"];
    quickguess4.text=[quicktime4 stringByAppendingString:@"s"];
    quickguess5.text=[quicktime5 stringByAppendingString:@"s"];

    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setAnswer1:nil];
    [self setAnswer2:nil];
    [self setAnswer3:nil];
    [self setAnswer4:nil];
    [self setAnswer5:nil];
    [self setQuickguess1:nil];
    [self setQuickguess2:nil];
    [self setQuickguess3:nil];
    [self setQuickguess4:nil];
    [self setQuickguess5:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)scorescreenbutton:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    NSString *old_User_Score=[[NSUserDefaults standardUserDefaults]valueForKey:@"OldUserScore"];
    NSLog(@"new Score=%@",user_score);
    NSLog(@"old score=%@",old_User_Score);
    if(![user_score isEqualToString:old_User_Score])
    {
        [self performSegueWithIdentifier:@"scorepage2" sender:self];
    
    }
    else
    {
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        [defaults1 setBool:YES forKey:@"next"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        int a=[[NSUserDefaults standardUserDefaults]integerForKey:@"count" ];
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:a] animated:YES ];  
    }
    

}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    
    if ([segue.identifier isEqualToString:@"scorepage2"])
    {
        ScoreViewController *vc= (ScoreViewController *)[segue destinationViewController];
            vc.user_name=@"Me";
            vc.opponent_name=opponent_name;
            vc.opponent_image=opponent_image;
            vc.user_image=user_image;
            vc.opponent_coins=opponent_coins;
            vc.user_coins=user_coins;
            vc.user_score=user_score;
            vc.opponent_score=opponent_score;
         
        
    }
}


//- (void)dealloc {
//    [answer1 release];
//    [answer2 release];
//    [answer3 release];
//    [answer4 release];
//    [answer5 release];
//    [quickguess1 release];
//    [quickguess2 release];
//    [quickguess3 release];
//    [quickguess4 release];
//    [quickguess5 release];
//    [super dealloc];
//}
-(void)AddBanner{
    bannerView = [[ADBannerView alloc]
                  initWithFrame:CGRectMake(0,0, 320, 50)];
    bannerView.requiredContentSizeIdentifiers =
    [NSSet setWithObjects:
     ADBannerContentSizeIdentifierPortrait,
     ADBannerContentSizeIdentifierLandscape, nil];
    bannerView.delegate = self;
    
}
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"banner didload");
    [self.view addSubview:bannerView];
    
}


- (BOOL)bannerViewActionShouldBegin:
(ADBannerView *)banner
               willLeaveApplication:(BOOL)willLeave
{
    return YES;
}
- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    NSLog(@"bannerViewActionDidFinish");
    
}
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"bannerView Error occureed");
}


@end
