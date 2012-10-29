//
//  ScoreViewController.m
//  GTC
//
//  Created by Mac 23 on 22/08/12.
//
//

#import "ScoreViewController.h"
#import "UIView+Animation.h"
#import "wonstarViewController.h"
@interface ScoreViewController ()

@end

@implementation ScoreViewController
@synthesize opscorelabel;
@synthesize userscorelabel;
@synthesize oppcoinslabel;
@synthesize ucoinslabel;
@synthesize oppimageview;
@synthesize userimageview;
@synthesize star1;
@synthesize star2;
@synthesize star3;
@synthesize star4;
@synthesize star5;
@synthesize star6;
@synthesize star7;
@synthesize star8;
@synthesize star9;
@synthesize star10;
AVAudioPlayer *audioPlayer;
@synthesize opponentname;
@synthesize username,opponent_image,user_image,opponent_coins,user_coins,user_name,opponent_name,opponent_score,user_score;

int noofstarp=0;
int noofstara=0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)count:(id)sender{
   /* UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,270,190)];
    imgview.image=[UIImage imageNamed:@"1.jpg"];
    */
   
    if([opponent_score intValue]==1)
    {
    
    [opscorelabel removeFromSuperview];
   
    
     //   [imgview addSubview:opscorelabel];
    
    [self attachPopUpAnimationToView:opscorelabel];
    
    [self.view addSubviewWithFadeAnimation:opscorelabel duration:0.5 option:UIViewAnimationCurveEaseOut];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    
    
    
   
    
    
    }
    else{
        [userscorelabel removeFromSuperview];
        
        
        //   [imgview addSubview:opscorelabel];
        
        [self attachPopUpAnimationToView:userscorelabel];
        
        [self.view addSubviewWithFadeAnimation:userscorelabel duration:0.5 option:UIViewAnimationCurveEaseOut];
        
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        
        
    }
    
    
}

- (void) attachPopUpAnimationToView:(UIView *)myView

{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      
                                      animationWithKeyPath:@"transform"];
    
    
    
    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    
    CATransform3D scale2 = CATransform3DMakeScale(0.7, 0.7, 1);
    
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            
                            [NSValue valueWithCATransform3D:scale1],
                            
                            [NSValue valueWithCATransform3D:scale2],
                            
                            [NSValue valueWithCATransform3D:scale3],
                            
                            [NSValue valueWithCATransform3D:scale4],
                            
                            nil];
    
    [animation setValues:frameValues];
    
    
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           
                           [NSNumber numberWithFloat:0.0],
                           
                           [NSNumber numberWithFloat:0.5],
                           
                           [NSNumber numberWithFloat:0.9],
                           
                           [NSNumber numberWithFloat:1.0],
                           
                           nil];
    
    [animation setKeyTimes:frameTimes];
    
    
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.removedOnCompletion = NO;
    
    animation.duration = 0.5;
    
    
    
    [myView.layer addAnimation:animation forKey:@"popup"];
    
}

-(void) slideView:(UIView *)uiv_slide withDuration:(double)d_duration toX:(CGFloat)xValue andY:(CGFloat)yValue {
    
    
    
    
    
    //Make an animation to slide the view off the screen
    
    
    
    [UIView animateWithDuration:d_duration
     
     
     
                     animations:^ {  //uiv_slide.center = CGPointMake(xValue,yValue);
                         
                         [uiv_slide setFrame:CGRectMake(xValue, yValue, uiv_slide.frame.size.width, uiv_slide.frame.size.height)];
                         
                         
                         
                     }completion:^(BOOL finished) {
                         
                         
                         
                         
                         
                     }
     
     ];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    textView1.backgroundColor=[UIColor clearColor];
    textView.backgroundColor=[UIColor clearColor];
    [backgroundImageView addSubview:textView];
    [backgroundImageView addSubview:textView1];
    NSString *old_User_Score=[[NSUserDefaults standardUserDefaults]valueForKey:@"OldUserScore"];
    NSLog(@"new Score=%@",user_score);
    NSLog(@"old score=%@",old_User_Score);
    if(![user_score isEqualToString:old_User_Score])
    {
        opscorelabel.text=opponent_score ;
        textView1.text=user_score;
        textView.text=[NSString stringWithFormat:@"%d",user_score.intValue-1];
        [self slideView:textView1 withDuration:1 toX:205 andY:125];
        [self slideView:textView withDuration:1 toX:205 andY:185];
        
    }
    else
    {
         textView.text=user_score;
        OppLabel.text=opponent_score;
        opscorelabel.text=[NSString stringWithFormat:@"%d",opponent_score.intValue-1];
        [self slideView:OppLabel withDuration:1 toX:56 andY:125];
        [self slideView:opscorelabel withDuration:1 toX:56 andY:185];
       
    }
    
  //  userscorelabel.text=user_score;
    
    

    
    
    coinImageView.animationImages = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"circle1.png"],[UIImage imageNamed:@"circle2.png"], [UIImage imageNamed:@"circle3.png"], [UIImage imageNamed:@"circle4.png"],[UIImage imageNamed:@"circle5.png"],[UIImage imageNamed:@"circle6.png"],[UIImage imageNamed:@"circle7.png"],[UIImage imageNamed:@"circle8.png"],[UIImage imageNamed:@"circle9.png"],[UIImage imageNamed:@"circle10.png"],nil];
   // [self.view addSubview:meImage];
    //[self attachPopUpAnimationToView:imageView];
    
    
    if(![coinImageView isAnimating]) {
        NSLog(@"no");
        coinImageView.animationDuration=3;
        [coinImageView startAnimating];
    }
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [self performSelector:@selector(stopAnimation) withObject:nil afterDelay:2.3]; 
    
}
-(void)stopAnimation
{
    [coinImageView stopAnimating];
    NSString *score=[[NSUserDefaults standardUserDefaults]valueForKey:@"newCoins"];
    finalScore.text=[NSString stringWithFormat:@"You Earned %@",score];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"noofstarp=%d",noofstarp);
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
    [self AddBanner];
    
    //[self count:nil];
    //[self count:nil];
    oppimageview.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:opponent_image]]];
