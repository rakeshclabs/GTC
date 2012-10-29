//
//  HomeViewController.m
//  GTC
//
//  Created by Mac 23 on 20/08/12.
//
//

#import "HomeViewController.h"

#import "CreateViewController.h"
#import "SVProgressHUD.h"
#import "AccountSettingsViewController.h"
#import "AboutSettingsViewController.h"
#import "Reachability.h"
@interface HomeViewController ()

@end

@implementation HomeViewController


AVAudioPlayer *audioPlayer;
NSMutableArray *arr;
NSMutableArray *arr1;
NSMutableArray *names;
NSMutableArray *images;
NSMutableArray *ucoins;
NSMutableArray *gameidarray;
NSMutableArray *ocoins;
NSMutableArray *useraccept_status_array;
NSMutableArray *user_score_array;
NSMutableArray *opponent_score_array;
NSMutableArray *game_nudge_status_array;


@synthesize days_left,minutes_left,seconds_left,hours_left;
UIImageView *meImage ;


NSString *gameid;
NSString *opp;
NSString *ucoin;
NSString *ocoin;
NSString *ourl;
UIButton *sliderButton;
UIButton *onoffButton;
UIView *settingView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
             
}

- (void)viewDidLoad
{
    [super viewDidLoad];
       
 //   [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"homeplay"];
    
  //  [[NSUserDefaults standardUserDefaults]synchronize];
   
  
    
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
       // audioPlayer.delegate = self;
        [audioPlayer prepareToPlay];
    }

    
    
    
        if(![[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"])
    [self AddBanner];
    
    
    [self.navigationController setNavigationBarHidden:YES];
    [FacebookManager facebookConnect].Delegate=self;
    
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"tim"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"next"] ;
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"n"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"sound"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];

     
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]){
        splashrotating = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,320,480)];
        //   meImage.image=[UIImage imageNamed:@"splashscreen_v2@2x.png"];
        
        //  NSData *meData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"splashscreen_v2@2x.png"]];
        
        // [meImage setImage:[UIImage imageWithData:meData]];
        
        
        [self.view addSubview:splashrotating];
        
        splashrotating.animationImages = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"splash1.png"], [UIImage imageNamed:@"splash2.png"], [UIImage imageNamed:@"splash3.png"],[UIImage imageNamed:@"splash4.png"],[UIImage imageNamed:@"splash5.png"],/*[UIImage imageNamed:@"8.png"].,*/ nil];
          if(![splashrotating isAnimating]) {
            NSLog(@"no");
            splashrotating.animationDuration=1.0;
            [splashrotating startAnimating];
              Reachability *reach = [Reachability reachabilityForInternetConnection];	
                      NetworkStatus netStatus = [reach currentReachabilityStatus];    
                      if (netStatus == NotReachable) {        
                          NSLog(@"No internet connection!");  
                          [self performSelector:@selector(stop) withObject:nil afterDelay:20.0];
                      } 
                      else {
                          [self performSelector:@selector(start) withObject:nil afterDelay:1.0];
                          
                      }
        }
        
        
        
        // [self showActivityIndicater];
        //  [self POST];
    }
    else{
        
       
        
    }
    
    


	// Do any additional setup after loading the view.
}
-(void)start
{
    [self hideActivityIndicater];
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]);
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"])
    {
        [self POST];
    }
    else{
        [self hideActivityIndicater];
        NSLog(@"log out");
    }

}
-(void)stop
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Connection Error" message:@"No Internet Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    //[splashrotating stopAnimating];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    bannerView=nil;
    arr=nil;
    arr1=nil;
    names=nil;
    images=nil;
    ucoins=nil;
    ocoins=nil;
    gameidarray=nil;
    useraccept_status_array=nil;
    user_score_array=nil;
    opponent_score_array=nil;
    meImage=nil;
    settingView=nil;
    
   // [meImage stopAnimating];
  //  [splashrotating removeFromSuperview];
    // Release any retained subviews of the main view.
}
-(void)viewDidDisappear:(BOOL)animated{
   // [self hideActivityIndicater];
    //[meImage stopAnimating];
    //[meImage removeFromSuperview];
    [splashrotating stopAnimating];
    [splashrotating removeFromSuperview];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
   // [self hideActivityIndicater];
   // [splashrotating stopAnimating];
   //[splashrotating removeFromSuperview];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)AddBanner{
    bannerView = [[ADBannerView alloc]
                  initWithFrame:CGRectMake(0, 50, 320, 50)];
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

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    [self viewDidUnload];
    // Release any cached data, images, etc that aren't in use.
}
-(void)POST_FB{
 //   NSString *deviceToken=[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"];
   // NSLog(@"device Token Facebook=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]);
    //if(deviceToken)
    //{
  //  [self hideActivityIndicater];
   // [self showActivityIndicater];
    NSString *fbid =[[NSUserDefaults standardUserDefaults]valueForKey:@"fbid"];
    NSString *fbuname = [[NSUserDefaults standardUserDefaults]valueForKey:@"fbuname"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fbuname forKey:@"user_name"];
    //  [defaults setObject:passwrd forKey:@"passWord"];
    
    
    
    [defaults synchronize];
    NSLog(@"%@",fbid);
    [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"count"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    NSString *post =[[NSString alloc] initWithFormat:@"fbid=%@&fb_uname=%@&device_token=%@",fbid,fbuname,[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/fblogin.php"];
    NSLog(@"Device Token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]);
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSError *error1 = nil;
    NSURLResponse *response = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error1];
    
   if (data)
    {
        //NSLog(@"\ndata: %@ \nstring: %@", data, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
        NSLog(@"json is %@",json);
        NSDictionary *personalData=[json objectForKey:@"personal_data"];
        NSLog(@"personalData=%@",personalData);
        NSString *accessToken = [personalData valueForKey:@"access_token"];
       
        opp  = [personalData valueForKey:@"opponent_name"];
        ucoin=[personalData valueForKey:@"user_coins"];
        NSLog(@"Login coins=%@",[personalData valueForKey:@"user_coins"]);
        ocoin=[personalData valueForKey:@"opponent_coins"];
        ourl=[personalData valueForKey:@"opponent_image"];
        gameid= [personalData valueForKey:@"game_id"] ;
        days_left=[personalData valueForKey:@"days_left"];
        hours_left=[personalData valueForKey:@"hours_left"];
        minutes_left= [personalData valueForKey:@"minuts_left"];
        seconds_left=[personalData valueForKey:@"seconds_left"];
        if(!days_left)
            days_left=0;
        if(!hours_left)
            hours_left=0;
        if(!minutes_left)
            minutes_left=0;
        if(!seconds_left) 
            seconds_left=0;   
        NSString *coins=[personalData valueForKey:@"coins"];
        
        
        NSString *error=[json valueForKey:@"error"];
        NSLog(@"value is %@", accessToken);
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
       
        [defaults1 setObject:coins forKey:@"coins"];
        [defaults1 setObject:accessToken forKey:@"access_token"];
        
        [defaults1 synchronize];
        
        NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]);
        
        /*   //NSDictionary *name = [info objectAtIndex:0];
         userName.text = [NSString stringWithFormat:@"%@",info];
         access= [NSString stringWithFormat:@"%@",info];
         password.text=[NSString stringWithFormat:@"%@",opp];
         */
        
       // int i;
        
        
        arr=[[NSMutableArray alloc]init];
        arr1=[[NSMutableArray alloc]init];
        names=[[NSMutableArray alloc]init];
        images=[[NSMutableArray alloc]init];
        ocoins=[[NSMutableArray alloc]init];
        ucoins=[[NSMutableArray alloc]init];
        gameidarray=[[NSMutableArray alloc]init];
         useraccept_status_array=[[NSMutableArray alloc]init];
        user_score_array=[[NSMutableArray alloc]init];
        opponent_score_array=[[NSMutableArray alloc]init];
        game_nudge_status_array=[[NSMutableArray alloc]init];
        
        NSDictionary *games1;
//        NSString *j=[json objectForKey:@"no of games"];
//        int v=[j intValue];
//        for (i=1; i<=v;i++) {
//            NSLog(@"game %d", i);
//            if(i<10)
//                games1=[json valueForKey:[NSString stringWithFormat: @"game0%d",i]];
//            else
//                games1=[json valueForKey:[NSString stringWithFormat: @"game%d",i]];
        NSString *status=[json objectForKey:@"log"];
        if(!status.intValue==0)
        {
        games1=[json objectForKey:@"maindata"];
           arr =[games1 valueForKey:@"user_status"];
            names=[games1 valueForKey:@"opponent_name"];
            images=[games1 valueForKey:@"opponent_image"];
            ocoins=[games1 valueForKey:@"opponent_coins"];
            ucoins=[games1 valueForKey:@"user_coins"];
            gameidarray=[games1 valueForKey:@"game_id"] ;
            user_score_array=[games1 valueForKey:@"user_score"];
            opponent_score_array=[games1 valueForKey:@"opponent_score"];
            useraccept_status_array=[games1 valueForKey:@"user_accept_status"];
            game_nudge_status_array=[games1 valueForKey:@"game_nudge_status"];
        }
//            NSLog(@"useraccept%@",useracceptstatusvalue);
//               [useraccept_status_array addObject:useracceptstatusvalue];
//            [arr addObject:userstatus];
//           
//            [names addObject:opponent_name];
//           
//            [images addObject:opponent_image];
//            
//            [ocoins addObject:ocoin];
//            [ucoins addObject:ucoin];
//            [gameidarray addObject:gameid];
//            [user_score_array addObject:user_score];
//            [opponent_score_array addObject:opponent_score];
//            [game_nudge_status_array addObject:game_nudge_status];
            
            
            // [arr addObject:userstatus];
            /*   if([userstatus isEqual:a])
             {
             [arr addObject:userstatus];
             [names addObject:opponent_name];
             [images addObject:opponent_image];
             }
             else
             {
             [arr1 addObject:userstatus];
             [names addObject:opponent_name];
             [images addObject:opponent_image];
             
             }
             
             */
       // }
        
        /*   NSLog(@"value is %@", arr);
         NSLog(@"value is %@", arr1);
         NSLog(@"value is %@", names);
         NSLog(@"value is %@", images);
         NSLog(@"value is %@", gameidarray);*/
        
        if(accessToken)
        {
            
                   
            
            [self performSegueWithIdentifier:@"homecreategame" sender:nil];
        }
        
        else if(error) {
            UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"error!" message:error delegate:@"nil" cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [Alert show];
        }
        
        
    }
    
    
    else
    {
        NSString *output = [error1 description];
        NSLog(@"\n\n Error to get json=%@",output);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Could not connect to the server, please check your internet connection !" delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show];
        [self hideActivityIndicater];
    }
//}
  //  else {
    //    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Your Device is not recognized. So your account can't be created" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
 //       [alert show];
  //      [alert release];
    //}
    
   // [self hideActivityIndicater];
}




-(void)POST{
    NSString *post =[NSString stringWithFormat:@"access_token=%@&device_token=%@", [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]];
    
    NSLog(@"Device_token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]);
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    
    
    
    [request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/login.php"]];
    
    
    
    [request setHTTPMethod:@"POST"];
    
    
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    
    
    [request setHTTPBody:postData];
    
    
    
    NSError *error1 = nil;
    
    
    
    NSURLResponse *response = nil;
    
    
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                    
                                         returningResponse:&response
                    
                                                     error:&error1];
    
    // NSString *data1=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    if (data)
        
    {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
        NSDictionary *personalData=[json objectForKey:@"personal_data"];
        NSString *coins=[personalData objectForKey:@"coins"];
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        [defaults1 setObject:coins forKey:@"coins"];
       
        NSLog(@"Post json %@", json);
      //  NSLog(@"%@",data);
        /*
         if(accessToken==nil){
         //   lbl.text = @"Invalid Parameters";
         
         }
         else{
         [self performSegueWithIdentifier:@"creategame" sender:nil];
         }
         */
               
        //int i;
        
        
        arr=[[NSMutableArray alloc]init];
        arr1=[[NSMutableArray alloc]init];
        names=[[NSMutableArray alloc]init];
        images=[[NSMutableArray alloc]init];
        ocoins=[[NSMutableArray alloc]init];
        ucoins=[[NSMutableArray alloc]init];
        gameidarray=[[NSMutableArray alloc]init];
        user_score_array=[[NSMutableArray alloc]init];
        opponent_score_array=[[NSMutableArray alloc]init];
        useraccept_status_array=[[NSMutableArray alloc]init];
        game_nudge_status_array=[[NSMutableArray alloc]init];
      //  NSString *j=[personalData objectForKey:@"no of games"];
        days_left=[personalData valueForKey:@"days_left"];
        hours_left=[personalData valueForKey:@"hours_left"];
        minutes_left= [personalData valueForKey:@"minuts_left"];
        seconds_left=[personalData valueForKey:@"seconds_left"];
        
        
        if(!days_left)
            days_left=0;
        if(!hours_left)
            hours_left=0;
        if(!minutes_left)
            minutes_left=0;
        if(!seconds_left) 
            seconds_left=0;   
      //  int v=[j intValue];
        NSDictionary *games1;
//        for (i=1; i<=v;i++) {
//            NSLog(@"game %d", i);
//            if(i<10)
//                games1=[json valueForKey:[NSString stringWithFormat: @"game0%d",i]];
//            else
//                games1=[json valueForKey:[NSString stringWithFormat: @"game%d",i]]; 
        NSString *status=[json objectForKey:@"log"];
        if(!status.intValue==0)
        {
        games1=[json objectForKey:@"maindata"];
        
            game_nudge_status_array=[games1 valueForKey:@"game_nudge_status"];
            arr=[games1 valueForKey:@"user_status"];
            names=[games1 valueForKey:@"opponent_name"];
            images=[games1 valueForKey:@"opponent_image"];
            
            
            
            ocoins=[games1 valueForKey:@"opponent_score"];
            ucoins=[games1 valueForKey:@"user_score"];
            gameidarray=[games1 valueForKey:@"game_id"] ;
            useraccept_status_array=[games1 valueForKey:@"user_accept_status"];
        }
//            NSLog(@"useraccept%@",useracceptstatusvalue);
//            
//            //     NSString *a=@"1";
//            
//            
//            [arr addObject:userstatus];
//            [names addObject:opponent_name];
//            [images addObject:opponent_image];
//            
//            
//            
//            [ocoins addObject:ocoin];
//            [ucoins addObject:ucoin];
//            [gameidarray addObject:gameid];
//            [useraccept_status_array addObject:useracceptstatusvalue];
//            [user_score_array addObject:ucoin];
//            [opponent_score_array addObject:ocoin];
//            [game_nudge_status_array addObject:game_nudge_status];
            // [arr addObject:userstatus];
            /*   if([userstatus isEqual:a])
             {
             [arr addObject:userstatus];
             [names addObject:opponent_name];
             [images addObject:opponent_image];
             }
             else
             {
             [arr1 addObject:userstatus];
             [names addObject:opponent_name];
             [images addObject:opponent_image];
             
             }
             
             */
       // }
        
        NSLog(@"value is %@", arr);
        NSLog(@"value is %@", arr1);
        NSLog(@"value is %@", names);
        NSLog(@"value is %@", images);
        
        if([[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]){
            [self performSegueWithIdentifier:@"valid" sender:nil];
        }
        //
        //
        //        if([data1 isEqualToString:@"{\"error\":\"Invalid Parameters\"}"])
        //        {
        //           // lbl.text = @"Invalid Parameters";
        //            [self performSegueWithIdentifier:@"createGame" sender:nil];
        //        }
        //        else if([data1 isEqualToString:@"{\"error\":\"Invalid Username & Password\"}"])
        //        {
        //           // lbl.text = @"Invalid Username And Password";
        //        }
        else {
            NSLog(@"no AT");
            
            UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"No Internet Connection" message:@""  delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"", nil ];
            // [[alertView1 textFieldAtIndex:0].text ];
            
            
            
            
            [alertView1 show];
         //   [alertView1 release];
            
            
            
        }
        
        
    }
    
    
    
    
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self hideActivityIndicater];
    if ([segue.identifier isEqualToString:@"valid"])
    {
        view = [segue destinationViewController ];
        // [view setName:userName.text];
        /*   NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
         NSString *loadname = [defaults objectForKey:@"user_name"];
         [view setValue:loadname];
         
         
         
         */
        CreateViewController *vc= (CreateViewController *)[segue destinationViewController];
        vc.access_token=[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"];
        
        // vc.oppenent_name=password.text;
        vc.arr=arr;
        vc.arr1=arr1;
        vc.names=names;
        vc.images=images;
        vc.coinarray=ocoins;
        vc.gameidarray=gameidarray;
        
        vc.ucoinarray=ucoins;
        vc.user_accept_status_array=useraccept_status_array;
        vc.game_nudge_status_array=game_nudge_status_array;
        vc.days_left=days_left;
        vc.hours_left=hours_left;
        vc.minutes_left=minutes_left;
        vc.seconds_left=seconds_left;
        NSLog(@"days=%@",days_left);
        NSLog(@"days=%@",hours_left);
        NSLog(@"days=%@",minutes_left);
        NSLog(@"days=%@",seconds_left);
        vc.user_score_arrray=user_score_array;
        vc.opponent_score_array=opponent_score_array;
        
        
    }
    
    if ([segue.identifier isEqualToString:@"homecreategame"])
    {
        
       // view = [segue destinationViewController ];
        // [view setName:userName.text];
        /*   NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
         NSString *loadname = [defaults objectForKey:@"user_name"];
         [view setValue:loadname];
         
         
         
         */
        CreateViewController *vc= (CreateViewController *)[segue destinationViewController];
        vc.access_token=[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"];
        
        // vc.oppenent_name=password.text;
        vc.arr=arr;
        vc.arr1=arr1;
        vc.names=names;
        vc.images=images;
        vc.coinarray=ocoins;
        vc.gameidarray=gameidarray;
        vc.game_nudge_status_array=game_nudge_status_array;
        vc.ucoinarray=ucoins;
        vc.user_accept_status_array=useraccept_status_array;
        vc.days_left=days_left;
        vc.hours_left=hours_left;
        vc.minutes_left=minutes_left;
        vc.seconds_left=seconds_left;
        vc.user_score_arrray=user_score_array;
        vc.opponent_score_array=opponent_score_array;
        
        NSLog(@"days=%@",days_left);
        NSLog(@"days=%@",hours_left);
        NSLog(@"days=%@",minutes_left);
        NSLog(@"days=%@",seconds_left);
       // [self hideActivityIndicater];
    }
//[self hideActivityIndicater];
    
}

-(void)showActivityIndicater
{
activityImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,10,320,480)];
    // meImage.image=[UIImage imageNamed:@"splashscreen_v2@2x.png"];
    
    //  NSData *meData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"splashscreen_v2@2x.png"]];
    
    // [meImage setImage:[UIImage imageWithData:meData]];
    
    
   // [self.view addSubview:meImage];
    
    
    
    
    activityImage.animationImages = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"img11.png"],[UIImage imageNamed:@"img10.png"], [UIImage imageNamed:@"img9.png"], [UIImage imageNamed:@"img8.png"],[UIImage imageNamed:@"img7.png"],[UIImage imageNamed:@"img6.png"],[UIImage imageNamed:@"img5.png"],[UIImage imageNamed:@"img4.png"],[UIImage imageNamed:@"img3.png"],nil];
    [self.view addSubview:activityImage];
    //[self attachPopUpAnimationToView:imageView];
    

    if(![activityImage isAnimating]) {
        NSLog(@"no");
        activityImage.animationDuration=1;
        [activityImage startAnimating];
    }
    
}
-(void)hideActivityIndicater
{
   // [SVProgressHUD dismiss];
    [activityImage stopAnimating];
    [activityImage removeFromSuperview];
}


