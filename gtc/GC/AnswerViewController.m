//
//  AnswerViewController.m
//  GC
//
//  Created by fgh gf on 19/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnswerViewController.h"
#import "ScoreViewController.h"
#import "LeadershipViewController.h"
#import "asyncimageview.h"
@implementation AnswerViewController
@synthesize oppnamelabel;
@synthesize myImage;
@synthesize oppnamelabel1;
@synthesize ot1;
@synthesize ot2;
@synthesize ot3;

@synthesize ot4;
@synthesize ot5;
@synthesize ut1;
@synthesize ut2;
@synthesize ut3;
@synthesize ut4;
@synthesize ut5;
@synthesize coins1;
@synthesize opp_coins;
@synthesize opptime1;
@synthesize opptime2;
@synthesize opptime3;
@synthesize opptime4;
@synthesize opptime5;
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
@synthesize oppcoinslabel;
@synthesize answer1;
@synthesize answer2;
@synthesize answer3;
@synthesize answer4;
@synthesize answer5;
@synthesize time1;
@synthesize time2;
@synthesize time3;
@synthesize time4;
@synthesize time5;
@synthesize img1;
@synthesize str6,str7,str8,str9,str10,str11,str12,str13,str14,str15,access_token,otime1,otime2,otime3,otime4,otime5,opponent_image,opponent_name,us_image,opponent_coins_previous,user_coins_previous,user_coins_p,opponent_coins_p,a1,a2,a3,a4,a5,game_id,user_score,opponent_score,u1,u2,u3,u4,u5,quicktime1,quicktime2,quicktime3,quicktime4,quicktime5;


double coins;
double oppcoins;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    [self viewDidUnload];
    // Release any cached data, images, etc that aren't in use.
}


