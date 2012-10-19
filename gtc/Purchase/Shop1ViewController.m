//
//  Shop1ViewController.m
//  GTC
//
//  Created by Samar Singla on 30/08/12.
//  Copyright (c) 2012 samarsingla@me.com. All rights reserved.
//

#import "Shop1ViewController.h"

@interface Shop1ViewController ()

@end

@implementation Shop1ViewController



@synthesize TableView;
@synthesize coinlabel;
-(void)BS_init{

NSString* BS_path_blue=[[NSBundle mainBundle]pathForResource:@"Mltimedia_button_click" ofType:@"mp3"];
BS_player_blue =[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:BS_path_blue]  error:NULL];

[BS_player_blue prepareToPlay];
UInt32 doChangeDefaultRoute = 1;
AudioSessionSetProperty(kAudioSessionProperty_OverrideCategoryDefaultToSpeaker, sizeof(doChangeDefaultRoute), &doChangeDefaultRoute);



}
-(void)AddBanner{
bannerView = [[ADBannerView alloc] 
              initWithFrame:CGRectMake(0, 430, 320, 50)];
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

- (IBAction)main_menu_button:(id)sender {
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
        [BS_player_blue play];
    }
    
    int a=[[NSUserDefaults standardUserDefaults]integerForKey:@"count" ];
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:a] animated:YES];
    
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

- (void)viewDidLoad
{
[super viewDidLoad];
if ([SKPaymentQueue canMakePayments]) {
    // Display a store to the user.
} else {
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Can't make payment" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}


//  [self AddBanner];
self.TableView.delegate=self;
self.TableView.dataSource=self;


// [self RegisterNotifications];

[InAppManager sharedHelper].Delegate=self;
self.TableView.hidden=YES ;

[self BS_init];

}


-(void)viewDidAppear:(BOOL)animated{



Reachability *reach = [Reachability reachabilityForInternetConnection];	
NetworkStatus netStatus = [reach currentReachabilityStatus];    
if (netStatus == NotReachable) {        
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Could not connect to the server, please check your internet connection !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show]; 
    
} 
else {
    if(![InAppManager sharedHelper].Products){
        
        [self showActivityIndicatorWithLabel:@"Loading..."];
        [[InAppManager sharedHelper]RequestProductWithIdentifier: 
         [NSSet setWithObjects:  
          
         /* @"com.SingMeSomethingPro500",
          @"com.SingMeSomethingPro1000",
          @"com.SingMeSomethingPro2000",
          @"com.SingMeSomethingPro5000",
          @"com.SingMeSomethingPro10000",
          @"com.SingMeSomethingPro20000",
          */
          
          @"com.GTC.500F",
          @"com.GTC.1000F",
          
          
          @"com.GTC.8000F",
          @"com.GTC.16000F",
          @"com.GTC.32000F",
          @"com.GTC.2000F",
          @"com.GTC.4000F",              nil] ];
        
        
        
        [self performSelector:@selector(timeout:) withObject:nil afterDelay:30.0];
        
    }
    
    else {
        [self HideActvityIndicator];
        self.TableView.hidden=NO;
    }
    
}
}


-(void)InAppPurchaseProductLoaded:(NSArray *)Products{
[self.TableView reloadData];
[self HideActvityIndicator];
self.TableView.hidden=NO;
}

-(void)InAppPurchaseSuccessFull:(NSString *)ProductIdentifier{
[self HideActvityIndicator];    


NSLog(@"Purchased: %@", ProductIdentifier);


[self showActivityIndicatorWithLabel:@"Updating..."];

[self UPDATE_COINS:ProductIdentifier];
[self.TableView reloadData];
[self HideActvityIndicator];
[self.navigationController popViewControllerAnimated:YES];

}

-(void)InAppPurchaseFailed:(SKPaymentTransaction *)Transaction{
/*UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Could not complete the transaction !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
 [alert show];*/
[self HideActvityIndicator];
if (Transaction.error.code != SKErrorPaymentCancelled) {    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" 
                                                    message:Transaction.error.localizedDescription 
                                                   delegate:nil 
                                          cancelButtonTitle:nil 
                                          otherButtonTitles:@"OK", nil] ;
    
    [alert show];
}
}






- (void)showActivityIndicatorWithLabel:(NSString*)title {
[SVProgressHUD showWithStatus:title maskType:SVProgressHUDMaskTypeClear];
[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];

}