- (IBAction)login_with_email:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
     [sender setBackgroundImage:[UIImage imageNamed:@"login_email_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    
    
     [self performSegueWithIdentifier:@"home" sender:self];
    
}

-(void)cancelclicked
{
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    [settingView removeFromSuperview];

}

-(void)MainMenu_Alert:(UIButton *)sender{

    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
   /* if([DatabaseHandler PlaySound]) [BS_player_blue play];
    [settingalert dismissWithClickedButtonIndex:0 animated:NO];
    int index;
    if([DatabaseHandler FirstLogIn] )index=2;
    else index=1;
    */
    [settingView removeFromSuperview];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
    
    
}
-(void)sliderClicked{
    
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"]){
        
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"sound"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        [sliderButton setImage:[UIImage imageNamed:@"on.png"] forState:UIControlStateNormal];
        
      //  [self slideView:sliderButton withDuration:0.2 toX:90 andY:1];
        
        
        
    }
    
    else{
        
        
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"sound"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        [sliderButton setImage:[UIImage imageNamed:@"off.png"] forState:UIControlStateNormal];
        
    //    [self slideView:sliderButton withDuration:0.2 toX:40 andY:1];
        
        
        
    }
    
    
    
    
    
    
    
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
-(void)About_Alert
{
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }

    [settingView removeFromSuperview];
    AboutSettingsViewController *a=[[AboutSettingsViewController alloc]initWithNibName:@"AboutSettingsViewController" bundle:nil];
    // a.userName =userName;
    [self.navigationController pushViewController:a animated:YES];
}