userimageview.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user_image]]];
    
    opponentname.text=opponent_name;
    
    username.text=user_name;
    oppcoinslabel.text=opponent_coins;
    ucoinslabel.text=user_coins;
    
   
    NSLog(@"%@",opponent_coins);
  
    
    if([opponent_coins intValue]>=2000)
    {
        star1.image=[UIImage imageNamed:@"star@2x.png"];
    }
    if([opponent_coins intValue]>=4000)
    {
        star2.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([opponent_coins intValue] >=8000)
    {
        star3.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([opponent_coins intValue]>=16000)
    {
        star4.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([opponent_coins intValue]>=32000)
    {
        star5.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([user_coins intValue]>=2000)
    {
        star6.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([user_coins intValue]>=4000)
    {
        star7.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([user_coins intValue]>=8000)
    {
        star8.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([user_coins intValue]>=16000)
    {
        star9.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([user_coins intValue]>=32000)
    {
        star10.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    
       
    NSString *str=[[NSUserDefaults standardUserDefaults]objectForKey:@"coinsforstars"];
    NSLog(@"str=%@",str);
    if([str intValue]<2000)
    {
        noofstarp=0;
    }
    if([str intValue]>=2000)
    {
        noofstarp=1;
    }
    if([str intValue]>=4000)
    {
        noofstarp=2;
    }
    if([str intValue]>=8000)
    {
        noofstarp=3;
        
        
    }
    if([str intValue]>=16000)
    {
        noofstarp=4;
    }
    if([str intValue]>=32000)
    {
        noofstarp=5;
    }
    
    if([user_coins intValue]<2000)
    {
        noofstara=0;
    }
    if([user_coins intValue]>=2000)
    {
        noofstara=1;
    }
    if([user_coins intValue]>=4000)
    {
        noofstara=2;
    }
    if([user_coins intValue]>=8000)
    {
        noofstara=3;
        
        
    }
    if([user_coins intValue]>=16000)
    {
        noofstara=4;
    }
    if([user_coins intValue]>=32000)
    {
        noofstara=5;
    }

    NSLog(@"noofstara=%d",noofstara);
    NSLog(@"noofstarp=%d",noofstarp);
    
    if(noofstara>noofstarp)
{
        wonstarViewController *a=[[wonstarViewController alloc]initWithNibName:@"wonstarViewController" bundle:nil];
        //  a.userName =userName;
        [self.navigationController pushViewController:a animated:YES];
        
        
        
        // Do any additional setup after loading the view from its nib.
    }


	// Do any additional setup after loading the view.
}
-(void)AddBanner{
    bannerView = [[ADBannerView alloc]
                  initWithFrame:CGRectMake(0,230, 320, 50)];
    bannerView.requiredContentSizeIdentifiers =
    [NSSet setWithObjects:
     ADBannerContentSizeIdentifierPortrait,
     ADBannerContentSizeIdentifierLandscape, nil];
    bannerView.delegate = self;
    
}
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"banner didload");
   // [self.view addSubview:bannerView];
    
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

- (void)viewDidUnload
{
    [self setOpponentname:nil];
    [self setUsername:nil];
    [self setOppcoinslabel:nil];
    [self setUcoinslabel:nil];
    [self setOppimageview:nil];
    [self setUserimageview:nil];
    [self setStar1:nil];
    [self setStar2:nil];
    [self setStar3:nil];
    [self setStar4:nil];
    [self setStar5:nil];
    [self setStar6:nil];
    [self setStar7:nil];
    [self setStar8:nil];
    [self setStar9:nil];
    [self setStar10:nil];
    [self setOpscorelabel:nil];
    [self setUserscorelabel:nil];
    textView = nil;
    coinImageView = nil;
    finalScore = nil;
    backgroundImageView = nil;
    textView1 = nil;
    OppLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)mainmenu:(id)sender {
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    
    
    
   // NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    
    // [defaults1 setObject:info forKey:@"next"];
   // [defaults1 setBool:YES forKey:@"next"];
    //[[NSUserDefaults standardUserDefaults] synchronize];
    
    
    int a=[[NSUserDefaults standardUserDefaults]integerForKey:@"count" ];
    NSLog(@"a=%d",a);
   // if([[NSUserDefaults standardUserDefaults]boolForKey:@"loginplay"])
   // {
 //   [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:a+1] animated:YES ];
         

  //  }
   // else{
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:a] animated:YES ];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadTable" object:nil];
    
    //}
}




- (IBAction)share_on_facebook:(id)sender 
{
     [[FacebookManager facebookConnect]Call_Share_Dialog];
}
//- (void)dealloc {
//    [opponentname release];
//    [username release];
//    [oppcoinslabel release];
//    [ucoinslabel release];
//    [oppimageview release];
//    [userimageview release];
//    [star1 release];
//    [star2 release];
//    [star3 release];
//    [star4 release];
//    [star5 release];
//    [star6 release];
//    [star7 release];
//    [star8 release];
//    [star9 release];
//    [star10 release];
//    [opscorelabel release];
//    [userscorelabel release];
//    [super dealloc];
//}




@end