-(void)AddBanner{
    bannerView = [[ADBannerView alloc]
                  initWithFrame:CGRectMake(0,430,200,40)];
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

- (IBAction)complete:(id)sender {
    
    
    NSLog(@"gameid=%@",game_id);
     NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&q1=%@&q2=%@&q3=%@&q4=%@&q5=%@&a1=%@&a2=%@&a3=%@&a4=%@&a5=%@&coins=%@&game=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"],time1.text,time2.text,time3.text,time4.text,time5.text,a1,a2,a3,a4,a5,coins1.text,game_id];
    
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/complete.php"];
    
   // NSLog(post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    /* when we user https, we need to allow any HTTPS cerificates, so add the one line code,to tell teh NSURLRequest to accept any https certificate, i'm not sure about the security aspects
     */
    
  //  [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",data);
    
    
    
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    opp_coins.text=opponent_coins_p;
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
    [self.navigationController setNavigationBarHidden:YES];
    
    //[img1 setImage:[UIImage imageNamed:opponent_image]];
    
    AsyncImageView *meImage = [[AsyncImageView alloc]initWithFrame:CGRectMake(183,61,29,24)];
    
    //NSData *meData = [NSData dataWithContentsOfURL:[NSURL URLWithString:us_image]];
    
    //[meImage setImage:[UIImage imageWithData:meData]];
    [meImage loadImageFromURL:[NSURL URLWithString:us_image]];
    [self.view addSubview:meImage];
    
    // NSLog(@"%@",oppImageUrl);
    
    
    AsyncImageView *oppImage = [[AsyncImageView alloc]initWithFrame:CGRectMake(94, 61,28,24)];
    
    // [oppImage setBackgroundColor:[UIColor blackColor]];
    
    // NSData *oppData = [NSData dataWithContentsOfURL:[NSURL URLWithString:opponent_image]];
    
    //[oppImage setImage:[UIImage imageWithData:oppData]];
    [oppImage loadImageFromURL:[NSURL URLWithString:opponent_image]];
    [self.view addSubview:oppImage];

    
  //  img1.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:opponent_image]]];
   // myImage.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:us_image]]];
    
    oppnamelabel.text=opponent_name;

    oppnamelabel1.text=opponent_name;
    
    self.answer1.text=self.str6;
     self.answer2.text=self.str7;
     self.answer3.text=self.str8;
     self.answer4.text=self.str9;
     self.answer5.text=self.str10;
    self.time1.text=self.str11;
    self.time2.text=self.str12;
    self.time3.text=self.str13;
    self.time4.text=self.str14;
    self.time5.text=self.str15;
    
    opptime1.text=otime1;
    opptime2.text=otime2;
    opptime3.text=otime3;
    opptime4.text=otime4;
    opptime5.text=otime5;
    if(otime1 == nil || otime2==nil || otime3==nil || otime4==nil || otime5==nil)
    {
        oppnamelabel1.text=@"";
        opptime1.text=@"";
        opptime2.text=@"";
        opptime3.text=@"";
        opptime4.text=@"";
        opptime5.text=@"";
        
        
           }
    else
    {
       // oppcoins=100-([otime1 doubleValue]*10)+100-([otime2 doubleValue]*10)+100-([otime3 doubleValue]*10)+100-([otime4 doubleValue]*10)+100-([otime5 doubleValue]*10);
        NSLog(@"%f",coins);
        
      
        //opp_coins.text=[NSString stringWithFormat:@"%d", (int)oppcoins];
        
        if(![a1 intValue]==1 || [opptime1.text isEqualToString:@"10.0"])
        {
            opptime1.text=@"";
            
            
            ot1.image=[UIImage imageNamed:@"wrong_btn@2x.png"];
            
        }
        else
        {
            ot1.image=[UIImage imageNamed:@"win_btn@2x.png"];
            
        }
        
        
        if(![a2 intValue]==1 || [opptime2.text isEqualToString:@"10.0"])
        {
            opptime2.text=@"";
            ot2.image=[UIImage imageNamed:@"wrong_btn@2x.png"];
            
        }
        else
        {
            ot2.image=[UIImage imageNamed:@"win_btn@2x.png"];
            
        }
        if(![a3 intValue]==1 || [opptime3.text isEqualToString:@"10.0"])
        {
            
            opptime3.text=@"";
            ot3.image=[UIImage imageNamed:@"wrong_btn@2x.png"];
            
        }
        else
        {
            ot3.image=[UIImage imageNamed:@"win_btn@2x.png"];
            
        }
        if(![a4 intValue]==1 || [opptime4.text isEqualToString:@"10.0"])
        {
            
            opptime4.text=@"";
            ot4.image=[UIImage imageNamed:@"wrong_btn@2x.png"];
            
        }
        else
        {
            ot4.image=[UIImage imageNamed:@"win_btn@2x.png"];
            
        }
        if(![a5 intValue]==1 || [opptime5.text isEqualToString:@"10.0"])
        {
            opptime5.text=@"";
            
            ot5.image=[UIImage imageNamed:@"wrong_btn@2x.png"]; 
            
        }
        else 
        {
            ot5.image=[UIImage imageNamed:@"win_btn@2x.png"]; 
            
        }
        
        

        
        
    }
    
   /*    if([otime1 isEqualToString:@"0.0"])
    {
        opptime1.text=@"x";
        
    }
    if([otime2 isEqualToString:@"0.0"])
    {
        opptime2.text=@"x";
        
    }
   
    if([otime3 isEqualToString:@"0.0"])
    {
        opptime3.text=@"x";
        
    }
   
    if([otime4 isEqualToString:@"0.0"])
    {
        opptime4.text=@"x";
        
    }
   
    if([otime5 isEqualToString:@"0.0"])
    {
        opptime5.text=@"x";
        
    }
   */ 
    

        
    
    if(![u1 isEqualToString:str6] || [time1.text isEqualToString:@"10.0"])
    {
        time1.text=@" ";
        ut1.image=[UIImage imageNamed:@"wrong_btn@2x.png"]; 
        
    }
    else
    {
        
        ut1.image=[UIImage imageNamed:@"win_btn@2x.png"]; 
        
    }
    if(![u2 isEqualToString:str7]||[time2.text isEqualToString:@"10.0"])
    {
        
         time2.text=@" ";
        ut2.image=[UIImage imageNamed:@"wrong_btn@2x.png"]; 
        
    }
    else
    {
        ut2.image=[UIImage imageNamed:@"win_btn@2x.png"]; 
        
    }
    if(![u3 isEqualToString:str8]  || [time3.text isEqualToString:@"10.0"])
    {
         time3.text=@" ";
        ut3.image=[UIImage imageNamed:@"wrong_btn@2x.png"]; 
        
    }
    else
    {
        ut3.image=[UIImage imageNamed:@"win_btn@2x.png"]; 
        
    }
    if(![u4 isEqualToString:str9] || [time4.text isEqualToString:@"10.0"])
    {
         time4.text=@" ";
        ut4.image=[UIImage imageNamed:@"wrong_btn@2x.png"]; 
        
    }
    else
    {
        ut4.image=[UIImage imageNamed:@"win_btn@2x.png"]; 
        
    }
    if(![u5 isEqualToString:str10] || [time5.text isEqualToString:@"10.0"])
    {
        
         time5.text=@" ";
        ut5.image=[UIImage imageNamed:@"wrong_btn@2x.png"]; 
        
    }
    else
    {
        ut5.image=[UIImage imageNamed:@"win_btn@2x.png"]; 
        
    }
    
    
    
    
    
    
    
    
    
    
        coins=[user_coins_p doubleValue];
    coins1.text=[NSString stringWithFormat:@"%d", (int)coins];
    
    
    
    if(self.opponent_coins_p.intValue>=2000)
    {
        star1.image=[UIImage imageNamed:@"star@2x.png"];
    }
    if(self.opponent_coins_p.intValue>=4000)
    {
        star2.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if(self.opponent_coins_p.intValue >=8000)
    {
        star3.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if(self.opponent_coins_p.intValue>=16000)
    {
        star4.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if(self.opponent_coins_p.intValue>=32000)
    {
        star5.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if(coins>=2000)
    {
        star6.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if(coins>=4000)
    {
        star7.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if(coins>=8000)
    {
        star8.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if(coins>=16000)
    {
        star9.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if(coins>=32000)
    {
        star10.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    
    UITapGestureRecognizer *gestureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    
    [self.view addGestureRecognizer:gestureTap];
    
    gestureTap.delegate = self;
    
    gestureTap.numberOfTapsRequired = 1;
    
    

 
  
    
    // Do any additional setup after loading the view from its nib.
}


-(void)doubleTap:(UIGestureRecognizer *)gesture {
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    if(otime1 == nil || otime2==nil || otime3==nil || otime4==nil || otime5==nil)
    {
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        // [defaults1 setObject:info forKey:@"next"];
        [defaults1 setBool:YES  forKey:@"next"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
        
        // [defaults1 setObject:info forKey:@"next"];
        [defaults2 setInteger:1 forKey:@"n"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        int a=[[NSUserDefaults standardUserDefaults]integerForKey:@"count" ];
        
               
     //   if([[NSUserDefaults standardUserDefaults]boolForKey:@"loginplay"])
      //  {
         //   [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:a+1] animated:YES ];
          
            
            
      //  }
       // else{
            [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:a] animated:YES ];
            
      //  }
        
        if([[NSUserDefaults standardUserDefaults]boolForKey:@"Facebook_post"])
        {
            [[NSUserDefaults standardUserDefaults]setBool:FALSE forKey:@"Facebook_post"];
        NSString *fbuname = [[NSUserDefaults standardUserDefaults]valueForKey:@"login"];
        NSString *fbid=[[NSUserDefaults standardUserDefaults]valueForKey:@"fbid"];
        NSLog(@"fbuname=%@",fbuname);
        if([fbuname isEqualToString:@"fb"])
        {
            NSLog(@"fbid=%@",fbid);
            if(fbid.intValue!=0)
            {
                [[FacebookManager facebookConnect]Call_FB];
                [[FacebookManager facebookConnect]Post_To_Friend_Wall_WithMsg:[NSString stringWithFormat:@"I just created a game with %@ on the guess that celebrity iPhone app!",opponent_name]Friend_FBID:fbid WithLink:nil];
            }
        }      
        
        
        
        
        
      
        fbuname = [[NSUserDefaults standardUserDefaults]valueForKey:@"login"];
        fbid=[[NSUserDefaults standardUserDefaults]valueForKey:@"opponent_fbid"];
        NSLog(@"fbuname=%@",fbuname);
        if([fbuname isEqualToString:@"fb"])
        {
            NSLog(@"fbid=%@",fbid);
            if(fbid.intValue!=0)
            {
                NSString *fbuname = [[NSUserDefaults standardUserDefaults]valueForKey:@"fbuname"];
                [[FacebookManager facebookConnect]Call_FB];
                [[FacebookManager facebookConnect]Post_To_Friend_Wall_WithMsg:[NSString stringWithFormat:@"Hey, %@ has invited you to play an awesome game. Guess That celebrity is the new hype and is available on iPhone.\nYou can download the app on the Apple AppStore just search for 'Guess That Celebrity' or play with me on Facebook.\nCan you recognise Richard Branson? Or Madonna?\nGuess That Celebrity!\nEnjoy and play",fbuname]Friend_FBID:fbid WithLink:nil];
            }
        }

      } 
        
    }
    else{
        [self performSegueWithIdentifier:@"scorepage" sender:nil];
    }
    

    
}

-(void)FB_Logged_In_Successfully
{
    
    NSLog(@"Loged In successful");
    // [self hideActivityIndicater];
    
}

-(void)FB_Post_To_Friend_Wall_Request_Sent{
    // [self showActivityIndicater];
    
}
-(void)FB_Login_Request_Sent
{
    
}
-(void)FB_Post_To_Wall_Request_Sent
{
    
}
-(void)FB_Post_To_Friend_Wall_Successfully{
    
    //[self hideActivityIndicater];
    
}

-(void)FB_Post_To_Wall_Successfully
{
    NSLog(@"Post to wall successfully");
}


- (IBAction)Next1:(id)sender {
   
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    if(otime1 == nil || otime2==nil || otime3==nil || otime4==nil || otime5==nil)
    {
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        // [defaults1 setObject:info forKey:@"next"];
        [defaults1 setBool:YES  forKey:@"next"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
        
        // [defaults1 setObject:info forKey:@"next"];
        [defaults2 setInteger:1 forKey:@"n"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        int a=[[NSUserDefaults standardUserDefaults]integerForKey:@"count"];
        
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:a] animated:YES];

    
    }
    else{
    [self performSegueWithIdentifier:@"scorepage" sender:nil];
    }

   

}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
   
    
    if ([segue.identifier isEqualToString:@"scorepage"])
    {
        LeadershipViewController *vc= (LeadershipViewController *)[segue destinationViewController];
         vc.user_name=@"Me";
         vc.opponent_name=opponent_name;
         vc.opponent_image=opponent_image;
         vc.user_image=us_image;
    
         vc.opponent_coins=opp_coins.text;
         vc.user_coins=coins1.text;
         vc.user_score=user_score;
         vc.opponent_score=opponent_score;
        vc.ans1= self.answer1.text;
      vc.ans2= self.answer2.text;
      vc.ans3= self.answer3.text;
      vc.ans4= self.answer4.text;
      vc.ans5= self.answer5.text;
        
        
        vc.quicktime1=quicktime1;
        vc.quicktime2=quicktime2;
        vc.quicktime3=quicktime3;
        vc.quicktime4=quicktime4;
        vc.quicktime5=quicktime5;
        
        

        
    }

}


- (void)viewDidUnload
{

    [self setAnswer1:nil];
    [self setAnswer2:nil];
    [self setAnswer3:nil];
    [self setAnswer4:nil];
    [self setAnswer5:nil];
    [self setTime1:nil];
    [self setTime2:nil];
    [self setTime3:nil];
    [self setTime4:nil];
    [self setTime5:nil];
    [self setCoins1:nil];
    
    [self setOpptime1:nil];
    [self setOpptime2:nil];
    [self setOpptime3:nil];
    [self setOpptime4:nil];
    [self setOpptime5:nil];
    [self setImg1:nil];
    [self setOt1:nil];
    [self setOt2:nil];
    [self setOt3:nil];
    [self setOt4:nil];
    [self setOt5:nil];
    [self setUt1:nil];
    [self setUt2:nil];
    [self setUt3:nil];
    [self setUt4:nil];
    [self setUt5:nil];
    [self setOppnamelabel:nil];
    [self setOppnamelabel:nil];
    [self setMyImage:nil];
    
    [self setOpp_coins:nil];
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
    [self setOppcoinslabel:nil];
    bannerView=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//- (void)dealloc {
//    [answer1 release];
//    [answer2 release];
//    [answer3 release];
//    [answer4 release];
//    [answer5 release];
//    [time1 release];
//    [time2 release];
//    [time3 release];
//    [time4 release];
//    [time5 release];
//    [str6 release];
//    [str7 release];
//    [str8 release];
//    [str9 release];
//    [str10 release];
//    [str11 release];
//    [str12 release];
//    [str13 release];
//    [str14 release];
//    
//    [coins1 release];
//
//    [opptime1 release];
//    [opptime2 release];
//    [opptime3 release];
//    [opptime4 release];
//    [opptime5 release];
//    [img1 release];
//    [ot1 release];
//    [ot2 release];
//    [ot3 release];
//    [ot4 release];
//    [ot5 release];
//    [ut1 release];
//    [ut2 release];
//    [ut3 release];
//    [ut4 release];
//    [ut5 release];
//    [oppnamelabel release];
//    [oppnamelabel release];
//    [myImage release];
//
//    [opp_coins release];
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
//    [oppcoinslabel release];
//    [super dealloc];
//}
@end