-(void)Account_Alert
{
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
     
    [settingView removeFromSuperview];
    AccountSettingsViewController *a=[[AccountSettingsViewController alloc]initWithNibName:@"AccountSettingsViewController" bundle:nil];
   // a.userName =userName;
    [self.navigationController pushViewController:a animated:YES];
}
- (IBAction)settingsShow:(id)sender {
    [settingView removeFromSuperview];
    UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,270,190)];
    imgview.image=[UIImage imageNamed:@"popup_bg@2x.png"];
    UIImageView *line1=[[UIImageView alloc] initWithFrame:CGRectMake(6,60,258,2)];
    line1.image=[UIImage imageNamed:@"line@2x.png"];
    UIImageView *line2=[[UIImageView alloc] initWithFrame:CGRectMake(6,90,258,2)];
    line2.image=[UIImage imageNamed:@"line@2x.png"];
    UIImageView *line3=[[UIImageView alloc] initWithFrame:CGRectMake(6,120,258,2)];
    line3.image=[UIImage imageNamed:@"line@2x.png"];
    UIImageView *line4=[[UIImageView alloc] initWithFrame:CGRectMake(6,150,258,2)];
line4.image=[UIImage imageNamed:@"line@2x.png"];
    
settingView=[[UIView alloc] initWithFrame:CGRectMake(20,100,270,190)];
  // [settingView setBackgroundColor:[UIColor whiteColor]];
    [settingView addSubview:imgview];
    [settingView addSubview:line1];
     [settingView addSubview:line2];
     [settingView addSubview:line3];
     [settingView addSubview:line4];
    UILabel *ocoinlabel = [[UILabel alloc]initWithFrame:CGRectMake(100,4,70,34)];
    [ocoinlabel setNumberOfLines:3];
    // [ocoinlabel setTextAlignment:UITextAlignmentCenter];
    
    [ocoinlabel setBackgroundColor:[UIColor clearColor]];
    
  ocoinlabel.text=@"Settings";
    //ocoinlabel.font = [UIFont fontWithName:@"Helvetica Neue" size:22];
    ocoinlabel.textColor=[UIColor whiteColor];
    
    [ocoinlabel setFont:[UIFont boldSystemFontOfSize:16.5]];
    [settingView addSubview:ocoinlabel];
    
    UIButton *cancel= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    cancel.frame = CGRectMake(238,10,23,23);
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1@2x.png"]  forState:UIControlStateNormal];
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn_active@2x.png"]  forState:UIControlStateHighlighted];
    [settingView addSubview:cancel];
    [cancel addTarget:self
               action:@selector(cancelclicked)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    UIButton  *mainmenu = [[UIButton alloc]init];
    mainmenu = [UIButton buttonWithType:UIButtonTypeCustom];
    [mainmenu setTitle:@"Main Menu" forState:UIControlStateNormal];
    [mainmenu setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
    
     [mainmenu addTarget:self action:@selector(MainMenu_Alert:) forControlEvents:UIControlEventTouchUpInside];
    mainmenu.frame = CGRectMake(90,32,100,30);
    
    [mainmenu.titleLabel setTextAlignment:UITextAlignmentCenter];
    [mainmenu.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    
    [settingView addSubview:mainmenu];
    
    
    
    
  
  UIButton  *sounds = [[UIButton alloc]init];
    sounds = [UIButton buttonWithType:UIButtonTypeCustom];
    [sounds setTitle:@"Sounds" forState:UIControlStateNormal];
    [sounds setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
   // button6.titleLabel.text=@"Sounds";
    sounds.frame = CGRectMake(54,62,160,30);
    [sounds.titleLabel setTextAlignment:UITextAlignmentCenter];
    [sounds.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    
     [settingView addSubview:sounds];
    //[settingView addSubview:sounds];
  
    
    sliderButton= [[UIButton alloc]init];
    
    sliderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
        sliderButton.frame = CGRectMake(160,2.2,30,25);
       // [sliderButton setBackgroundColor:[UIColor redColor]];
     [sliderButton setBackgroundImage:[UIImage imageNamed:@"off.png"] forState:UIControlStateNormal];
    }
    
    else
    {
        
        sliderButton.frame = CGRectMake(160,2.2,30,25);
         [sliderButton setImage:[UIImage imageNamed:@"on.png"] forState:UIControlStateNormal];
    }
    
    [sliderButton addTarget:self action:@selector(sliderClicked) forControlEvents:UIControlEventTouchUpInside];
    
  //  [sliderButton addTarget:self action:@selector(ZoomIn:) forControlEvents:UIControlEventTouchDown];
    
    //[button1 setShowsTouchWhenHighlighted:YES];
    
   
    
    // [createGameButton setImage:[UIImage imageNamed:@"creategameonclick.png"] forState:UIControlStateHighlighted];
    
    
    
    sliderButton.enabled = YES;
    
    sliderButton.userInteractionEnabled=YES;
    
    [sounds addSubview:sliderButton];
    
    
    
    onoffButton = [[UIButton alloc]init];
    onoffButton = [UIButton buttonWithType:UIButtonTypeCustom];
  //  [onoffButton setTitle:@"off" forState:UIControlStateNormal];
    [onoffButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
    [onoffButton setImage:[UIImage imageNamed:@"pin_btn@2x.png"] forState:UIControlStateNormal];
    onoffButton.frame = CGRectMake(135,2.2, 25, 25);
    
    [sounds addSubview:onoffButton];
    
    
    
   
    

    
    
    
    
    UIButton  *account = [[UIButton alloc]init];
    account = [UIButton buttonWithType:UIButtonTypeCustom];
    [account setTitle:@"Account" forState:UIControlStateNormal];
    [account setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
    account.frame = CGRectMake(84,90,100,30);
    [account.titleLabel setTextAlignment:UITextAlignmentCenter];
    [account.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
     [account addTarget:self action:@selector(Account_Alert) forControlEvents:UIControlEventTouchUpInside];
    
    [settingView addSubview:account];
    
    
    UIButton  *aboutus = [[UIButton alloc]init];
    aboutus = [UIButton buttonWithType:UIButtonTypeCustom];
    [aboutus setTitle:@"About" forState:UIControlStateNormal];
    [aboutus setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
    aboutus.frame = CGRectMake(84,120,100,30);
    [aboutus.titleLabel setTextAlignment:UITextAlignmentCenter];
[aboutus.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [aboutus addTarget:self action:@selector(About_Alert) forControlEvents:UIControlEventTouchUpInside];

    [settingView addSubview:aboutus];
    
    
    UIButton  *feedback = [[UIButton alloc]init];
    feedback = [UIButton buttonWithType:UIButtonTypeCustom];
    [feedback setTitle:@"Feedback" forState:UIControlStateNormal];
    [feedback setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
    feedback.frame = CGRectMake(90,150,100,30);
    [feedback.titleLabel setTextAlignment:UITextAlignmentCenter];
    [feedback.titleLabel setTextAlignment:UITextAlignmentCenter];
    [feedback.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [settingView addSubview:feedback];
    
    
    
    
   
     [self.view addSubview:settingView];

    [self attachPopUpAnimationToView:settingView];
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{

   [[NSUserDefaults standardUserDefaults]setInteger:1  forKey:@"count"];
   [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void) attachPopUpAnimationToView:(UIView *)myView
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];

    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
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
    animation.duration = .2;
    [myView.layer addAnimation:animation forKey:@"popup"];
}
- (IBAction)fblogin:(id)sender 
{
    count=[[NSUserDefaults standardUserDefaults]integerForKey:@"FBcount"];
    NSLog(@"Count=%d",count);
    count++;
    [[NSUserDefaults standardUserDefaults]setInteger:count forKey:@"FBcount"];
    NSLog(@"Count=%d",[[NSUserDefaults standardUserDefaults]integerForKey:@"FBcount"]);
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    [[NSUserDefaults standardUserDefaults]setValue:@"fb" forKey:@"login"];
    
     [sender setBackgroundImage:[UIImage imageNamed:@"facebook_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"FBAccessTokenKey"]&&[[NSUserDefaults standardUserDefaults]objectForKey:@"fbuname"]){
        [self POST_FB];
    }
    
    else
    {
        [[FacebookManager facebookConnect]Call_FB];
       // [self FB_Logged_In_Successfully];
    }   
}




-(void)FB_Login_Request_Sent{
    //[SVProgressHUD showWithStatus:@"logging in..."];
   [self showActivityIndicater];
    NSLog(@"Login requesting");
}
-(void)FB_Logged_In_Successfully
{
     
    //[self hideActivityIndicater];
 //  [self showActivityIndicater]; 
    [self POST_FB];
  //  [SVProgressHUD dismiss];
    NSLog(@"Count=%d",count);
    if(count==0||count>=3)
    {    
        NSString *fbid =[[NSUserDefaults standardUserDefaults]valueForKey:@"fbid"];
        NSString *fbuname = [[NSUserDefaults standardUserDefaults]valueForKey:@"fbuname"];
        NSLog(@"fbid=%@",fbid);
        NSLog(@"fbname=%@",fbuname);
        [[FacebookManager facebookConnect]Post_To_Friend_Wall_WithMsg:[NSString stringWithFormat:@"%@ has just started playing Guess That Celebrity on the iPhone! Start playing now to test your celebrity knowledge",fbuname]Friend_FBID:fbid WithLink:nil];
   if(count>=3)
       [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"FBcount"]; 
    
    }
    
    NSLog(@"Loged In successful");
   // [self hideActivityIndicater];
    
    
}

-(void)FB_Post_To_Friend_Wall_Successfully
{
    
}

-(void)FB_Post_To_Friend_Wall_Request_Sent
{
    
}
-(void)FB_Post_To_Wall_Request_Sent
{
    
}
-(void)FB_Post_To_Wall_Successfully
{
    
}

@end