-(void)HideActvityIndicator{
[SVProgressHUD dismiss];


}
- (void)timeout:(id)arg {
if([InAppManager sharedHelper].Products.count==0)
[SVProgressHUD showErrorWithStatus:@"Timeout"];
}
- (void)viewDidUnload
{
[self setTableView:nil];
  
    [self setCoinlabel:nil];
[super viewDidUnload];
// Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
return (interfaceOrientation == UIInterfaceOrientationPortrait);
}







//==================================================================POST COINS===============================================================
-(void)UPDATE_COINS:(NSString*)ProductIdentifier{
//ProductIdentifier = @"com.GTC.16000F";
double NewCoins=0;

NewCoins=[self Post_GetPriceForProductIdentifier:ProductIdentifier];

if(NewCoins>0) [self Post_AddCoins:NewCoins];

}

-(void)Post_AddCoins:(double)extraCoins{
    NSLog(@"Post coins");
//NSLog(@"coin before=%@ new=%f ",[[CoinBombPass share]Coins],extraCoins);
NSString*  post =[NSString stringWithFormat:@"access_token=%@&plus=%@&coins=%0.0f",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],@"1",extraCoins];

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
-(double)Post_GetPriceForProductIdentifier:(NSString *)PID{

NSLog(@"PID=%@=",PID);

NSString *coins;
    NSLog(@"product Identifier=%@",PID);
    NSLog(@"Access Token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]);
NSString *post =[NSString stringWithFormat:@"access_token=%@&product_identifier=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"],PID];

NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];

NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];

NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;

[request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/products.php"]];

[request setHTTPMethod:@"POST"];

[request setValue:postLength forHTTPHeaderField:@"Content-Length"];

[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

[request setHTTPBody:postData];

NSError *error1 = nil;

NSURLResponse *response = nil;

NSData *data = [NSURLConnection sendSynchronousRequest:request
                
                                     returningResponse:&response
                
                                                 error:&error1];
    NSLog(@"DATA=%@",data);
    
if (data){
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
    coins=[json valueForKey:@"coins"];
    
    
    NSLog(@"json response =%@",json);
    
}
else { 
    NSString *output = [error1 description];
    NSLog(@"\n\n Error to get json=%@",output);
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Unable to connect to server" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

return [coins doubleValue];
}

//==================================================================POST ENDS================================================================

- (IBAction)back:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
        [BS_player_blue play];
    }
    
//if([DatabaseHandler PlaySound]) [BS_player_blue play];
[self.navigationController popViewControllerAnimated:YES];

}



- (void)dealloc {
   // [coinlabel release];
   
   // [super dealloc];
}
- (IBAction)shopbuttonactn:(UIButton *)sender {
//    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
//    {
//        
//        [BS_player_blue play];
//    }
        if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
        {
            NSURL *url23 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Cash_register"ofType:@"mp3"]];
            NSError *error23;
            audioPlayercountdown = [[AVAudioPlayer alloc]
                                    initWithContentsOfURL:url23
                                    error:&error23];
            if (error23)
            {
                NSLog(@"Error in audioPlayer: %@",
                      [error23 localizedDescription]);
            } else {
                audioPlayer.delegate = self;
                [audioPlayer prepareToPlay];
            }
            [audioPlayercountdown play];
        }

    
    
    if(sender.tag==1){
        [[InAppManager sharedHelper] BuyProductAtIndex:4]; 
    }
    if(sender.tag==2){
        [[InAppManager sharedHelper] BuyProductAtIndex:6]; 
    }
    if(sender.tag==3){
        [[InAppManager sharedHelper] BuyProductAtIndex:1]; 
    }
    if(sender.tag==4){
        [[InAppManager sharedHelper] BuyProductAtIndex:3]; 
    }
    if(sender.tag==5){
        [[InAppManager sharedHelper] BuyProductAtIndex:5]; 
    }
    if(sender.tag==6){
        [[InAppManager sharedHelper] BuyProductAtIndex:0]; 
    }
    if(sender.tag==7){
        [[InAppManager sharedHelper] BuyProductAtIndex:2]; 
    }
    
    
    
    [self showActivityIndicatorWithLabel:@"Requesting..."];
    
    
    [self performSelector:@selector(timeout:) withObject:nil afterDelay:60*2];

    
}

- (IBAction)back1:(UIButton *)sender {
    
    NSLog(@"Back Button");
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
        [BS_player_blue play];
    }
    
     [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)shopupdatecoinbutton:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
        [BS_player_blue play];
    }
    
    [self UPDATE_COINS:nil];
   
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    coinlabel.text=[[[NSUserDefaults standardUserDefaults]objectForKey:@"coins"] stringByAppendingString:@" Coins  "];
    
    
}

@end
