//
//  ShopViewController.m
//  GTC
//
//  Created by fgh gf on 07/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShopViewController.h"

@implementation ShopViewController 

@synthesize coinlabel;
@synthesize hints;
@synthesize eliminations;
AVAudioPlayer *audioPlayer,*audioPlayercountdown;

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
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
   
    [super viewDidLoad];
  //  [self AddBanner];
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

      
  // eliminations.text= [[NSUserDefaults standardUserDefaults]objectForKey:@"coins"];
    

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [eliminations release];
    [hints release];
    [coinlabel release];
    [self setEliminations:nil];
    [self setHints:nil];
    [self setCoinlabel:nil];
    remainingHint = nil;
    remainingElimination = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"coin label=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]);
    coinlabel.text=[[[NSUserDefaults standardUserDefaults]objectForKey:@"coins"] stringByAppendingString:@" Coins"];
    

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)dealloc {
       
}
- (IBAction)eliminationsbutton:(UIButton *)sender {
    sender.enabled=NO;
    
   

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([[segue identifier] isEqualToString:@"a"]) {
     
    }
    
    
}

- (IBAction)hintsbutton:(UIButton *)sender {
    sender.enabled=NO;
  
    
}
- (IBAction)addcoinsbtn:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
//    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
//    {
//        NSURL *url23 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Countdown"ofType:@"mp3"]];
//        NSError *error23;
//        audioPlayercountdown = [[AVAudioPlayer alloc]
//                                initWithContentsOfURL:url23
//                                error:&error23];
//        if (error23)
//        {
//            NSLog(@"Error in audioPlayer: %@",
//                  [error23 localizedDescription]);
//        } else {
//            audioPlayer.delegate = self;
//            [audioPlayer prepareToPlay];
//        }
//        [audioPlayercountdown play];
//    }
    
    
    
    
    [self performSegueWithIdentifier:@"a" sender:@"1"]; 
    

}


-(void)Post_DeductCoin:(double)coins
{
    NSString*  post =[NSString stringWithFormat:@"access_token=%@&coins=%0.0f&plus=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],coins,@"0"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    
    [request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/update_coins.php"]];
    
    [request setHTTPMethod:@"POST"];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:postData];
    
    NSError *error1 = nil;
    
    NSURLResponse *response = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                    
                                         returningResponse:&response
                    
                                                     error:&error1];
    
    if (data){
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
          NSString *remaining=[json valueForKey:@"remaining_coins"];
        if(remaining){
        [[NSUserDefaults standardUserDefaults]setObject:remaining forKey:@"coins"];
        [[NSUserDefaults standardUserDefaults]synchronize];
            
            coinlabel.text=[remaining stringByAppendingString:@" Coins  "];
        }
        
        NSLog(@"Pass response =%@",json);
        
    }
    else { 
        NSString *output = [error1 description];
        NSLog(@"\n\n Error to get json=%@",output);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Unable to connect to server" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }  
    
}

-(void)Post_Add_Hint:(int)Hint{
    
    
    NSString*  post =[NSString stringWithFormat:@"access_token=%@&hints=%d&plus=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],Hint,@"1"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    
    [request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/update_hints.php"]];
    
    [request setHTTPMethod:@"POST"];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:postData];
    
    NSError *error = nil;
    
    NSURLResponse *response1 = nil;
    
    NSData *data1= [NSURLConnection sendSynchronousRequest:request
                    
                                         returningResponse:&response1
                    
                                                     error:&error];
    
    if (data1){
        
        NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
          NSString *remaining=[json1 valueForKey:@"remaining_hints"];
        if(remaining){
            [[NSUserDefaults standardUserDefaults]setObject:remaining forKey:@"hints"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }        
        NSLog(@"Pass response =%@",json1);
        
    }
    else { 
        NSString *output = [error description];
        NSLog(@"\n\n Error to get json=%@",output);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Unable to connect to server" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }  
    

}


-(void)Post_Add_Bomb:(int)Bomb{
    
    
    NSString*  post =[NSString stringWithFormat:@"access_token=%@&bombs=%d&plus=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],Bomb,@"1"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    
    [request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/update_bombs.php"]];
    
    [request setHTTPMethod:@"POST"];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:postData];
    
    NSError *error = nil;
    
    NSURLResponse *response1 = nil;
    
    NSData *data1= [NSURLConnection sendSynchronousRequest:request
                    
                                         returningResponse:&response1
                    
                                                     error:&error];
    
    if (data1){
        
        NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
        NSString *remaining=[json1 valueForKey:@"remaining_bombs"];
        if(remaining){
            [[NSUserDefaults standardUserDefaults]setObject:remaining forKey:@"bombs"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }        
        NSLog(@"Pass response =%@",json1);
        
    }
    else { 
        NSString *output = [error description];
        NSLog(@"\n\n Error to get json=%@",output);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Unable to connect to server" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }  
    
    
}



- (IBAction)hint1:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    
   
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]  intValue]< 250)
        
    {
        
        [self performSegueWithIdentifier:@"a" sender:@"1"]; 
        
    }
    
    else{
  
        [self Post_Add_Hint:1];
        [self Post_DeductCoin:250];
        
    }

}


- (IBAction)hint3:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]  intValue]< 600)
        
    {
        
        [self performSegueWithIdentifier:@"a" sender:@"1"]; 
        
    }
    
    else{
        [self Post_Add_Hint:3];
        [self Post_DeductCoin:600];

    
       }
}

- (IBAction)hint6:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]  intValue]< 1000)
        
    {
        
        [self performSegueWithIdentifier:@"a" sender:@"1"]; 
        
    }
    
    else{
        
        [self Post_Add_Hint:6];
        [self Post_DeductCoin:1000];

        
    }

}


- (IBAction)elimination:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]  intValue]<250)
        
    {
        
        [self performSegueWithIdentifier:@"a" sender:@"1"]; 
        
    }
    
    else{
        [self Post_Add_Bomb:1];
        [self Post_DeductCoin:250];
        
        
    }
}

- (IBAction)elimination3:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]  intValue]< 600)
        
    {
        
        [self performSegueWithIdentifier:@"a" sender:@"1"]; 
        
    }
    
    else{
        [self Post_Add_Bomb:3];
        [self Post_DeductCoin:600];
        
        
    }
  
}

- (IBAction)elimination6:(id)sender {
    
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]  intValue]<1000)
        
    {
        
        [self performSegueWithIdentifier:@"a" sender:@"1"]; 
        
    }
    
    else{
        [self Post_Add_Bomb:6];
        [self Post_DeductCoin:1000];
        
        
    }
}

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


- (IBAction)back1:(UIButton *)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
[self.navigationController popViewControllerAnimated:YES ];

}

@end
