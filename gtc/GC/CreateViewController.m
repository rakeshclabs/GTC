//
//  CreateViewController.m
//  GC
//
//  Created by Samar Singla on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateViewController.h"
#import "LoginViewController.h"
#import "NewGameUserNameViewController.h"
#import "FBFriendsViewController.h"
#import "SVProgressHUD.h"
#import "AboutSettingsViewController.h"
#import "AccountSettingsViewController.h"
#import "StatisticsViewController.h"
#import "FontLabel.h"
#import "FontLabelStringDrawing.h"
#import "FontManager.h"
#import "FacebookManager.h"

//#import "ASIHTTPRequest.h"
#define kOFFSET_FOR_KEYBOARD 1.0

@interface CreateViewController ()

@end
UIButton *sliderButton;
UIView *settingView;
UIButton *onoffButton;
@implementation CreateViewController
@synthesize tableView;
@synthesize createGame,myCounterLabel,name,value,access_token,oppenent_name,name1,pixelated_image,audio,option1,option2,option3,option4,name2,pixelated_image2,option21,option22,option23,option24,audio2,pixelated_image3,audio3,option31,option32,option33,option34,name3,option41,option42,option43,option44,pixelated_image4,name4,audio4,audio5,pixelated_image5,option51,option52,option53,option54,name5,arr,arr1,images,names,ocoin,ourl,ucoin,coinarray,ucoinarray,gameidarray,opponent_image,refreshArrow,refreshLabel,refreshSpinner,refreshHeaderView,textPull,textRelease,textLoading,us_image,user_accept_status_array,oppenent_coins,user_coins,days_left,hours_left,minutes_left,seconds_left,imageid1,imageid2,imageid3,imageid4,imageid5,user_score_arrray,opponent_score_array,original_image1,original_image2,original_image3,original_image4,original_image5,game_nudge_status_array;
int days, hours, minutes, seconds;
int secondsLeft;
float height;
UIView *tnsView;
UIView *usenamepopupview;
UITextField *unametextfield;
UIView *emailpopupview;
UITextField *emailtextfield;

FontLabel *secondfrstLabel ;
FontLabel *hoursfrstLabel;
FontLabel *hoursscndLabel;
FontLabel *daysfrstLabel ;
FontLabel *daysscndLabel;
FontLabel *minutesfrstLabel;
FontLabel *minutesscndLabel;
int seconds1;
int minutes1;
int hours1;
int days1;

FontLabel *secondscndLabel;
NSString  *gameid;
NSString *gid;
NSString *optime1;
NSString *optime2;
NSString *optime3;
NSString *optime4;
NSString *optime5;
NSString *opans1;
NSString *opans2;
NSString *opans3;
NSString *opans4;
NSString *opans5;


NSString *quicktime1;
NSString *quicktime2;
NSString *quicktime3;
NSString *quicktime4;
NSString *quicktime5;
NSString *opponent_score;
NSString *user_score;


int oppcount=0;
NSString *opp;
NSMutableArray *ocoins;
NSMutableArray *ucoins;
UIButton *facebook;
UIButton *policy;
UIButton *terms_and_services;
UIButton *shop;
NSString *userupdateacceptstatus;
NSMutableArray *lineImageArray;
UIView *createpopup;

#define REFRESH_HEADER_HEIGHT 52.0f

- (id)initWithStyle:(UITableViewStyle)style {
   // self = [super initWithStyle:style];
    if (self != nil) {
        [self setupStrings];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self setupStrings];
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setupStrings];

    }
    return self;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section    {
    return 1;
}

- (void)postForFacebookFriends
{
    NSString *FB_Token= [[NSUserDefaults standardUserDefaults] objectForKey:@"FBAccessTokenKey"];
    NSLog(@"access_token: %@    id: %@", FB_Token,  [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"]);
    NSString* post=[NSString stringWithFormat:@"access_token=%@&fb_access_token=%@&fbid=%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"], FB_Token, [[NSUserDefaults standardUserDefaults] objectForKey:@"fbid"]];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/fbfriends.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSError *error = nil;
    NSURLResponse *response = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    
    if (data) 
    {
        NSLog(@"string: %@", [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        
        registered = [[NSMutableArray alloc]init];
        
        NSDictionary *jsonFB = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSLog(@"json :%@", jsonFB);
        
        if([jsonFB objectForKey:@"error"]) {
              
            UIAlertView* a=[[UIAlertView alloc]initWithTitle:@"" message:@"error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [a show];
            [self hideActivityIndicater];
        }
        else {
            if([jsonFB objectForKey:@"registered"]!=(id)[NSNull null]) {
                registered=[NSMutableArray arrayWithArray:[jsonFB objectForKey:@"registered"]];
            }
            notRegistered=[[NSMutableArray alloc] init];
            notRegistered = [jsonFB objectForKey:@"not registered"];
            
            NSLog(@"%@ %@", registered, notRegistered);
            [self hideActivityIndicater];
            [self performSegueWithIdentifier:@"fb" sender:nil];
        }
    }
}



-(void)statistics_Clicked
{
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    StatisticsViewController *a=[[StatisticsViewController alloc]initWithNibName:@"StatisticsViewController" bundle:nil];
    // a.userName =userName;
    [self.navigationController pushViewController:a animated:YES];
    /*
    UIImageView *tnsimgview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,300,400)];
    tnsimgview.image=[UIImage imageNamed:@"terms-n-services.png"];
    
    tnsView = [[UIView alloc] initWithFrame:CGRectMake(10,52,300,400)];
    [tnsView addSubview:tnsimgview];
    UIButton *cancel= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    cancel.frame = CGRectMake(274,7,20,24);
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn.png"]  forState:UIControlStateNormal];
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn_active.png"]  forState:UIControlStateHighlighted];
    [tnsView addSubview:cancel];
    [cancel addTarget:self
               action:@selector(canceltermsnservicesclicked)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    

    [self attachPopUpAnimationToView:tnsView];
    [self.view addSubview:tnsView];
*/    
}

-(void)policy_Clicked
{
    UIImageView *tnsimgview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,300,400)];
    tnsimgview.image=[UIImage imageNamed:@"policy-1.png"];
    
    tnsView = [[UIView alloc] initWithFrame:CGRectMake(10,52,300,400)];
    [tnsView addSubview:tnsimgview];
    UIButton *cancel= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    cancel.frame = CGRectMake(274,7,20,24);
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1@2x.png"]  forState:UIControlStateNormal];
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1_active@2x.png"]  forState:UIControlStateHighlighted];
    [tnsView addSubview:cancel];
    [cancel addTarget:self
               action:@selector(canceltermsnservicesclicked)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    
    [self attachPopUpAnimationToView:tnsView];
    [self.view addSubview:tnsView];
    
}



- (void)drawViewForCell:(UITableView *)tableViewCell
{
    
       [gamesScroll removeFromSuperview];
    gamesScroll=nil;
    [terms_and_services removeFromSuperview];
    [facebook removeFromSuperview];
    facebook=nil;
    [shop removeFromSuperview];
    shop=nil;
    UIButton *button1 = [[UIButton alloc]init];
    button1 = [UIButton buttonWithType:UIButtonTypeCustom];
     
    button1.frame = CGRectMake(5,2, 310,40);
    [button1 setBackgroundImage:[UIImage imageNamed:@"create_game_btn@2x.png"] forState:UIControlStateNormal];
     [button1 setBackgroundImage:[UIImage imageNamed:@"create_game_btn_h@2x.png"] forState:UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(newGameClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    
      button1.tag = 3001;
    button1.enabled = YES;
    button1.userInteractionEnabled = YES;
    [tableViewCell addSubview:button1];
    //NSLog(@"days_left %c",[days_left characterAtIndex:1]);
//char b=[days_left characterAtIndex:1];
  //  char b;

//a= [days_left characterAtIndex:0];
        // b=[days_left characterAtIndex:1];
   // UILabel *daysfirstcharacter = [[UILabel alloc]initWithFrame:CGRectMake(77, 10, 60, 20)];
  //daysfirstcharacter.text=[NSString stringWithFormat: @"%@",a];
    
    
    
    UIButton *button2 = [[UIButton alloc]init];
    button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    // [button1 setTitle:@"Create Game" forState:UIControlStateNormal];
    
    button2.frame = CGRectMake(9, 45, 300,50);
    [button2 setBackgroundImage:[UIImage imageNamed:@"clock_bg@2x.png"] forState:UIControlStateNormal];
    seconds1=[seconds_left intValue];
     minutes1=[minutes_left intValue];
    hours1=[hours_left intValue];
    days1=[days_left intValue];
    NSLog(@"Time=%d%d%d%d",seconds1,minutes1,hours1,days1);    
    
    
    // [button2 addTarget:self action:@selector(progressClicked) forControlEvents:UIControlEventTouchUpInside];

    
    gamesScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(10,84,305, 60)];
    [gamesScroll setBackgroundColor:[UIColor clearColor]];
    

   // [button2 setShowsTouchWhenHighlighted:YES];
    button2.tag = 3002;
    button2.enabled =YES;
    button2.userInteractionEnabled =NO;
    [tableViewCell addSubview:button2];
   // daysfrstLabel = [[UILabel alloc]initWithFrame:CGRectMake(106, 6, 55, 30)];
    daysfrstLabel=[[FontLabel alloc]initWithFrame:CGRectMake(105, 3, 20, 35) fontName:@"myFont" pointSize:28.0];
    [daysfrstLabel setNumberOfLines:2];
    // [nameLabel setTextAlignment:UITextAlignmentCenter];
    [daysfrstLabel setBackgroundColor:[UIColor clearColor]];
     daysfrstLabel.textColor=[UIColor darkGrayColor];
   // daysfrstLabel.backgroundColor=[UIColor redColor];
    daysfrstLabel.textAlignment=UITextAlignmentCenter;
     NSString *a=[NSString stringWithFormat:@"%@",days_left ];
    daysfrstLabel.text=@"0" ;
  //  daysfrstLabel.font = [UIFont fontWithName:@"TrueType" size:24];
   // [daysfrstLabel setFont:[UIFont boldSystemFontOfSize:28]];
    [button2 addSubview:daysfrstLabel];
   // daysscndLabel = [[UILabel alloc]initWithFrame:CGRectMake(128,6,55,30)];
    daysscndLabel=[[FontLabel alloc]initWithFrame:CGRectMake(127, 3, 20, 35) fontName:@"myFont" pointSize:28.0];
    daysscndLabel.textColor=[UIColor darkGrayColor];
    
  //  [button7 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];

    [daysfrstLabel setNumberOfLines:3];
    // [nameLabel setTextAlignment:UITextAlignmentCenter];
    [daysscndLabel setBackgroundColor:[UIColor clearColor]];
          daysscndLabel.text=[NSString stringWithFormat:@"%@",[a substringToIndex:1 ]] ;
   // daysscndLabel.font = [UIFont fontWithName:@"TrueType" size:29];
   // [daysscndLabel setFont:[UIFont boldSystemFontOfSize:28]];
    [button2 addSubview:daysscndLabel];
    daysscndLabel.textAlignment=UITextAlignmentCenter;
   // daysscndLabel.backgroundColor=[UIColor redColor];
    NSString *b=[NSString stringWithFormat:@"%@",hours_left ];

    
   // hoursfrstLabel = [[UILabel alloc]initWithFrame:CGRectMake(156, 6, 55, 30)];
    hoursfrstLabel=[[FontLabel alloc]initWithFrame:CGRectMake(154, 3, 20, 35) fontName:@"myFont" pointSize:28.0];
    [hoursfrstLabel setNumberOfLines:2];
    // [nameLabel setTextAlignment:UITextAlignmentCenter];
    [hoursfrstLabel setBackgroundColor:[UIColor clearColor]];
    hoursfrstLabel.text=[NSString stringWithFormat:@"%@",[b substringToIndex:1]] ;
    NSLog(@"Hours=%@",[NSString stringWithFormat:@"%@",[b substringToIndex:1]]);
   // hoursfrstLabel.font = [UIFont fontWithName:@"TrueType" size:20];
    //[hoursfrstLabel setFont:[UIFont boldSystemFontOfSize:28]];
     hoursfrstLabel.textColor=[UIColor darkGrayColor];
   // hoursfrstLabel.backgroundColor=[UIColor redColor];
    hoursfrstLabel.textAlignment=UITextAlignmentCenter;
    
    [button2 addSubview:hoursfrstLabel];
    
    //hoursscndLabel = [[UILabel alloc]initWithFrame:CGRectMake(176, 6, 55, 30)];
    hoursscndLabel= [[FontLabel alloc]initWithFrame:CGRectMake(176, 3, 20, 35) fontName:@"myFont" pointSize:28.0];
    [hoursscndLabel setNumberOfLines:2];
    // [nameLabel setTextAlignment:UITextAlignmentCenter];
    [hoursscndLabel setBackgroundColor:[UIColor clearColor]];
     hoursscndLabel.textColor=[UIColor darkGrayColor];
    //hoursscndLabel.backgroundColor=[UIColor redColor];
    hoursscndLabel.textAlignment=UITextAlignmentCenter;
    if(b.length>1)
    {
    hoursscndLabel.text=[NSString stringWithFormat:@"%@",[b substringWithRange:[b rangeOfComposedCharacterSequenceAtIndex:1]]] ;
         NSLog(@"Hours=%@",[NSString stringWithFormat:@"%@",[b substringWithRange:[b rangeOfComposedCharacterSequenceAtIndex:1]]]);
    }
    else{
        hoursfrstLabel.text=@"0";
        hoursscndLabel.text=[NSString stringWithFormat:@"%@",[b substringToIndex:1]] ;
         NSLog(@"Hours=%@",[NSString stringWithFormat:@"%@",[b substringToIndex:1]]);

    }
   // hoursscndLabel.font = [UIFont fontWithName:@"TrueType" size:20];
  //  [hoursscndLabel setFont:[UIFont boldSystemFontOfSize:28]];
    [button2 addSubview:hoursscndLabel];
     NSString *c=[NSString stringWithFormat:@"%@",minutes_left ];
  //  minutesfrstLabel = [[UILabel alloc]initWithFrame:CGRectMake(206, 6, 55, 30)];
    minutesfrstLabel=[[FontLabel alloc]initWithFrame:CGRectMake(203, 3, 20, 35) fontName:@"myFont" pointSize:28.0];
    [minutesfrstLabel setNumberOfLines:2];
    // [nameLabel setTextAlignment:UITextAlignmentCenter];
    [minutesfrstLabel setBackgroundColor:[UIColor clearColor]];
    minutesfrstLabel.text=[NSString stringWithFormat:@"%@",[c substringToIndex:1]] ;
;
     minutesfrstLabel.textColor=[UIColor darkGrayColor];
   // minutesfrstLabel.backgroundColor=[UIColor redColor];
    minutesfrstLabel.textAlignment=UITextAlignmentCenter;
  //  minutesfrstLabel.font = [UIFont fontWithName:@"TrueType" size:20];
    //[minutesfrstLabel setFont:[UIFont boldSystemFontOfSize:28]];
    [button2 addSubview:minutesfrstLabel];
    
    //minutesscndLabel = [[UILabel alloc]initWithFrame:CGRectMake(226, 6, 55, 30)];
    minutesscndLabel=[[FontLabel alloc]initWithFrame:CGRectMake(225, 3, 20, 35) fontName:@"myFont" pointSize:28.0];
    [minutesscndLabel setNumberOfLines:2];
    // hourLabel.textColor=[UIColor darkGrayColor];
    // [nameLabel setTextAlignment:UITextAlignmentCenter];
    [minutesscndLabel setBackgroundColor:[UIColor clearColor]];
     minutesscndLabel.textColor=[UIColor darkGrayColor];
  //  minutesscndLabel.backgroundColor=[UIColor redColor];
    minutesscndLabel.textAlignment=UITextAlignmentCenter;

   if(c.length>1)
   {
    minutesscndLabel.text=[NSString stringWithFormat:@"%@",[c substringWithRange:[c rangeOfComposedCharacterSequenceAtIndex:1]]] ;
   }
   else{
       minutesfrstLabel.text=@"0";
       minutesscndLabel.text=[NSString stringWithFormat:@"%@",[c substringToIndex:1]] ;

   }
 //   minutesscndLabel.font = [UIFont fontWithName:@"TrueType" size:20];
  //  [minutesscndLabel setFont:[UIFont boldSystemFontOfSize:28]];
    [button2 addSubview:minutesscndLabel];
    
NSString *d=[NSString stringWithFormat:@"%@",seconds_left ];
  //  secondfrstLabel = [[UILabel alloc]initWithFrame:CGRectMake(256, 6, 55, 30)];
    secondfrstLabel=[[FontLabel alloc]initWithFrame:CGRectMake(252, 3, 20, 35) fontName:@"myFont" pointSize:28.0f];
    [secondfrstLabel setNumberOfLines:2];
    // [nameLabel setTextAlignment:UITextAlignmentCenter];
    [secondfrstLabel setBackgroundColor:[UIColor clearColor]];
     secondfrstLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;

   // secondfrstLabel.font = [UIFont fontWithName:@"TrueType" size:20];
   // [secondfrstLabel setFont:[UIFont boldSystemFontOfSize:28]];
     secondfrstLabel.textColor=[UIColor darkGrayColor];
    [button2 addSubview:secondfrstLabel];
   // secondfrstLabel.backgroundColor=[UIColor redColor];
    secondfrstLabel.textAlignment=UITextAlignmentCenter;
    
    //secondscndLabel = [[UILabel alloc]initWithFrame:CGRectMake(276,6, 55, 30)];
    secondscndLabel=[[FontLabel alloc]initWithFrame:CGRectMake(274, 3, 20, 35) fontName:@"myFont" pointSize:28.0f];
    [secondscndLabel setNumberOfLines:2];
    // [nameLabel setTextAlignment:UITextAlignmentCenter];
    [secondscndLabel setBackgroundColor:[UIColor clearColor]];
     secondscndLabel.textColor=[UIColor darkGrayColor];
  //  secondscndLabel.backgroundColor=[UIColor redColor];
    secondscndLabel.textAlignment=UITextAlignmentCenter;
 //   [secondfrstLabel sizeToFit];
  //  [secondscndLabel sizeToFit];
    
    if(d.length>1)
    {
    secondscndLabel.text=[NSString stringWithFormat:@"%@",[d substringWithRange:[d rangeOfComposedCharacterSequenceAtIndex:1]]];
    }
else
{
    secondfrstLabel.text=@"0";
    secondscndLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;
    
   
}
 //   secondscndLabel.font = [UIFont fontWithName:@"TrueType" size:20];
   // [secondscndLabel setFont:[UIFont boldSystemFontOfSize:28]];
    [button2 addSubview:secondscndLabel];
    
     
    
    
    int i;
    
     int j=10;
    UIButton *button6;
       for (i=0; i<names.count ;i++) {
        gid=[gameidarray objectAtIndex:i];

        
           button6 = [[UIButton alloc]init];
        button6 = [UIButton buttonWithType:UIButtonTypeCustom];
        // [button1 setTitle:@"5" forState:UIControlStateNormal];
        button6.frame = CGRectMake(0,j, 305,60);
         button6.enabled = YES;
        button6.userInteractionEnabled = YES;
        
        j=j+60;
        
        
        UIImageView *separatorline = [[UIImageView alloc]initWithFrame:CGRectMake(1,3,295,2)];
        separatorline.image=[UIImage imageNamed: @"separator_line@2x.png"];
        [button6 addSubview:separatorline];
        
                 // NSString *urlString5=[images objectAtIndex:i];  
       // NSURL *url115 = [NSURL URLWithString:urlString5];  
     //NSData   *data5=[NSData dataWithContentsOfURL:url115];
         AsyncImageView *imageView = [[AsyncImageView alloc]initWithFrame:CGRectMake(10, 10,50,50)];
             //[imageView setImage:[UIImage imageWithData:data5]];
          [imageView loadImageFromURL:[NSURL URLWithString:[images objectAtIndex:i]]];
           
         [button6 addSubview:imageView];
        
        
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(77, 10, 60, 20)];
        [nameLabel setNumberOfLines:2];
       // [nameLabel setTextAlignment:UITextAlignmentCenter];
        [nameLabel setBackgroundColor:[UIColor clearColor]];
        nameLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:10];
[nameLabel setFont:[UIFont boldSystemFontOfSize:10]];
        nameLabel.textColor=[UIColor darkGrayColor];

        
        nameLabel.text=[names objectAtIndex:i];
        UILabel *statusLabel = [[UILabel alloc]initWithFrame:CGRectMake(107, 35, 70,20)];
        [statusLabel setTextAlignment:UITextAlignmentCenter];
        //
        [statusLabel setNumberOfLines:2];
        
        [statusLabel setBackgroundColor:[UIColor clearColor]];
        statusLabel.textColor=[UIColor darkGrayColor];


        UILabel *ocoinlabel = [[UILabel alloc]initWithFrame:CGRectMake(79,35,70,20)];
        [ocoinlabel setNumberOfLines:3];
       // [ocoinlabel setTextAlignment:UITextAlignmentCenter];
        
        [ocoinlabel setBackgroundColor:[UIColor clearColor]];

        ocoinlabel.text=[opponent_score_array objectAtIndex:i];
           
         ocoinlabel.font = [UIFont fontWithName:@"Helvetica Neue" size:22];
        ocoinlabel.textColor=[UIColor darkGrayColor];

        [ocoinlabel setFont:[UIFont boldSystemFontOfSize:22]];
        UILabel *ucoinlabel = [[UILabel alloc]initWithFrame:CGRectMake(159,35,70,20)];
        [ucoinlabel setNumberOfLines:3];
        // [ocoinlabel setTextAlignment:UITextAlignmentCenter];
        [ucoinlabel setBackgroundColor:[UIColor clearColor]];

        ucoinlabel.textColor=[UIColor darkGrayColor];

        
        ucoinlabel.text=[user_score_arrray objectAtIndex:i];
        UILabel *colon = [[UILabel alloc]initWithFrame:CGRectMake(119,35,70,20)];
        [colon setNumberOfLines:2];
        // [ocoinlabel setTextAlignment:UITextAlignmentCenter];
        ucoinlabel.font = [UIFont fontWithName:@"Helvetica Neue" size:22];
       [ucoinlabel setFont:[UIFont boldSystemFontOfSize:22]];
        
        colon.text=@":";
         colon.font = [UIFont fontWithName:@"Helvetica Neue" size:22];
       [colon setFont:[UIFont boldSystemFontOfSize:20]];
        [colon setBackgroundColor:[UIColor clearColor]];

        colon.textColor=[UIColor darkGrayColor];

        UILabel *me= [[UILabel alloc]initWithFrame:CGRectMake(159,10,30,20)];
        [me setNumberOfLines:2];
        // [ocoinlabel setTextAlignment:UITextAlignmentCenter];
        [me setBackgroundColor:[UIColor clearColor]];

        
        me.text=@"Me";
         me.font = [UIFont fontWithName:@"Helvetica Neue" size:10];
        [me setFont:[UIFont boldSystemFontOfSize:10]];
        me.textColor=[UIColor darkGrayColor];

        
        UIButton *button3;
        //[button3 removeFromSuperview];
        //button3=nil;
        
       
        NSString *s=[arr objectAtIndex:i ];
        NSString *s1=[user_accept_status_array objectAtIndex:i];
           NSString *game_nudge_status=[game_nudge_status_array objectAtIndex:i];
                       
        button3 = [[UIButton alloc]init];
        button3 = [UIButton buttonWithType:UIButtonTypeCustom];
                
    //    [button6 addSubview:statusLabel];
       
        
        if([s1 intValue]==3)//over
        {
            
               
            
            [statusLabel setTextColor:[UIColor grayColor]];
            [statusLabel setText:@"waiting"];
            // [button6 setShowsTouchWhenHighlighted:NO];
            // [button3 removeFromSuperview];
            //button3=nil;
            
            button3 = [[UIButton alloc]init];
            button3 = [UIButton buttonWithType:UIButtonTypeCustom];
            //  [button3 setTitle:@"5" forState:UIControlStateNormal];
            [button3 setBackgroundImage:[UIImage imageNamed:@"over_btn_h@2x.png"] forState:UIControlStateHighlighted];
            [button3 setBackgroundImage:[UIImage imageNamed:@"over_btn@2x.png"] forState:UIControlStateNormal];
            button3.frame = CGRectMake(180+25 ,20, 70, 27);
           
            [button3 addTarget:self action:@selector(overClicked:) forControlEvents:UIControlEventTouchUpInside];
            //  [button3 setShowsTouchWhenHighlighted:YES];
            button3.tag = i;
            button3.enabled = YES;
            button3.userInteractionEnabled = YES;
            
            UIImageView *imageViewline = [[UIImageView alloc]initWithFrame:CGRectMake(5,10,4,52)];
            imageViewline.image=[UIImage imageNamed: @"red_line@2x.png"];
            [button6 addSubview:imageViewline];
            [lineImageArray addObject:imageViewline];
        }
        
        
      else if([s1 intValue]==1)//accept
        {
            button3 = [[UIButton alloc]init];
            button3 = [UIButton buttonWithType:UIButtonTypeCustom];
            //  [button3 setTitle:@"5" forState:UIControlStateNormal];
            [button3 setBackgroundImage:[UIImage imageNamed:@"accept_btn@2x.png"] forState:UIControlStateNormal];
            [button3 setBackgroundImage:[UIImage imageNamed:@"accept_btn_h@2x.png"] forState:UIControlStateHighlighted];
            
            button3.frame = CGRectMake(180+25,20,70,27);
           // gid=[gameidarray objectAtIndex:i];

            [button3 addTarget:self action:@selector(acceptClicked:) forControlEvents:UIControlEventTouchUpInside];
           // [button3 setShowsTouchWhenHighlighted:YES];
            button3.tag = i;
            button3.enabled = YES;
            button3.userInteractionEnabled = YES;
           // gid=[gameidarray objectAtIndex:i];
            [button6 addSubview:button3];
            // gameid=[[gameidarray objectAtIndex:i] intValue];
           // gid=[gameidarray objectAtIndex:i];
           
            UIImageView *imageViewline = [[UIImageView alloc]initWithFrame:CGRectMake(5,10,4,52)];
            imageViewline.image=[UIImage imageNamed: @"orange_line@2x.png"];
            [button6 addSubview:imageViewline];
            [lineImageArray addObject:imageViewline];
        }
        
        
      
        else if([s1 intValue]==2)//play
        {
            
            
            if([s intValue]==0)   //nudge
            {
                NSLog(@"game_nudge_status=%@",game_nudge_status);  
                if(game_nudge_status.intValue==0)
                {    
                    [statusLabel setTextColor:[UIColor grayColor]];
                    [statusLabel setText:@"waiting"];
                    // [button6 setShowsTouchWhenHighlighted:NO];
                    // [button3 removeFromSuperview];
                    //button3=nil;
                
                    button3 = [[UIButton alloc]init];
                    button3 = [UIButton buttonWithType:UIButtonTypeCustom];
                    //  [button3 setTitle:@"5" forState:UIControlStateNormal];
                    [button3 setBackgroundImage:[UIImage imageNamed:@"nudge_btn@2x.png"] forState:UIControlStateNormal];
 
                    [button3 setBackgroundImage:[UIImage imageNamed:@"nudge_btn_h@2x.png"] forState:UIControlStateHighlighted];
               // [button3 setBackgroundImage:[UIImage imageNamed:@"nudge_btn@2x.png"] forState:UIControlStateNormal];
                    button3.frame = CGRectMake(180+25 ,20, 70, 27);
                //gid=[gameidarray objectAtIndex:i];
                
                    [button3 addTarget:self action:@selector(nudgeClicked:) forControlEvents:UIControlEventTouchUpInside];
                    //  [button3 setShowsTouchWhenHighlighted:YES];
                    button3.tag = i;
                    button3.enabled = YES;
                    button3.userInteractionEnabled = YES;
                
                    UIImageView *imageViewline = [[UIImageView alloc]initWithFrame:CGRectMake(5,10,4,52)];
                    imageViewline.image=[UIImage imageNamed: @"turquoise_line@2x.png"];
                    [button6 addSubview:imageViewline];
                    [lineImageArray addObject:imageViewline];
                }
                
            }
            else
                if([s intValue]==1)
            {
        
            //[button3 removeFromSuperview];
            //button3=nil;
            // [statusLabel setTextColor:[UIColor greenColor]];
            //      [statusLabel setText:@"ready"];
            button3 = [[UIButton alloc]init];
            button3 = [UIButton buttonWithType:UIButtonTypeCustom];
            //  [button3 setTitle:@"5" forState:UIControlStateNormal];
            [button3 setBackgroundImage:[UIImage imageNamed:@"play_btn@2x.png"] forState:UIControlStateNormal];
            [button3 setBackgroundImage:[UIImage imageNamed:@"play_btn_h@2x.png"] forState:UIControlStateHighlighted];
            
            button3.frame = CGRectMake(180+25,20,70,27);
            //gid=[gameidarray objectAtIndex:i];

                [button3 addTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
           // [button3 setShowsTouchWhenHighlighted:YES];
            button3.tag = i;
            button3.enabled = YES;
            button3.userInteractionEnabled = YES;
        //    gid=[gameidarray objectAtIndex:i];
            // gameid=[[gameidarray objectAtIndex:i] intValue];
            //gid=[gameidarray objectAtIndex:i];
            
            UIImageView *imageViewline = [[UIImageView alloc]initWithFrame:CGRectMake(5,10,4,52)];
            imageViewline.image=[UIImage imageNamed: @"green_line@2x.png"];
            [button6 addSubview:imageViewline];
       [lineImageArray addObject:imageViewline];
            }}
        
        
        [button6 addSubview:button3];
        [button6 addSubview:ocoinlabel];
           [button6 addSubview:ucoinlabel];
        [button6 addSubview:me];
        [button6 addSubview:colon];
       
        
        
        
        
        
        
        [button6 addSubview:nameLabel];
        [gamesScroll addSubview:button6];
        
        
        
        
        
                
        
    
    }
 //  UIImageView *separatorline = [[UIImageView alloc]initWithFrame:CGRectMake(1,62*i+25+62,295,2)];
  //  separatorline.image=[UIImage imageNamed: @"separator_line@2x.png"];
   // [tableView addSubview:separatorline];

   
    facebook = [[UIButton alloc]init];
    facebook= [UIButton buttonWithType:UIButtonTypeCustom];
    // [button1 setTitle:@"5" forState:UIControlStateNormal];
    facebook.frame = CGRectMake(0,62*i+10,310,40);
    [facebook setBackgroundImage:[UIImage imageNamed:@"find_facebook_btn@2x.png"] forState:UIControlStateNormal]; 
    [facebook setBackgroundImage:[UIImage imageNamed:@"find_facebook_btn_h@2x.png"] forState:UIControlStateHighlighted];
    [facebook addTarget:self action:@selector(progressClicked) forControlEvents:UIControlEventTouchUpInside];
    //  [facebook setShowsTouchWhenHighlighted:YES];
    facebook.tag = i;
    facebook.enabled = YES;
    facebook.userInteractionEnabled = YES;

    shop = [[UIButton alloc]init];
    shop= [UIButton buttonWithType:UIButtonTypeCustom];
    // [button1 setTitle:@"5" forState:UIControlStateNormal];
    shop.frame = CGRectMake(0,62*i+55, 310,40);
    [shop setBackgroundImage:[UIImage imageNamed:@"shop_btn@2x.png"] forState:UIControlStateNormal]; 
    [shop setBackgroundImage:[UIImage imageNamed:@"shop_btn_h@2x.png"] forState:UIControlStateHighlighted];
    [shop addTarget:self action:@selector(shopClicked) forControlEvents:UIControlEventTouchUpInside];
    //   [shop setShowsTouchWhenHighlighted:YES];
    shop.tag = i;
    shop.enabled = YES;
    shop.userInteractionEnabled = YES;
    
    terms_and_services = [[UIButton alloc]init];
    terms_and_services= [UIButton buttonWithType:UIButtonTypeCustom];
    // [button1 setTitle:@"5" forState:UIControlStateNormal];
    terms_and_services.frame = CGRectMake(0,62*i+100, 310,40);
    [terms_and_services setBackgroundImage:[UIImage imageNamed:@"statistics.png"] forState:UIControlStateNormal];
    [terms_and_services setBackgroundImage:[UIImage imageNamed:@"statisticsonclick.png"] forState:UIControlStateHighlighted];
    [terms_and_services addTarget:self action:@selector(statistics_Clicked) forControlEvents:UIControlEventTouchUpInside];
    //   [shop setShowsTouchWhenHighlighted:YES];
    terms_and_services.tag = i;
    terms_and_services.enabled = YES;
    terms_and_services.userInteractionEnabled = YES;
  
    
    
    policy = [[UIButton alloc]init];
    policy= [UIButton buttonWithType:UIButtonTypeCustom];
    // [button1 setTitle:@"5" forState:UIControlStateNormal];
    policy.frame = CGRectMake(5,60*i+100+45+45+45+10, 310,40);
    [policy setBackgroundImage:[UIImage imageNamed:@"policy.png"] forState:UIControlStateNormal];
    [policy setBackgroundImage:[UIImage imageNamed:@"policyonclick.png"] forState:UIControlStateHighlighted];
    [policy addTarget:self action:@selector(policy_Clicked) forControlEvents:UIControlEventTouchUpInside];
    //   [shop setShowsTouchWhenHighlighted:YES];
    policy.tag = i;
    policy.enabled = YES;
    policy.userInteractionEnabled = YES;
   // [tableView addSubview:policy];
   [gamesScroll addSubview:facebook];
   [gamesScroll addSubview:terms_and_services];
   [gamesScroll addSubview:shop];
    gamesScroll.frame = CGRectMake(5,84, 310, 70*i+135);
  //  UIImageView *left = [[UIImageView alloc]initWithFrameCGRectMake(4, 192, 17, gamesScroll.frame.size.height)];
    [tableViewCell addSubview:gamesScroll];
    NSLog(@"draw view for cell is complete");
   
    
    
}
-(void)post2:(NSInteger)Tag
{
    NSLog(@" game id:%@",[gameidarray objectAtIndex:Tag]);

    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&game=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],[gameidarray objectAtIndex:Tag]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/test_current_game.php"];
    
    // NSLog(post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
 //   [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",data);
    NSError *error1;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error1];
    userupdateacceptstatus=[json objectForKey:@"user_accept_status"];
    NSLog(@"user accept status:%@",userupdateacceptstatus);
    
}

-(void)acceptClicked:(UIButton *)sender
{
    NSLog(@"%d",sender.tag);
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
    [audioPlayer play];
    }
  //  UIButton *playButton = [[UIButton alloc]init];
    //playButton.tag=sender.tag;
    [self playClicked:sender];
//    
//    if([userupdateacceptstatus intValue]==1){
//       UIButton *playButton = [[UIButton alloc]init];
//        playButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        //  [button3 setTitle:@"5" forState:UIControlStateNormal];
//        [playButton setBackgroundImage:[UIImage imageNamed:@"play_btn@2x.png"] forState:UIControlStateNormal];
//        [playButton setBackgroundImage:[UIImage imageNamed:@"play_btn_h@2x.png"] forState:UIControlStateHighlighted];
//        
//        playButton.frame = CGRectMake(0,0,70,27);
//        [playButton addTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
//       // [playButton setShowsTouchWhenHighlighted:YES];
//        playButton.tag = sender.tag;
//        playButton.enabled = YES;
//        playButton.userInteractionEnabled = YES;
//        [sender addSubview:playButton];
//
//       [(UIImageView *) [lineImageArray objectAtIndex:sender.tag] setImage:[UIImage imageNamed: @"green_line@2x.png"]];
//    }
    
    
    
}
-(void)overClicked:(UIButton *)sender
{
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
    [audioPlayer play];
    }
    //[self post2];
    
    gid=[gameidarray objectAtIndex:sender.tag];
    NSLog(@" game id:%@",[gameidarray objectAtIndex:sender.tag]);
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&game=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],[gameidarray objectAtIndex:sender.tag]];
    
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com//del_game.php"];
    
    // NSLog(post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",data);
    NSError *error1;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error1];
    userupdateacceptstatus=[json objectForKey:@"user_accept_status"];
    NSLog(@"user accept status:%@",userupdateacceptstatus);
    
    
 //[self reloadData1];
    [self showActivityIndicater];
    NSLog(@"sender.tag=%d",sender.tag);
    NSLog(@"gameidarray=%@",gameidarray);
    NSLog(@"object=%@",[gameidarray objectAtIndex:sender.tag]);
    NSMutableArray *newGameidArray=[[NSMutableArray alloc]initWithArray:gameidarray];
    NSMutableArray *newArr=[[NSMutableArray alloc]initWithArray:arr];
    NSMutableArray *newImages=[[NSMutableArray alloc]initWithArray:images];
    NSMutableArray *newUserAcceptStatusArray=[[NSMutableArray alloc]initWithArray:user_accept_status_array];
    NSMutableArray *newUserScoreArray=[[NSMutableArray alloc]initWithArray:user_score_arrray];
    NSMutableArray *newOpponentScoreArray=[[NSMutableArray alloc]initWithArray:opponent_score_array];
    NSMutableArray *newNames=[[NSMutableArray alloc]initWithArray:names];
    
    
    [newGameidArray removeObjectAtIndex:sender.tag];
    [newArr removeObjectAtIndex:sender.tag];
    [newImages removeObjectAtIndex:sender.tag];
    [newUserAcceptStatusArray removeObjectAtIndex:sender.tag];
    [newUserScoreArray removeObjectAtIndex:sender.tag];
    [newOpponentScoreArray removeObjectAtIndex:sender.tag];
    [newNames removeObjectAtIndex:sender.tag];

    gameidarray=nil;
    arr=nil;
    images=nil;
    user_accept_status_array=nil;
    user_score_arrray=nil;
    opponent_score_array=nil;
    names=nil;
    
    gameidarray=[[NSMutableArray alloc]initWithArray:newGameidArray];
    arr=[[NSMutableArray alloc]initWithArray:newArr];
    images=[[NSMutableArray alloc]initWithArray:newImages];
    user_accept_status_array=[[NSMutableArray alloc]initWithArray:newUserAcceptStatusArray];
    user_score_arrray=[[NSMutableArray alloc]initWithArray:newUserScoreArray];
    opponent_score_array=[[NSMutableArray alloc]initWithArray:newOpponentScoreArray];
    names=[[NSMutableArray alloc]initWithArray:newNames];
    
  [self drawViewForCell:tableView];
 
   [self hideActivityIndicater];
    
    
 
    
}
-(void)accepttoplay
{
    
}

-(void)nudgeClicked : (UIButton *)sender
{
        //[sender setBackgroundImage:[UIImage imageNamed:@"nudge_btn_h@2x.png"] forState:UIControlStateHighlighted];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
    [audioPlayer play];
    }
   // [self showActivityIndicater];
    NSLog(@"%@",access_token);
    NSLog(@" play game id :%@",gid);
    gid=[gameidarray objectAtIndex:sender.tag];
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&game=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"],[gameidarray objectAtIndex:sender.tag]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/nudge.php"];
    
    // NSLog(post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    // [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",data);
   // [self hideActivityIndicater];
    //[sender setBackgroundImage:[UIImage imageNamed:@"nudge_btn@2x.png"] forState:UIControlStateNormal];
    [sender removeFromSuperview];
    
}


-(void)shopClicked
{
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
     [self performSegueWithIdentifier:@"shop" sender:nil];
    
}
-(void)SaveData
{
    NSFileManager *neDir=[[NSFileManager alloc]init];
    
    for (int i=6; i<11; i++) 
    {
        NSString *getImagePathR = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%d.jpg",i]];
        NSString *getAudioPath=[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%d.mp3",i+2]];
        [neDir removeItemAtPath:getImagePathR error:NULL];
        [neDir removeItemAtPath:getAudioPath error:NULL];     
                                   
        
    }
    
    
    
    NSString *pngPatho1 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/6.jpg"];
    NSString *imagesURLo1= original_image1;
    NSURL * imageURLo1 = [NSURL URLWithString:imagesURLo1] ;
   // NSData * imageDatao1 = [NSData dataWithContentsOfURL:imageURLo1];
    ASIHTTPRequest *requestImg1 = [ASIHTTPRequest requestWithURL:imageURLo1];
    [requestImg1 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",pngPatho1]]; //use the path from earlier
    
    [requestImg1 setDelegate:self];
    
    [requestImg1 startAsynchronous];
    NSString *dirPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/8.mp3"];
    NSURL *url = [NSURL URLWithString:audio];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request setDownloadDestinationPath:[NSString stringWithFormat:@"%@",dirPath]]; //use the path from earlier
    
    [request setDelegate:self];
    
    [request startAsynchronous];

    NSString *pngPatho2 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/7.jpg"];
    NSString *imagesURLo2= original_image2;
    NSURL * imageURLo2 = [NSURL URLWithString:imagesURLo2] ;
    //  NSData * imageDatao2 = [NSData dataWithContentsOfURL:imageURLo2];
    //  UIImage*  imageo2 = [UIImage imageWithData:imageDatao2];
    ASIHTTPRequest *requestImg2 = [ASIHTTPRequest requestWithURL:imageURLo2];
    [requestImg2 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",pngPatho2]]; //use the path from earlier
    
    [requestImg2 setDelegate:self];
    
    [requestImg2 startAsynchronous];
    
    NSString *dirPath1= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.mp3"];
    NSURL *url1 = [NSURL URLWithString:audio2];
    
    ASIHTTPRequest *request1 = [ASIHTTPRequest requestWithURL:url1];
    
    [request1 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",dirPath1]]; //use the path from earlier
    
    [request1 setDelegate:self];
    
    [request1 startAsynchronous]; 
    
   // UIImage * image1o1 = [UIImage imageWithData:imageDatao1];
  //  [imageDatao1 writeToFile:pngPatho1 atomically:YES];
    
    
   /* NSString *pngPatho2 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/7.jpg"];
    NSString *imagesURLo2= original_image2;
    NSURL * imageURLo2 = [NSURL URLWithString:imagesURLo2] ;
  //  NSData * imageDatao2 = [NSData dataWithContentsOfURL:imageURLo2];
  //  UIImage*  imageo2 = [UIImage imageWithData:imageDatao2];
    ASIHTTPRequest *requestImg2 = [ASIHTTPRequest requestWithURL:imageURLo2];
    [requestImg2 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",pngPatho2]]; //use the path from earlier
    
    [requestImg2 setDelegate:self];
    
    [requestImg2 startAsynchronous];
    
    NSString *dirPath1= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.mp3"];
    NSURL *url1 = [NSURL URLWithString:audio2];
    
    ASIHTTPRequest *request1 = [ASIHTTPRequest requestWithURL:url1];
    
    [request1 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",dirPath1]]; //use the path from earlier
    
    [request1 setDelegate:self];
    
    [request1 startAsynchronous];
   // [imageDatao2 writeToFile:pngPatho2 atomically:YES];*/
    
    NSString *pngPatho3 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/8.jpg"];
    NSString *imagesURLo3= original_image3;
    NSURL * imageURLo3 = [NSURL URLWithString:imagesURLo3] ;
   // NSData * imageDatao3 = [NSData dataWithContentsOfURL:imageURLo3];
   // UIImage * imageo3 = [UIImage imageWithData:imageDatao3];
    ASIHTTPRequest *requestImg3 = [ASIHTTPRequest requestWithURL:imageURLo3];
    [requestImg3 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",pngPatho3]]; //use the path from earlier
    
    [requestImg3 setDelegate:self];
    
    [requestImg3 startAsynchronous];
    
    NSString *dirPath2= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.mp3"];
    NSURL *url2 = [NSURL URLWithString:audio3];
    
    ASIHTTPRequest *request2 = [ASIHTTPRequest requestWithURL:url2];
    
    [request2 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",dirPath2]]; //use the path from earlier
    
    [request2 setDelegate:self];
    
    [request2 startAsynchronous];
    
    
    //UIImage  *imageo4 = [UIImage imageWithData:imageDatao4];
    // [imageDatao4 writeToFile:pngPatho4 atomically:YES];
        // [imageDatao5 writeToFile:pngPatho5 atomically:YES];
    NSString  *dirPath4= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/11.mp3"];
    NSURL *url4 = [NSURL URLWithString:audio4];
    
    ASIHTTPRequest *request4 = [ASIHTTPRequest requestWithURL:url4];
    
    [request4 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",dirPath4]]; //use the path from earlier
    
    [request4 setDelegate:self];
    
    [request4 startAsynchronous];
    
    
    

    
    
       
    
}


-(void)receivedPostData : (NSData *)data
{
    NSError *error1;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error1];
    quicktime1=[json valueForKey:@"quick_guess1"];
    quicktime2=[json valueForKey:@"quick_guess2"];
    quicktime3=[json valueForKey:@"quick_guess3"];
    quicktime4=[json valueForKey:@"quick_guess4"];
    quicktime5=[json valueForKey:@"quick_guess5"];
    opponent_score=[json valueForKey:@"opponent_score"];
    user_score=[json valueForKey:@"user_score"];
    oppenent_name=[json objectForKey:@"opponent_name"];
    NSLog(@"JSON= %@",json);
    
    opponent_image=[json valueForKey:@"opponent_image"];
  //  NSLog(@"%@",opponent_image);
    
    us_image=[json valueForKey:@"user_image"];
    
    
    oppenent_coins=[json valueForKey:@"opponent_coins"];
    NSLog(@"%@",oppenent_coins);
    user_coins=[json valueForKey:@"user_coins"];
    NSLog(@"%@",user_coins);
    
    
    NSDictionary *info1 = [json objectForKey:@"first_celeb"];
    audio=[info1 objectForKey:@"audio"];
    NSLog(@"value is %@", audio);
    name1=[info1 objectForKey:@"name"];
    NSLog(@"value is %@",name1);
    // pixelated_image=[info1 objectForKey:@"pixelated_image"];
    original_image1=[info1 objectForKey:@"original_image"];
    NSLog(@"value is %@",pixelated_image);
    NSArray *options=[info1 objectForKey:@"options"];
    option1=[options objectAtIndex:0];
    NSLog(@"option1: %@",option1);
    option2=[options objectAtIndex:1];
    NSLog(@"option2: %@",option2);
    
    option3=[options objectAtIndex:2];
    NSLog(@"option3: %@",option3);
    
    option4=[options objectAtIndex:3];
    NSLog(@"option4: %@",option4);
    
    imageid1=[info1 objectForKey:@"id"];
    
    
    NSDictionary *info2 = [json objectForKey:@"second_celeb"];
    audio2=[info2 objectForKey:@"audio"];
    
    name2=[info2 objectForKey:@"name"];
    
    // pixelated_image2=[info2 objectForKey:@"pixelated_image"];
    original_image2=[info2 objectForKey:@"original_image"];
    NSArray *options2=[info2 objectForKey:@"options"];
    option21=[options2 objectAtIndex:0];
    option22=[options2 objectAtIndex:1];
    option23=[options2 objectAtIndex:2];
    option24=[options2 objectAtIndex:3];
    
    
    imageid2=[info2 objectForKey:@"id"];
    
    
    
    
    NSDictionary *info3 = [json objectForKey:@"third_celeb"];
    audio3=[info3 objectForKey:@"audio"];
    
    name3=[info3 objectForKey:@"name"];
    
    // pixelated_image3=[info3 objectForKey:@"pixelated_image"];
    original_image3=[info3 objectForKey:@"original_image"];
    NSArray *options3=[info3 objectForKey:@"options"];
    option31=[options3 objectAtIndex:0];
    option32=[options3 objectAtIndex:1];
    option33=[options3 objectAtIndex:2];
    option34=[options3 objectAtIndex:3];
    
    
    imageid3=[info3 objectForKey:@"id"];
    
    
    
    NSDictionary *info4 = [json objectForKey:@"fourth_celeb"];
    audio4=[info4 objectForKey:@"audio"];
    
    name4=[info4 objectForKey:@"name"];
    
    //pixelated_image4=[info4 objectForKey:@"pixelated_image"];
    original_image4=  [info4 objectForKey:@"original_image"];
    NSArray *options4=[info4 objectForKey:@"options"];
    option41=[options4 objectAtIndex:0];
    option42=[options4 objectAtIndex:1];
    option43=[options4 objectAtIndex:2];
    option44=[options4 objectAtIndex:3];
    imageid4=[info4 objectForKey:@"id"];
    
    
    
    NSDictionary *info5 = [json objectForKey:@"fifth_celeb"];
    audio5=[info5 objectForKey:@"audio"];
    
    name5=[info5 objectForKey:@"name"];
    
    // pixelated_image5=[info5 objectForKey:@"pixelated_image"];
    original_image5=[info5 objectForKey:@"original_image"];
    NSArray *options5=[info5 objectForKey:@"options"];
    option51=[options5 objectAtIndex:0];
    option52=[options5 objectAtIndex:1];
    option53=[options5 objectAtIndex:2];
    option54=[options5 objectAtIndex:3];
    
    imageid5=[info5 objectForKey:@"id"];
    
    
    
    NSArray *opponent_answers=[json valueForKey:@"opponent_answers"];
    optime1=[opponent_answers objectAtIndex:0];
    optime2=[opponent_answers objectAtIndex:1];
    
    optime3=[opponent_answers objectAtIndex:2];
    optime4=[opponent_answers objectAtIndex:3];
    optime5=[opponent_answers objectAtIndex:4];
    NSLog(@"%@",optime1);
    NSLog(@"%@",optime2);
    NSLog(@"%@",optime3);
    NSLog(@"%@",optime4);
    NSLog(@"%@",optime5);
    NSArray *opponent_answers1=[json valueForKey:@"user_answers"];
    opans1=[opponent_answers1 objectAtIndex:0];
    opans2=[opponent_answers1 objectAtIndex:1];
    
    opans3=[opponent_answers1 objectAtIndex:2];
    opans4=[opponent_answers1 objectAtIndex:3];
    opans5=[opponent_answers1 objectAtIndex:4];
    NSLog(@"%@",opans1);
    NSLog(@"%@",opans2);
    NSLog(@"%@",opans3);
    NSLog(@"%@",opans4);
    NSLog(@"%@",opans5);
    
    if([opans1 intValue] == 1)
    {
        oppcount++;
    }
    
    
    
    if([opans2 intValue] == 1)
    {
        oppcount++;
    }
    
    
    
    if([opans3 intValue] == 1)
    {
        oppcount++;
    }
    
    
    
    if([opans4 intValue] == 1)
    {
        oppcount++;
    }
    
    
    
    if([opans5 intValue] == 1)
    {
        oppcount++;
    }

    
}

-(void)POST :(NSInteger)Tag
{
    NSLog(@"%@",access_token);
    gid=[gameidarray objectAtIndex:Tag];
     NSLog(@" play game id :%@",[gameidarray objectAtIndex:Tag]);
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&game=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"],[gameidarray objectAtIndex:Tag]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/test_current_game.php"];
    
   // NSLog(post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
  NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSError *error;
   NSURLResponse *response;
   NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
   
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",data);
    NSError *error1;
     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error1];
    quicktime1=[json valueForKey:@"quick_guess1"];
    quicktime2=[json valueForKey:@"quick_guess2"];
    quicktime3=[json valueForKey:@"quick_guess3"];
    quicktime4=[json valueForKey:@"quick_guess4"];
    quicktime5=[json valueForKey:@"quick_guess5"];
    opponent_score=[json valueForKey:@"opponent_score"];
    user_score=[json valueForKey:@"user_score"];
    NSLog(@"oldUserScore=%@",[json valueForKey:@"user_score"]);
    [[NSUserDefaults standardUserDefaults] setValue:user_score forKey:@"OldUserScore"];
   
    oppenent_name=[json objectForKey:@"opponent_name"];   
    NSLog(@"JSON= %@",json);
    
    opponent_image=[json valueForKey:@"opponent_image"];   
    NSLog(@"%@",opponent_image);

    us_image=[json valueForKey:@"user_image"];
     
    
    oppenent_coins=[json valueForKey:@"opponent_coins"];
    NSLog(@"Opponent coins=%@",oppenent_coins);
    user_coins=[json valueForKey:@"user_coins"];
    NSLog(@"Login Coins%@",user_coins);
    
    
    NSDictionary *info1 = [json objectForKey:@"first_celeb"];
    audio=[info1 objectForKey:@"audio"];
    NSLog(@"value is %@", audio);
    name1=[info1 objectForKey:@"name"];
    NSLog(@"value is %@",name1);
   // pixelated_image=[info1 objectForKey:@"pixelated_image"];
    original_image1=[info1 objectForKey:@"original_image"];
    NSLog(@"value is %@",pixelated_image);
    NSArray *options=[info1 objectForKey:@"options"];
    option1=[options objectAtIndex:0];
    NSLog(@"option1: %@",option1);
    option2=[options objectAtIndex:1];
    NSLog(@"option2: %@",option2);
    
    option3=[options objectAtIndex:2];
    NSLog(@"option3: %@",option3);
    
    option4=[options objectAtIndex:3];
    NSLog(@"option4: %@",option4);
    
    imageid1=[info1 objectForKey:@"id"];

    
    NSDictionary *info2 = [json objectForKey:@"second_celeb"];
    audio2=[info2 objectForKey:@"audio"];
    
    name2=[info2 objectForKey:@"name"];
    
   // pixelated_image2=[info2 objectForKey:@"pixelated_image"];
    original_image2=[info2 objectForKey:@"original_image"];
    NSArray *options2=[info2 objectForKey:@"options"];
    option21=[options2 objectAtIndex:0];
    option22=[options2 objectAtIndex:1];
    option23=[options2 objectAtIndex:2];
    option24=[options2 objectAtIndex:3];
    
    
    imageid2=[info2 objectForKey:@"id"];

    
    
    
    NSDictionary *info3 = [json objectForKey:@"third_celeb"];
    audio3=[info3 objectForKey:@"audio"];
    
    name3=[info3 objectForKey:@"name"];
    
   // pixelated_image3=[info3 objectForKey:@"pixelated_image"];
    original_image3=[info3 objectForKey:@"original_image"];
    NSArray *options3=[info3 objectForKey:@"options"];
    option31=[options3 objectAtIndex:0];
    option32=[options3 objectAtIndex:1];
    option33=[options3 objectAtIndex:2];
    option34=[options3 objectAtIndex:3];
    
    
    imageid3=[info3 objectForKey:@"id"];

    
    
    NSDictionary *info4 = [json objectForKey:@"fourth_celeb"];
    audio4=[info4 objectForKey:@"audio"];
    
    name4=[info4 objectForKey:@"name"];
    
    //pixelated_image4=[info4 objectForKey:@"pixelated_image"];
  original_image4=  [info4 objectForKey:@"original_image"];
    NSArray *options4=[info4 objectForKey:@"options"];
    option41=[options4 objectAtIndex:0];
    option42=[options4 objectAtIndex:1];
    option43=[options4 objectAtIndex:2];
    option44=[options4 objectAtIndex:3];
    imageid4=[info4 objectForKey:@"id"];

    
    
    NSDictionary *info5 = [json objectForKey:@"fifth_celeb"];
    audio5=[info5 objectForKey:@"audio"];
    
    name5=[info5 objectForKey:@"name"];
    
   // pixelated_image5=[info5 objectForKey:@"pixelated_image"];
    original_image5=[info5 objectForKey:@"original_image"];
    NSArray *options5=[info5 objectForKey:@"options"];
    option51=[options5 objectAtIndex:0];
    option52=[options5 objectAtIndex:1];
    option53=[options5 objectAtIndex:2];
    option54=[options5 objectAtIndex:3];
    
    imageid5=[info5 objectForKey:@"id"];

    
   
    NSArray *opponent_answers=[json valueForKey:@"opponent_answers"];
    optime1=[opponent_answers objectAtIndex:0];
    optime2=[opponent_answers objectAtIndex:1];
    
    optime3=[opponent_answers objectAtIndex:2];
    optime4=[opponent_answers objectAtIndex:3];
    optime5=[opponent_answers objectAtIndex:4];
    NSLog(@"%@",optime1);
    NSLog(@"%@",optime2);
    NSLog(@"%@",optime3);
    NSLog(@"%@",optime4);
    NSLog(@"%@",optime5);
    NSArray *opponent_answers1=[json valueForKey:@"user_answers"];
    opans1=[opponent_answers1 objectAtIndex:0];
    opans2=[opponent_answers1 objectAtIndex:1];
    
    opans3=[opponent_answers1 objectAtIndex:2];
    opans4=[opponent_answers1 objectAtIndex:3];
    opans5=[opponent_answers1 objectAtIndex:4];
    NSLog(@"%@",opans1);
    NSLog(@"%@",opans2);
    NSLog(@"%@",opans3);
    NSLog(@"%@",opans4);
    NSLog(@"%@",opans5);
    
    if([opans1 intValue] == 1)
    {
        oppcount++;
    }
    
    
    
    if([opans2 intValue] == 1)
    {
        oppcount++;
    }
    
 
    
    if([opans3 intValue] == 1)
    {
        oppcount++;
    }
    
 
    
    if([opans4 intValue] == 1)
    {
        oppcount++;
    }
    
 
    
    if([opans5 intValue] == 1)
    {
        oppcount++;
    }
    
    

 
   // gameid=[json objectForKey:@"game_id"];
    //gid=[json objectForKey:@"game_id"];
    

   // [self hideActivityIndicater];
  
    
    
}


-(void)play
{
    [audioPlayer play];
    [SVProgressHUD showWithStatus:@"Loading..." maskType:SVProgressHUDMaskTypeGradient];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];

  //  [self POST];
    [self SaveData];
    NSLog(@"data saved");
    
}

- (void)progressClicked
{
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
   // [audioPlayer play];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"FBAccessTokenKey"])
        [self postForFacebookFriends];
    
    else  [[FacebookManager facebookConnect]Call_FB];

}


- (void)playClicked:(UIButton *)sender

{
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
    [audioPlayer play];
    }
  //  [SVProgressHUD showWithStatus:@"Loading..." maskType:SVProgressHUDMaskTypeGradient];
   // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"loginplay"])
    {
  //  [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"count"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    }
    [self showActivityIndicater];
    [self POST:sender.tag];
 
    if(original_image1)
    {
        [self SaveData];
       // [self hideActivityIndicater];
        [self performSelector:@selector(callSegue) withObject:nil afterDelay:4.0];
        //[self performSegueWithIdentifier:@"Game1" sender:nil]; 
    }
    else
        [self hideActivityIndicater];

}
-(void)showActivityIndicater
{
    [meImage stopAnimating];
    [meImage removeFromSuperview];
    self.view.userInteractionEnabled=NO;
    meImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,10,320,480)];
    [self.view addSubview:meImage];
    
    
    
    
    meImage.animationImages = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"img9.png"],[UIImage imageNamed:@"img8.png"], [UIImage imageNamed:@"img7.png"], [UIImage imageNamed:@"img6.png"],[UIImage imageNamed:@"img5.png"],[UIImage imageNamed:@"img4.png"],[UIImage imageNamed:@"img3.png"],[UIImage imageNamed:@"img11.png"],[UIImage imageNamed:@"img10.png"],nil];
    [self.view addSubview:meImage];
    //[self attachPopUpAnimationToView:imageView];
    
    
    if(![meImage isAnimating]) {
        NSLog(@"no");
        meImage.animationDuration=1;
        [meImage startAnimating];
    }
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    
    


  
}
-(void)hideActivityIndicater
{
   // [myView removeFromSuperview];
    self.view.userInteractionEnabled=YES;
  // [SVProgressHUD dismiss];
    [meImage stopAnimating];
}

-(void)unameOkClicked
{
    [myView removeFromSuperview];
    optime1=nil;
    optime2=nil;
    optime3=nil;
    optime4=nil;
    optime5=nil;
    [usenamepopupview removeFromSuperview];
    self.tableView.userInteractionEnabled=YES;
    settingButton.enabled=YES;
    backButton.enabled=YES;
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    [self showActivityIndicater];
    if([unametextfield.text isEqualToString:@""])
    {
        UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"Enter any username first" message:@""  delegate:self cancelButtonTitle:@"   Cancel   " otherButtonTitles:nil, nil ];
        [alertView1 show];
        [self hideActivityIndicater];
    }
    else{
    NSString *post =[[NSString alloc] initWithFormat:@"random=%d&access_token=%@&uname=%@",0,[[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"],unametextfield.text];
    
    
    
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/test_create_game.php"];
    
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
    NSError *error1;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error1];
    // name1 = [json objectForKey:@"opponent_name"];
    //   NSLog(@"value is %@", oppenent_name);
    
    oppenent_name=[json objectForKey:@"opponent_name"];
    NSLog(@"%@",oppenent_name);
    
    
    opponent_image=[json valueForKey:@"opponent_image"];
    NSLog(@"%@",opponent_image);
    
    us_image=[json valueForKey:@"user_image"];
    oppenent_coins=[json valueForKey:@"opponent_coins"];
    NSLog(@"%@",oppenent_coins);
    user_coins=[json valueForKey:@"user_coins"];
    NSLog(@"%@",user_coins);
       NSString *fbid=[json valueForKey:@"opponent_fbid"];
        NSLog(@"fbid=%@",fbid);
       [[NSUserDefaults standardUserDefaults]setValue:fbid forKey:@"opponent_fbid"];
        [[NSUserDefaults standardUserDefaults]setBool:TRUE forKey:@"Facebook_post"];
       //NSString *fbid=@"100003112418657";
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"FBAccessTokenKey"])
        {
           //pself POST_FB];
        }
    
    NSDictionary *info1 = [json objectForKey:@"first_celeb"];
    if(![info1 objectForKey:@"original_image"])
    {
        [self hideActivityIndicater];
        NSString *msg12=[json objectForKey:@"already"];
        NSString *error=[json objectForKey:@"error"];
        if(msg12)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msg12 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            [alert show];
        }
        if(error)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            [alert show];
        }
    }
  
    audio=[info1 objectForKey:@"audio"];
    NSLog(@"value is %@", audio);
    name1=[info1 objectForKey:@"name"];
    NSLog(@"value is %@",name1);
   // pixelated_image=[info1 objectForKey:@"pixelated_image"];
original_image1=    [info1 objectForKey:@"original_image"];
    //NSLog(@"value is %@",pixelated_image);
    NSArray *options=[info1 objectForKey:@"options"];
    option1=[options objectAtIndex:0];
    NSLog(@"option1: %@",option1);
    option2=[options objectAtIndex:1];
    NSLog(@"option2: %@",option2);
    
    option3=[options objectAtIndex:2];
    NSLog(@"option3: %@",option3);
    
    option4=[options objectAtIndex:3];
    NSLog(@"option4: %@",option4);
    imageid1=[info1 objectForKey:@"id"];
    
    
    
    NSDictionary *info2 = [json objectForKey:@"second_celeb"];
    audio2=[info2 objectForKey:@"audio"];
    
    name2=[info2 objectForKey:@"name"];
    
    //pixelated_image2=[info2 objectForKey:@"pixelated_image"];
    original_image2=[info2 objectForKey:@"original_image"];
    NSArray *options2=[info2 objectForKey:@"options"];
    option21=[options2 objectAtIndex:0];
    option22=[options2 objectAtIndex:1];
    option23=[options2 objectAtIndex:2];
    option24=[options2 objectAtIndex:3];
    
    
    imageid2=[info2 objectForKey:@"id"];
    
    
    
    
    NSDictionary *info3 = [json objectForKey:@"third_celeb"];
    audio3=[info3 objectForKey:@"audio"];
    
    name3=[info3 objectForKey:@"name"];
    
    //pixelated_image3=[info3 objectForKey:@"pixelated_image"];
    original_image3=[info3 objectForKey:@"original_image"];
    NSArray *options3=[info3 objectForKey:@"options"];
    option31=[options3 objectAtIndex:0];
    option32=[options3 objectAtIndex:1];
    option33=[options3 objectAtIndex:2];
    option34=[options3 objectAtIndex:3];
    
    
    imageid3=[info3 objectForKey:@"id"];
    
    
    
    NSDictionary *info4 = [json objectForKey:@"fourth_celeb"];
    audio4=[info4 objectForKey:@"audio"];
    
    name4=[info4 objectForKey:@"name"];
    
   // pixelated_image4=[info4 objectForKey:@"pixelated_image"];
   original_image4= [info4 objectForKey:@"original_image"];
    NSArray *options4=[info4 objectForKey:@"options"];
    option41=[options4 objectAtIndex:0];
    option42=[options4 objectAtIndex:1];
    option43=[options4 objectAtIndex:2];
    option44=[options4 objectAtIndex:3];
    
    imageid4=[info4 objectForKey:@"id"];
    
    
    NSDictionary *info5 = [json objectForKey:@"fifth_celeb"];
    audio5=[info5 objectForKey:@"audio"];
    
    name5=[info5 objectForKey:@"name"];
    
   // pixelated_image5=[info5 objectForKey:@"pixelated_image"];
    original_image5=[info5 objectForKey:@"original_image"];
    NSArray *options5=[info5 objectForKey:@"options"];
    option51=[options5 objectAtIndex:0];
    option52=[options5 objectAtIndex:1];
    option53=[options5 objectAtIndex:2];
    option54=[options5 objectAtIndex:3];
    
    imageid5=[info5 objectForKey:@"id"];
    
    gid=[json objectForKey:@"game_id"];
    
    
    
    
    
    
    if(original_image1)
    {
        [self SaveData];
        //[self hideActivityIndicater];
        [self performSelector:@selector(callSegue) withObject:nil afterDelay:4.0];
       // [self performSegueWithIdentifier:@"Game1" sender:nil]; 
    }
    else
        [self hideActivityIndicater];
    
    }
    
    
}
-(void)FB_Logged_In_Successfully
{
    
        NSLog(@"Loged In successful");
    [self postForFacebookFriends];
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

-(void)usernameclicked
{
   // [myView removeFromSuperview];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }

    [createpopup removeFromSuperview];
    UIImageView *createusernamepopupbackview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,300,110)];
    createusernamepopupbackview.image=[UIImage imageNamed:@"username-1.png"];
    
    
    usenamepopupview = [[UIView alloc] initWithFrame:CGRectMake(10,52,300,110)];
    [usenamepopupview addSubview:createusernamepopupbackview];
    UIImageView *textback=[[UIImageView alloc]initWithFrame:CGRectMake(10,65,280,30)];
    textback.image=[UIImage imageNamed:@"textinput.png"];
    [usenamepopupview addSubview:textback];
    
    
    unametextfield=[[UITextField alloc]init];
    unametextfield.frame= CGRectMake(4,3,278,29);
    unametextfield.placeholder =@"Type here";
    [unametextfield becomeFirstResponder];
        unametextfield.keyboardType = UIKeyboardAppearanceDefault;
        [unametextfield setReturnKeyType:UIReturnKeyDone];
        unametextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        unametextfield.tag = 100;
        unametextfield.borderStyle = UITextBorderStyleNone;
       [unametextfield setReturnKeyType:UIReturnKeyDone];
    [unametextfield setEnablesReturnKeyAutomatically:YES];
    unametextfield.delegate = self;
    [textback addSubview:unametextfield];
    
    
     UIButton  *ok=[[UIButton alloc]init];
    
    ok = [UIButton buttonWithType:UIButtonTypeCustom];
    
    ok.frame = CGRectMake(200,32,80,30);
    ok.enabled = YES;
    ok.userInteractionEnabled=YES;
  //  [ok setShowsTouchWhenHighlighted:YES];
    
    [ok setImage:[UIImage imageNamed:@"ok_btn@2x.png"] forState:UIControlStateNormal];
    [ok setImage:[UIImage imageNamed:@"ok_btnonclick.png"] forState:UIControlStateHighlighted];
    
    [ok addTarget:self
           action:@selector(unameOkClicked)
 forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    UIButton *cancel= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    cancel.frame = CGRectMake(272,5,22,22);
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1@2x.png"]  forState:UIControlStateNormal];
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1_active@2x.png"]  forState:UIControlStateHighlighted];
    [usenamepopupview addSubview:cancel];
    [self.view addSubview:usenamepopupview];
    
    
    [cancel addTarget:self
               action:@selector(cancelemailclicked)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    

    
    //  [popupview setBackgroundColor:[UIColor whiteColor]];
    [usenamepopupview addSubview:ok];
    
    [self attachPopUpAnimationToView:usenamepopupview];
    UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"Please enter username" message:@""  delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil ];
    // [[alertView1 textFieldAtIndex:0].text ];
    
    [alertView1 setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    
    // [alertView1 show];
  //  [alertView1 release];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [unametextfield resignFirstResponder];
    [emailtextfield resignFirstResponder];
    
    
    return YES;
}

-(void)emailOkClicked
{
    [myView removeFromSuperview];
    optime1=nil;
    optime2=nil;
    optime3=nil;
    optime4=nil;
    optime5=nil;
    self.tableView.userInteractionEnabled=YES;
    settingButton.enabled=YES;
    backButton.enabled=YES;
    [emailpopupview removeFromSuperview];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    [self showActivityIndicater];
    
    NSString *post =[[NSString alloc] initWithFormat:@"random=%d&access_token=%@&email=%@",0,[[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"],emailtextfield.text];
    
    NSLog(@"email%@",emailtextfield.text);
    NSString *emailid = emailtextfield.text;
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL myStringMatchesRegEx=[emailTest evaluateWithObject:emailid];
    if(!myStringMatchesRegEx)
    {
        UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"Invalid e-mail format" message:@""  delegate:self cancelButtonTitle:@"   Cancel   " otherButtonTitles:nil, nil ];
        [alertView1 show];
        [self hideActivityIndicater];
    }
    else{
        
    
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/test_create_game.php"];
    
    
    // NSLog(post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
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
    NSError *error1;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error1];
    // name1 = [json objectForKey:@"opponent_name"];
    //   NSLog(@"value is %@", oppenent_name);
    
    
    oppenent_name=[json objectForKey:@"opponent_name"];
    NSLog(@"%@",oppenent_name);
    
    
    opponent_image=[json valueForKey:@"opponent_image"];
    
    NSLog(@"%@",opponent_image);
    
    us_image=[json valueForKey:@"user_image"];
    oppenent_coins=[json valueForKey:@"opponent_coins"];
    NSLog(@"%@",oppenent_coins);
    user_coins=[json valueForKey:@"user_coins"];
    NSLog(@"%@",user_coins);
    
    
    [[NSUserDefaults standardUserDefaults]setBool:TRUE forKey:@"Facebook_post"];
    
    
    NSDictionary *info1 = [json objectForKey:@"first_celeb"];
    if(![info1 objectForKey:@"original_image1"])
    {
        [self hideActivityIndicater];
        NSString *msg12=[json objectForKey:@"already"];
        
        NSString *error=[json objectForKey:@"error"];
        if(msg12)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msg12 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            [alert show];
        }
        if(error){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            [alert show];
        }
    }
    audio=[info1 objectForKey:@"audio"];
    NSLog(@"value is %@", audio);
    name1=[info1 objectForKey:@"name"];
    NSLog(@"value is %@",name1);
    //pixelated_image=[info1 objectForKey:@"pixelated_image"];
    original_image1=[info1 objectForKey:@"original_image"];
    NSLog(@"value is %@",pixelated_image);
    NSArray *options=[info1 objectForKey:@"options"];
    option1=[options objectAtIndex:0];
    NSLog(@"option1: %@",option1);
    option2=[options objectAtIndex:1];
    NSLog(@"option2: %@",option2);
    
    option3=[options objectAtIndex:2];
    NSLog(@"option3: %@",option3);
    
    option4=[options objectAtIndex:3];
    NSLog(@"option4: %@",option4);
    
    
    imageid1=[info1 objectForKey:@"id"];
    
    
    NSDictionary *info2 = [json objectForKey:@"second_celeb"];
    audio2=[info2 objectForKey:@"audio"];
    
    name2=[info2 objectForKey:@"name"];
    
    //pixelated_image2=[info2 objectForKey:@"pixelated_image"];
    original_image2=[info2 objectForKey:@"original_image"];
    NSArray *options2=[info2 objectForKey:@"options"];
    option21=[options2 objectAtIndex:0];
    option22=[options2 objectAtIndex:1];
    option23=[options2 objectAtIndex:2];
    option24=[options2 objectAtIndex:3];
    
    imageid2=[info2 objectForKey:@"id"];
    
    
    
    
    
    NSDictionary *info3 = [json objectForKey:@"third_celeb"];
    audio3=[info3 objectForKey:@"audio"];
    
    name3=[info3 objectForKey:@"name"];
    
   // pixelated_image3=[info3 objectForKey:@"pixelated_image"];
    original_image3=[info3 objectForKey:@"original_image"];
    NSArray *options3=[info3 objectForKey:@"options"];
    option31=[options3 objectAtIndex:0];
    option32=[options3 objectAtIndex:1];
    option33=[options3 objectAtIndex:2];
    option34=[options3 objectAtIndex:3];
    
    imageid3=[info3 objectForKey:@"id"];
    
    
    
    
    NSDictionary *info4 = [json objectForKey:@"fourth_celeb"];
    audio4=[info4 objectForKey:@"audio"];
    
    name4=[info4 objectForKey:@"name"];
    
   // pixelated_image4=[info4 objectForKey:@"pixelated_image"];
    original_image4=[info4 objectForKey:@"original_image"];
    NSArray *options4=[info4 objectForKey:@"options"];
    option41=[options4 objectAtIndex:0];
    option42=[options4 objectAtIndex:1];
    option43=[options4 objectAtIndex:2];
    option44=[options4 objectAtIndex:3];
    imageid4=[info4 objectForKey:@"id"];
    
    
    
    NSDictionary *info5 = [json objectForKey:@"fifth_celeb"];
    audio5=[info5 objectForKey:@"audio"];
    
    name5=[info5 objectForKey:@"name"];
    
   // pixelated_image5=[info5 objectForKey:@"pixelated_image"];
  original_image5=  [info5 objectForKey:@"original_image"];
    NSArray *options5=[info5 objectForKey:@"options"];
    option51=[options5 objectAtIndex:0];
    option52=[options5 objectAtIndex:1];
    option53=[options5 objectAtIndex:2];
    option54=[options5 objectAtIndex:3];
    
    imageid5=[info5 objectForKey:@"id"];
    
    
    
    gid=[json objectForKey:@"game_id"];
    
    
    
    
    
    
    
    
    
    
    
    
    if(original_image1)
    {
        [self SaveData];
       // [self hideActivityIndicater];
        [self performSelector:@selector(callSegue) withObject:nil afterDelay:4.0];
        //[self performSegueWithIdentifier:@"Game1" sender:nil]; 
    }
    else
        [self hideActivityIndicater];
    }
    
}
-(void)facebookclicked
{
    [myView removeFromSuperview];
    [self showActivityIndicater];
    self.tableView.userInteractionEnabled=YES;
    settingButton.enabled=YES;
    backButton.enabled=YES;
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }

    [createpopup removeFromSuperview];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"FBAccessTokenKey"])
        [self postForFacebookFriends];
    
    else  {
        
      //  [[NSUserDefaults standardUserDefaults]setInteger:0
                                                  //forKey:@"count"];
        //[[NSUserDefaults standardUserDefaults]synchronize];
        
        
    [[FacebookManager facebookConnect]Call_FB];
        [self hideActivityIndicater];
        
    }
    
    
}
-(void)emailclicked
{
   // [myView removeFromSuperview];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }

    [createpopup removeFromSuperview];
    UIImageView *createemailpopupbackview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,300,110)];
    createemailpopupbackview.image=[UIImage imageNamed:@"email-1.png"];
    
    emailpopupview = [[UIView alloc] initWithFrame:CGRectMake(10,52,300,110)];
    [emailpopupview addSubview:createemailpopupbackview];
    UIImageView *textback=[[UIImageView alloc]initWithFrame:CGRectMake(10,65,280,30)];
    textback.image=[UIImage imageNamed:@"textinput.png"];
    [emailpopupview addSubview:textback];
    
    
    emailtextfield=[[UITextField alloc]init];
    emailtextfield.frame= CGRectMake(4,3,278,29);
    emailtextfield.placeholder =@"Type here";
    [emailtextfield becomeFirstResponder];
    emailtextfield.keyboardType = UIKeyboardAppearanceDefault;
    [unametextfield setReturnKeyType:UIReturnKeyDone];
    emailtextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    emailtextfield.tag = 100;
    emailtextfield.borderStyle = UITextBorderStyleNone;
    [emailtextfield setReturnKeyType:UIReturnKeyDone];
    [emailtextfield setEnablesReturnKeyAutomatically:YES];
    emailtextfield.delegate = self;
    [textback addSubview:emailtextfield];
    
    
  
    UIButton  *ok=[[UIButton alloc]init];
    
    ok = [UIButton buttonWithType:UIButtonTypeCustom];
    
    ok.frame = CGRectMake(200,32,80,30);
    ok.enabled = YES;
    ok.userInteractionEnabled=YES;
   // [ok setShowsTouchWhenHighlighted:YES];
    
    [ok setImage:[UIImage imageNamed:@"ok_btn@2x.png"] forState:UIControlStateNormal];
    [ok setImage:[UIImage imageNamed:@"ok_btnonclick.png"] forState:UIControlStateHighlighted];
    
    [ok addTarget:self
           action:@selector(emailOkClicked)
 forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    //  [popupview setBackgroundColor:[UIColor whiteColor]];
    [emailpopupview addSubview:ok];
 
    
    UIButton *cancel= [UIButton buttonWithType:UIButtonTypeCustom] ;
    cancel.frame = CGRectMake(272,5,22,22);
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1@2x.png"]  forState:UIControlStateNormal];
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1_active@2x.png"]  forState:UIControlStateHighlighted];
    [emailpopupview addSubview:cancel];
       [self.view addSubview:emailpopupview];
    
 
    [cancel addTarget:self
               action:@selector(cancelemailclicked)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    

    
    [self attachPopUpAnimationToView:emailpopupview];
    
    
    
    UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"Please Enter Email" message:@""  delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@" OK ", nil ];
    // [[alertView1 textFieldAtIndex:0].text ];
    
    [alertView1 setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    
    //[alertView1 show];
   // [alertView1 release];

}
-(void)cancelclicked
{
    [myView removeFromSuperview];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    [createpopup removeFromSuperview];
    self.tableView.userInteractionEnabled=YES;
    settingButton.enabled=YES;
    backButton.enabled=YES;
}

-(void)canceltermsnservicesclicked
{
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
   
    
    [tnsView removeFromSuperview];
}
-(void)cancelemailclicked
{
    [myView removeFromSuperview];
    self.tableView.userInteractionEnabled=YES;
    settingButton.enabled=YES;
    backButton.enabled=YES;
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    [usenamepopupview removeFromSuperview];

    [emailpopupview removeFromSuperview];
}
-(void)random1
{
    [myView removeFromSuperview];
    optime1=nil;
    optime2=nil;
    optime3=nil;
    optime4=nil;
    optime5=nil;
    
    [createpopup removeFromSuperview];
    self.tableView.userInteractionEnabled=YES;
    settingButton.enabled=YES;
    backButton.enabled=YES;

    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    [createpopup removeFromSuperview];
    [self showActivityIndicater];
    
//      meImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,10,320,480)];
//   
//    
//    [self.view addSubview:meImage];
//    
//    
//    
//    
//    meImage.animationImages = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"img9.png"],[UIImage imageNamed:@"img8.png"], [UIImage imageNamed:@"img7.png"], [UIImage imageNamed:@"img6.png"],[UIImage imageNamed:@"img5.png"],[UIImage imageNamed:@"img4.png"],[UIImage imageNamed:@"img3.png"],[UIImage imageNamed:@"img11.png"],[UIImage imageNamed:@"img10.png"],nil];
//    [self.view addSubview:meImage];
// 
//
//    
//    if(![meImage isAnimating]) {
//     
//        meImage.animationDuration=1;
//        [meImage startAnimating];
//    }
//    
//    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
//  
    
      
    
    
    
    NSLog(@"%@",access_token);
    NSString *post =[[NSString alloc] initWithFormat:@"random=%d&access_token=%@",1,[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ]];
    
    
    
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/test_create_game.php"];
    
   
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
   NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
  

    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
       
    NSError *error;
    NSURLResponse *response;
    
    
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",data);
    NSError *error1;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error1];
 
    NSString *nouser=[json valueForKey:@"nouser"];
    
    if(nouser)
    {
        
        
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"" message:nouser delegate:@"nil" cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [Alert show];
       
        [self hideActivityIndicater];
   
    }
    else{
    oppenent_name=[json objectForKey:@"opponent_name"];
 
    
    
    opponent_image=[json valueForKey:@"opponent_image"];
    
    
    us_image=[json valueForKey:@"user_image"];
    oppenent_coins=[json valueForKey:@"opponent_coins"];

    user_coins=[json valueForKey:@"user_coins"];
 
    
    
    
    
    NSDictionary *info1 = [json objectForKey:@"first_celeb"];
    audio=[info1 objectForKey:@"audio"];
 
    name1=[info1 objectForKey:@"name"];
 
         original_image1=[info1 objectForKey:@"original_image"];
  
    NSArray *options=[info1 objectForKey:@"options"];
    option1=[options objectAtIndex:0];
   
    option2=[options objectAtIndex:1];
   
    
    option3=[options objectAtIndex:2];
     
    option4=[options objectAtIndex:3];
    
    imageid1=[info1 objectForKey:@"id"];
    
    
    
    NSDictionary *info2 = [json objectForKey:@"second_celeb"];
    audio2=[info2 objectForKey:@"audio"];
    
    name2=[info2 objectForKey:@"name"];
   
    
       original_image2= [info2 objectForKey:@"original_image"];
    NSArray *options2=[info2 objectForKey:@"options"];
    option21=[options2 objectAtIndex:0];
    option22=[options2 objectAtIndex:1];
    option23=[options2 objectAtIndex:2];
    option24=[options2 objectAtIndex:3];
    
    
    
    imageid2=[info2 objectForKey:@"id"];
    
    
    NSDictionary *info3 = [json objectForKey:@"third_celeb"];
    audio3=[info3 objectForKey:@"audio"];
    
    name3=[info3 objectForKey:@"name"];
  
    
 
        original_image3=[info3 objectForKey:@"original_image"];
    NSArray *options3=[info3 objectForKey:@"options"];
    option31=[options3 objectAtIndex:0];
    option32=[options3 objectAtIndex:1];
    option33=[options3 objectAtIndex:2];
    option34=[options3 objectAtIndex:3];
    
    
    
    imageid3=[info3 objectForKey:@"id"];
    
    NSDictionary *info4 = [json objectForKey:@"fourth_celeb"];
    audio4=[info4 objectForKey:@"audio"];
    
    name4=[info4 objectForKey:@"name"];

    
    
          original_image4=[info4 objectForKey:@"original_image"];
    NSArray *options4=[info4 objectForKey:@"options"];
    option41=[options4 objectAtIndex:0];
    option42=[options4 objectAtIndex:1];
    option43=[options4 objectAtIndex:2];
    option44=[options4 objectAtIndex:3];
    
    imageid4=[info4 objectForKey:@"id"];
    
    NSDictionary *info5 = [json objectForKey:@"fifth_celeb"];
    audio5=[info5 objectForKey:@"audio"];
    
    name5=[info5 objectForKey:@"name"];
   
          original_image5=[info5 objectForKey:@"original_image"];
    NSArray *options5=[info5 objectForKey:@"options"];
    option51=[options5 objectAtIndex:0];
    option52=[options5 objectAtIndex:1];
    option53=[options5 objectAtIndex:2];
    option54=[options5 objectAtIndex:3];
    
    imageid5=[info5 objectForKey:@"id"];
    gid=[json objectForKey:@"game_id"];
        NSString *fbid=[json valueForKey:@"opponent_fbid"];
        NSLog(@"fbid=%@",fbid);
        [[NSUserDefaults standardUserDefaults]setValue:fbid forKey:@"opponent_fbid"];
    [[NSUserDefaults standardUserDefaults]setBool:TRUE forKey:@"Facebook_post"];
    
    
    if(original_image1)
    {
          
        
    [self SaveData];
        
         
        [self performSelector:@selector(callSegue) withObject:nil afterDelay:4.0];
         
    }
    else 
    {
        [self hideActivityIndicater];
    }
       // [meImage stopAnimating];
//[self hideActivityIndicater];
        
     
        
    }
    
  
    
}

-(void)callSegue
{
    [self hideActivityIndicater];
    [self performSegueWithIdentifier:@"Game1" sender:nil];
}


- (void)newGameClicked
{
    [self.view addSubview:myView];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
    [audioPlayer play];
    }
   // UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Create Game" message:@"Choose an option" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:/*@"via Facebook",*/@"Random",@"via Email",@"via Username",@"via Facebook", nil ];
    //[alertView show];
   // [alertView release];
    
    UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,285,210)];
    imgview.image=[UIImage imageNamed:@"create-gamel.png"];
    [createpopup removeFromSuperview];
    createpopup=[[UIView alloc] initWithFrame:CGRectMake(20,90,285,210)];
   // [createpopup setBackgroundColor:[UIColor redColor]];
    [createpopup addSubview:imgview];
  
    UIButton *random= [UIButton buttonWithType:UIButtonTypeCustom] ;
    random.frame = CGRectMake(12,162,260,35);
    [random setBackgroundImage:[UIImage imageNamed:@"randoml.png"]  forState:UIControlStateNormal];
   [random setBackgroundImage:[UIImage imageNamed:@"randomonclick.png"]  forState:UIControlStateHighlighted];
    [random addTarget:self
               action:@selector(random1)
    forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    UIImageView *randomimgview=[[UIImageView alloc] initWithFrame:CGRectMake(90,9,80,12)];
    randomimgview.image=[UIImage imageNamed:@"random.png"];
   // [random addSubview:randomimgview];
    

    [createpopup addSubview:random];
    
    
    
    UIButton *email= [UIButton buttonWithType:UIButtonTypeCustom] ;
    email.frame = CGRectMake(12,82,260,35);
    [email setBackgroundImage:[UIImage imageNamed:@"emaill.png"]  forState:UIControlStateNormal];
    [email setBackgroundImage:[UIImage imageNamed:@"emailonclick.png"]  forState:UIControlStateHighlighted];
    [email addTarget:self
                 action:@selector(emailclicked)
       forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    UIImageView *emailimgview=[[UIImageView alloc] initWithFrame:CGRectMake(90,9,70,12)];
    emailimgview.image=[UIImage imageNamed:@"email.png"];
  //  [email addSubview:emailimgview];
    

    [createpopup addSubview:email];
    
    
    
    UIButton *username= [UIButton buttonWithType:UIButtonTypeCustom] ;
    username.frame = CGRectMake(12,122,260,35);
    [username setBackgroundImage:[UIImage imageNamed:@"usernamel.png"]  forState:UIControlStateNormal];
    [username setBackgroundImage:[UIImage imageNamed:@"usernameonclick.png"]  forState:UIControlStateHighlighted];
    [username addTarget:self
               action:@selector(usernameclicked)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    UIImageView *userimgview=[[UIImageView alloc] initWithFrame:CGRectMake(90,9,80,12)];
    userimgview.image=[UIImage imageNamed:@"username.png"];
   // [username addSubview:userimgview];
    
    [createpopup addSubview:username];
    
    
    
    
    UIButton *facebk= [UIButton buttonWithType:UIButtonTypeCustom] ;
    facebk.frame = CGRectMake(12,45,260,35);
    [facebk setImage:[UIImage imageNamed:@"facebook_last_p@2x.png"]  forState:UIControlStateNormal];
     [facebk setImage:[UIImage imageNamed:@"fbonclickl.png"]  forState:UIControlStateHighlighted];
    
    [facebk addTarget:self
               action:@selector(facebookclicked)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    UIImageView *fbimgview=[[UIImageView alloc] initWithFrame:CGRectMake(90,9,80,12)];
    fbimgview.image=[UIImage imageNamed:@"fb-1.png"];
    [facebk addSubview:fbimgview];
    
    
    [createpopup addSubview:facebk];
    
    UIButton *cancel= [UIButton buttonWithType:UIButtonTypeCustom] ;
    cancel.frame = CGRectMake(245,12,22,22);
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1@2x.png"]  forState:UIControlStateNormal];
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1_active@2x.png"]  forState:UIControlStateHighlighted];
    [createpopup addSubview:cancel];
    
    
    [self.view addSubview:createpopup];
    self.tableView.userInteractionEnabled=NO;
    settingButton.enabled=NO;
    backButton.enabled=NO;
   [cancel addTarget:self
            action:@selector(cancelclicked)
   forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    
    [self attachPopUpAnimationToView:createpopup];

    
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



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]; 
    }
    
    // Configure the cell...
   
    
    return cell;
}




-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(names.count>0) return 300+names.count*70;
    else  return 300;
    
}


-(void)receivedPost1Data :(NSData *)data
{
    NSError *error1;
    if (data)
    {
        NSLog(@"\ndata: %@ \nstring: %@", data, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
        
        NSLog(@"%@",data);
       
        days_left=[json objectForKey:@"days_left"];
        hours_left=[json objectForKey:@"hours_left"];
        minutes_left= [json objectForKey:@"minuts_left"];
        seconds_left=[json objectForKey:@"seconds_left"];
        if(!days_left)
            days_left=@"00";
        if(!hours_left)
            hours_left=@"00";
        if(!minutes_left)
            minutes_left=@"00";
        if(!seconds_left) 
            seconds_left=@"00";  
             int i;
        
        
        arr=[[NSMutableArray alloc]init];
        arr1=[[NSMutableArray alloc]init];
        names=[[NSMutableArray alloc]init];
        images=[[NSMutableArray alloc]init];
        ocoins=[[NSMutableArray alloc]init];
        ucoins=[[NSMutableArray alloc]init];
        gameidarray=[[NSMutableArray alloc]init];
        ucoinarray=[[NSMutableArray alloc]init];
        coinarray=[[NSMutableArray alloc]init];
        user_accept_status_array=[[NSMutableArray alloc]init];
        user_score_arrray=[[NSMutableArray alloc]init];
        opponent_score_array=[[NSMutableArray alloc]init];
        game_nudge_status_array=[[NSMutableArray alloc]init];
        NSString *j=[json objectForKey:@"no of games"];
        int v=[j intValue];
        for (i=1; i<=v;i++) {
            NSLog(@"game %d", i);
            NSDictionary *games1=[json valueForKey:[NSString stringWithFormat: @"game%d",i]];
            
            NSString *game_nudge_status=[games1 valueForKey:@"game_nudge_status"];
            NSString  *userstatus=[games1 valueForKey:@"user_status"];
            NSString *opponent_name=[games1 valueForKey:@"opponent_name"];
            opponent_image=[games1 valueForKey:@"opponent_image"];
            ocoin=[games1 valueForKey:@"opponent_score"];
            ucoin=[games1 valueForKey:@"user_score"];
            gid=[games1 objectForKey:@"game_id"];
            NSString  *user_accept_status=[games1 objectForKey:@"user_accept_status"];
                       
            NSLog(@"game id=%@",gid);
           
            [arr addObject:userstatus];
            [names addObject:opponent_name];
            [images addObject:opponent_image];
            [ocoins addObject:ocoin];
            [ucoins addObject:ucoin];
            [user_score_arrray addObject:ucoin];
            [gameidarray addObject:gid];
            [opponent_score_array addObject:ocoin];
            [user_accept_status_array addObject:user_accept_status];
            [game_nudge_status_array addObject:game_nudge_status];
            
                 }}
    
    
    
    else
    {
        NSString *output = [error1 description];
        NSLog(@"\n\n Error to get json=%@",output);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Could not connect to the server, please check your internet connection !" delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show]; 
    }  
 
}


-(void)POST1{
    
    
    arr=nil;;
    arr1=nil;
    names=nil;
    images=nil;
    gameidarray=nil;
    ucoinarray=nil;
    coinarray=nil;
    user_accept_status_array=nil;
    user_score_arrray=nil;
    opponent_score_array=nil;
    game_nudge_status_array=nil;

    
    NSString *post =[NSString stringWithFormat:@"access_token=%@&device_token=%@", [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]objectForKey:@"decice_token"]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/login.php"];
    
    
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
 NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
    if (data)
    {
        NSLog(@"\ndata: %@ \nstring: %@", data, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
        NSDictionary *personalData=[json objectForKey:@"personal_data"];
        
        NSLog(@"%@",personalData);
        NSString *coins=[personalData objectForKey:@"coins"];
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        [defaults1 setObject:coins forKey:@"coins"];
       
        userName=[personalData valueForKey:@"user_name"];
      
       days_left=[personalData objectForKey:@"days_left"];
        hours_left=[personalData objectForKey:@"hours_left"];
        minutes_left=[personalData objectForKey:@"minuts_left"];
        seconds_left=[personalData objectForKey:@"seconds_left"];
        NSLog(@"days=%@",days_left);
        if(!days_left)
            days_left=@"00";
        if(!hours_left)
            hours_left=@"00";
        if(!minutes_left)
            minutes_left=@"00";
        if(!seconds_left) 
            seconds_left=@"00";   
        //int i;
        arr=[[NSMutableArray alloc]init];
        arr1=[[NSMutableArray alloc]init];
        names=[[NSMutableArray alloc]init];
        images=[[NSMutableArray alloc]init];
        ocoins=[[NSMutableArray alloc]init];
        ucoins=[[NSMutableArray alloc]init];
        gameidarray=[[NSMutableArray alloc]init];
        ucoinarray=[[NSMutableArray alloc]init];
        coinarray=[[NSMutableArray alloc]init];
        user_accept_status_array=[[NSMutableArray alloc]init];
        user_score_arrray=[[NSMutableArray alloc]init];
        opponent_score_array=[[NSMutableArray alloc]init];
        game_nudge_status_array=[[NSMutableArray alloc]init];
        NSDictionary *games1;
//        NSString *j=[json objectForKey:@"no of games"];
//        int v=[j intValue];
//        for (i=1; i<=v;i++) {
//            NSLog(@"game %d", i);
////            if(i<10)
//                games1=[json valueForKey:[NSString stringWithFormat: @"game0%d",i]];
//            else
//                games1=[json valueForKey:[NSString stringWithFormat: @"game%d",i]];
        NSString *status=[json objectForKey:@"log"];
        if(!status.intValue==0)
        {
        games1=[json objectForKey:@"maindata"];
        NSLog(@"games1=%@",games1);
        
        game_nudge_status_array=[games1 valueForKey:@"game_nudge_status"];
            arr=[games1 valueForKey:@"user_status"];
            names=[games1 valueForKey:@"opponent_name"];
        images=[games1 valueForKey:@"opponent_image"];
            ocoins=[games1 valueForKey:@"opponent_score"];
            ucoins=[games1 valueForKey:@"user_score"];
        NSLog(@"ucoins=%@",ucoins);
        NSLog(@"gameid=%@",[games1 valueForKey:@"game_id"]);
            gameidarray=[games1 valueForKey:@"game_id"];
        NSLog(@"gameidArray=%@",gameidarray);
          user_accept_status_array=[games1 valueForKey:@"user_accept_status"];
            opponent_score_array=[games1 valueForKey:@"opponent_score"];
        user_score_arrray=[games1 valueForKey:@"user_score"];
           //  gid=[games1 objectForKey:@"game_id"];
            
             NSLog(@"arr=%@",arr);
        }    
}
    
      
  
    
    else
    { 
        NSString *output = [error1 description];
        NSLog(@"\n\n Error to get json=%@",output);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Could not connect to the server, please check your internet connection !" delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show]; 
 
  }
    
    
    
}


-(void) reloadTableViewData
{
    self.view.userInteractionEnabled=NO;
   // NSLog(@"%d",[[NSUserDefaults standardUserDefaults]boolForKey:@"next"]);
    //if([[NSUserDefaults standardUserDefaults]boolForKey:@"next"])
    //{
        
        
        
        [self reloadData1];
      //  NSLog(@"before next no");
        
        //[[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"next"] ;
        //[[NSUserDefaults standardUserDefaults] synchronize];
       // NSLog(@"after next no");
       
        
    //}
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"ratecount"]%3==0 && [[NSUserDefaults standardUserDefaults] integerForKey:@"ratecountyes"]!=1)
    {
        if(Alert)
        {    
            [self RatePopUp];
        }
        
        [[NSUserDefaults standardUserDefaults] setInteger:2  forKey:@"rate"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSLog(@"rate=%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"rate"]);
        
    }

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Minutes=%@",minutes_left);
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableViewData) name:@"ReloadTable" object:nil];
    myView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    myView.backgroundColor=[UIColor blackColor];
    myView.alpha= 0.7;
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"rate"]==1)
    {
       // [self RatePopUp];
        [[NSUserDefaults standardUserDefaults] setInteger:2  forKey:@"rate"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSLog(@"rate=%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"rate"]);
        
    }
    
     [FacebookManager facebookConnect].Delegate=self;  
    
  //  [tournament invalidate];
   
  //  NSLog(@"tim=%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"tim"]);
 //   if([[NSUserDefaults standardUserDefaults] integerForKey:@"tim"]==1)
 //   {
    
    
       
    
  //  }
    lineImageArray=[[NSMutableArray alloc]init];
    
  //  [self SaveData];

    [self.navigationController setNavigationBarHidden:YES];
    tableView.delegate=self;
    tableView.dataSource=self;
    UIImage *BI=[UIImage imageNamed:@"background@2x.png"];
    UIImageView *BIV=[[UIImageView alloc]initWithImage:BI];
    self.tableView.backgroundView=BIV;     
    
    if(names.count>0){
        height= 100+names.count*60;
    }
    else {
        height =100;
    } 
    
    

    NSURL *url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Mltimedia_button_click"ofType:@"mp3"]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:url1
                   error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@", 
              [error localizedDescription]);
    } else {
        audioPlayer.delegate = self;
        [audioPlayer prepareToPlay];
    }
   
    name.text = [NSString stringWithFormat:@"Hi  %@ !",value];
    // Do any additional setup after loading the view from its nib.
    secondsLeft = 604800;
     if(![[NSUserDefaults standardUserDefaults] boolForKey:@"next"])
   {
        
       
    [self addPullToRefreshHeader];
       [self reloadData];   
      
    [self drawViewForCell:tableView];
       [self stopLoading];
       //[meImage removeFromSuperview];
   }
    else{
        //[self addPullToRefreshHeader];
        //[self drawViewForCell:tableView];
       // [self addPullToRefreshHeader];
//[self drawViewForCell:tableView];
        //[self stopLoading];

    //  [self drawViewForCell:tableView];
        //[SVProgressHUD showWithStatus:@"Loading..." maskType:SVProgressHUDMaskTypeGradient];
       // [self showActivityIndicater];
        
    }
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    backButton = nil;
    settingButton = nil;
    registered = nil;
    notRegistered=nil;
    tnsView=nil;
    gamesScroll=nil;
    meImage=nil;
    usenamepopupview=nil;
    unametextfield = nil;
    emailpopupview=nil;
    emailtextfield=nil;
    createpopup=nil;
    ucoinarray=nil;
    coinarray=nil;
    lineImageArray=nil;
    refreshHeaderView=nil;
    refreshLabel=nil;
    refreshArrow=nil;
    refreshSpinner=nil;
    settingView=nil;
    arr=nil;
    arr1=nil;
    names=nil;
    images=nil;
    ocoins=nil;
    ucoins=nil;
    gameidarray=nil;
    user_accept_status_array=nil;
    user_score_arrray=nil;
    opponent_score_array=nil;
    tournament=nil;
    
    
    
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex 
{
    
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Yes"])
    {
        [self CallRateApp];
        [[NSUserDefaults standardUserDefaults] setInteger:1  forKey:@"ratecountyes"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
    else if([title isEqualToString:@"No"])
    {
        Alert=TRUE;
    }
    
         
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([[segue identifier] isEqualToString:@"fb"]) {
        NSLog(@"sender :%@", sender);
        FBFriendsViewController *friends = [segue destinationViewController];
        friends.fbRegFriends = registered;
        friends.fbNotRegFriends = notRegistered;
    }
    
    else if([[segue identifier] isEqualToString:@"shop"])
    {

        }
    else{
 
    
    NewGameUserNameViewController  *vc= (NewGameUserNameViewController *)[segue destinationViewController];
    vc.audio=audio;
    
    
    vc.namecel=name1;
    vc.option1=option1;
    vc.option2=option2;
    vc.option3=option3;
    vc.option4=option4;
    vc.name2=name2;
  
    vc.audio2=audio2;
    vc.option21=option21;
    vc.option22=option22;
    vc.option23=option23;
    vc.option24=option24;
    
    vc.namec=name3;
        
       vc.audioc=audio3;
    vc.option21c=option31;
    vc.option22c=option32;
    vc.option23c=option33;
    vc.option24c=option34;
    
    
    
    vc.name4=name4;
     vc.audio4=audio4;
    vc.option41=option41;
    vc.option42=option42;
    vc.option43=option43;
    vc.option44=option44;
    
    
    vc.name5=name5;
     vc.audio5=audio5;
    vc.option51=option51;
    vc.option52=option52;
    vc.option53=option53;
    vc.option54=option54;
    vc.access_token=access_token;
    vc.opponent_name=oppenent_name;
    vc.opponent_image=opponent_image;
    
    vc.game_id=gid;
        
    vc.opptime1=optime1;
    vc.opptime2=optime2;
    vc.opptime3=optime3;
    vc.opptime4=optime4;
    vc.opptime5=optime5;
        vc.us_image=us_image;
               vc.opponent_coins=oppenent_coins;
      
        vc.user_coins=user_coins;
        vc.imageid1=imageid1;
        vc.imageid2=imageid2;
        vc.imageid3=imageid3;
        vc.imageid4=imageid4;
        vc.imageid5=imageid5;
        vc.oppcount=[NSString stringWithFormat:@"%d", oppcount];
        vc.ans1=opans1;
        vc.ans2=opans2;
        vc.ans3=opans3;
        vc.ans4=opans4;
        vc.ans5=opans5;
        vc.quicktime1=quicktime1;
        vc.quicktime2=quicktime2;
        vc.quicktime3=quicktime3;
        vc.quicktime4=quicktime4;
        vc.quicktime5=quicktime5;
        vc.user_score=user_score;
        vc.opponent_score=opponent_score;
        vc.original_image1=original_image1;
        vc.original_image2=original_image2;
        vc.original_image3=original_image3;
        vc.original_image4=original_image4;
        vc.original_image5=original_image5;
    }
    
}

/*
 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if ([segue.identifier isEqualToString:@"Game"])
 {
 view = [segue destinationViewController];
 } 
 }*/


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (isLoading) return;
    isDragging = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (isLoading) {
        // Update the content inset, good for section headers
        if (scrollView.contentOffset.y > 0)
            self.tableView.contentInset = UIEdgeInsetsZero;
        else if (scrollView.contentOffset.y >= -REFRESH_HEADER_HEIGHT)
            self.tableView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (isDragging && scrollView.contentOffset.y < 0) {
        // Update the arrow direction and label
        [UIView beginAnimations:nil context:NULL];
        if (scrollView.contentOffset.y < -REFRESH_HEADER_HEIGHT) {
            // User is scrolling above the header
            refreshLabel.text = self.textRelease;
            [refreshArrow layer].transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
        } else { // User is scrolling somewhere within the header
            refreshLabel.text = self.textPull;
            [refreshArrow layer].transform = CATransform3DMakeRotation(M_PI * 2, 0, 0, 1);
        }
        [UIView commitAnimations];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (isLoading) return;
    isDragging = NO;
    if (scrollView.contentOffset.y <= -REFRESH_HEADER_HEIGHT) {
        // Released above the header
        [self startLoading];
    }
}


-(void)RatePopUp{
           UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Rank us!" message:@"Please rank us 5 stars on the app store to get 200 in-game coins." delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alert show];
      
    
    NSLog(@"rate timer");
    
    
    
}

-(void)CallRateApp
{
   

    NSLog(@"Reward 200 coins");
    double coins=200;
    //NSLog(@"coin before=%@ new=%f ",[[CoinBombPass share]Coins],extraCoins);
    NSString*  post =[NSString stringWithFormat:@"access_token=%@&plus=%@&coins=%0.0f",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"],@"1",coins];
    
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

     [[UIApplication sharedApplication] 
     openURL:[NSURL URLWithString:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=557864499"]];   
}

- (void)setupStrings{
    textPull = @"Pull down to refresh...";
    textRelease = @"Release to refresh...";
    textLoading =@"Loading Games...";
}

- (void)addPullToRefreshHeader {
    refreshHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0 - REFRESH_HEADER_HEIGHT, 320, REFRESH_HEADER_HEIGHT)];
    refreshHeaderView.backgroundColor = [UIColor clearColor];
    
    refreshLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, REFRESH_HEADER_HEIGHT)];
    refreshLabel.backgroundColor = [UIColor clearColor];
    refreshLabel.font = [UIFont boldSystemFontOfSize:12.0];
    refreshLabel.textAlignment = UITextAlignmentCenter;
    
    refreshArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
    refreshArrow.frame = CGRectMake(floorf((REFRESH_HEADER_HEIGHT - 27) / 2),
                                    (floorf(REFRESH_HEADER_HEIGHT - 44) / 2),
                                    27, 44);
    
    refreshSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    refreshSpinner.frame = CGRectMake(floorf(floorf(REFRESH_HEADER_HEIGHT - 20) / 2), floorf((REFRESH_HEADER_HEIGHT - 20) / 2), 20, 20);
    refreshSpinner.hidesWhenStopped = YES;
    refreshHeaderView.backgroundColor=[UIColor colorWithRed:(253/255) green:(152/255) blue:(8/255) alpha:1];
    [refreshHeaderView addSubview:refreshLabel];
    [refreshHeaderView addSubview:refreshArrow];
    [refreshHeaderView addSubview:refreshSpinner];
    
    
    refreshHeaderView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"headerBG.png"]];
    refreshSpinner.color=[UIColor whiteColor];
    refreshLabel.textColor=[UIColor whiteColor];
    
    UIView *backHeader=[[UIView alloc] initWithFrame:CGRectMake(0, 0 - (REFRESH_HEADER_HEIGHT+200) , 320, REFRESH_HEADER_HEIGHT+200)];
    backHeader.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"headerBG.png"]];
    [self.tableView addSubview:backHeader];
    [self.tableView addSubview:refreshHeaderView];
    
    NSLog(@"Add pull to refresh method");
    [self refresh];
    [self reloadData1];
}

- (void)startLoading {
     isLoading = YES;
    // Show the header
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.tableView.contentInset = UIEdgeInsetsMake(REFRESH_HEADER_HEIGHT, 0, 0, 0);
    
    refreshArrow.hidden = YES;
    [refreshSpinner startAnimating];
    [UIView commitAnimations];
    
    // Refresh action!
    [self refresh];
    //[self reloadData1];
    refreshLabel.text = self.textLoading;
}

- (void)stopLoading {
    isLoading = NO;

    // Hide the header
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDidStopSelector:@selector(stopLoadingComplete:finished:context:)];
    self.tableView.contentInset = UIEdgeInsetsZero;
    UIEdgeInsets tableContentInset = self.tableView.contentInset;
    tableContentInset.top = 0.0;
    self.tableView.contentInset = tableContentInset;
    [refreshArrow layer].transform = CATransform3DMakeRotation(M_PI * 2, 0, 0, 1);
    [UIView commitAnimations];
    
}

- (void)stopLoadingComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    // Reset the header
    refreshLabel.text = self.textPull;
    refreshArrow.hidden = NO;
    [refreshSpinner stopAnimating];
    // textLoading=nil;
}




- (void)refresh {
    
    // [self stopLoading];
    
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0.00];
}

-(void)reloadData{
    NSLog(@"reload data");
    //[self showActivityIndicater];
    [self POST1];
   // [self startLoading];
    //[self hideActivityIndicater];
    [tableView reloadData];
    NSLog(@"before draw");
    [self drawViewForCell:tableView];
    NSLog(@"after draw");
    [self stopLoading];
}

-(void)reloadData1

{
    NSLog(@"reload data1");
   [self showActivityIndicater];

    
      [self POST1];
 
   [tableView reloadData];
    NSLog(@"before draw");
       [self drawViewForCell:tableView];
    NSLog(@"after draw");
    
    
 [self hideActivityIndicater];
        
    
}
-(void)viewDidAppear:(BOOL)animated
{
       
    tournament=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTournament:) userInfo:nil repeats:YES];
    [[NSUserDefaults standardUserDefaults] setInteger:2  forKey:@"tim"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSLog(@"tim=%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"tim"]);

    
   }

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
  //  [settingButton release];
    //[backButton release];
  //  [tableView release];
    //[super dealloc];
}
-(void) onTournament:(NSTimer *)timer1 
{
if(seconds1==0&&minutes1==0&&hours1==0&&days1==0)
 {
    seconds1=minutes1=hours1=days1=0;
    
     
 }
    
else
{
    NSLog(@"%d",seconds1);
if(seconds1==-1)
    {
         seconds1=59;
        minutes1=minutes1-1;
        if(minutes1==-1)
        {
            minutes1=59;

            NSLog(@"%d",hours1);
            hours1=hours1-1;
            if(hours1==-1)
            {
                hours1=23;
                NSLog(@"%d",days1);
                days1=days1-1;
                if(days1==0)
                {
                    days1=6;
                }
                // days1=days1-1;
                 NSString *d=[NSString stringWithFormat:@"%d",days1 ];
                daysfrstLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;
                ;
                [daysscndLabel setBackgroundColor:[UIColor clearColor]];
                if(d.length>1)
                {
                    daysscndLabel.text=[NSString stringWithFormat:@"%@",[d substringWithRange:[d rangeOfComposedCharacterSequenceAtIndex:1]]];
                }
                else
                {
                    daysscndLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;
                    daysfrstLabel.text=@"0";
                }
            }
          //  hours1=hours1-1;

             NSString *d=[NSString stringWithFormat:@"%d",hours1 ];
            hoursfrstLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;
            ;
            [hoursscndLabel setBackgroundColor:[UIColor clearColor]];
            if(d.length>1)
            {
                hoursscndLabel.text=[NSString stringWithFormat:@"%@",[d substringWithRange:[d rangeOfComposedCharacterSequenceAtIndex:1]]];
            }
           else
             {
            hoursfrstLabel.text=@"0";
            hoursscndLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;

            }
            
        }
    // minutes1=minutes1-1;
         NSString *d=[NSString stringWithFormat:@"%d",minutes1 ];
        minutesfrstLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;
        ;
        
        if(d.length>1)
        {
            minutesscndLabel.text=[NSString stringWithFormat:@"%@",[d substringWithRange:[d rangeOfComposedCharacterSequenceAtIndex:1]]];
        }
        else
        {
            minutesfrstLabel.text=@"0";
            minutesscndLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;

        }
        
      
  
   }
  
    
      NSString *d=[NSString stringWithFormat:@"%d",seconds1 ];
         secondfrstLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;
        ;
         [secondscndLabel setBackgroundColor:[UIColor clearColor]];
        if(d.length>1)
        {
            secondscndLabel.text=[NSString stringWithFormat:@"%@",[d substringWithRange:[d rangeOfComposedCharacterSequenceAtIndex:1]]];
        }
        else{
            secondfrstLabel.text=@"0";
            secondscndLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;
           

        }
        
      
 //   secondscndLabel.text=[NSString stringWithFormat:@"%@",[d substringToIndex:1]] ;

    seconds1=seconds1-1;
}  // sleep(1);
  // [self onTournament:nil];
//[self performSelector:@selector(onTournament:) withObject:self afterDelay:1];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    [self viewDidUnload];
    
    // Release any cached data, images, etc that aren't in use.
}


- (IBAction)backbtn:(id)sender {
 /*
    [[FacebookManager facebookConnect]FB_LogOut];
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"access_token"];
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"fbid"];
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"fbuname"];
    [[NSUserDefaults standardUserDefaults] synchronize];
  
    [self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:0] animated:YES];
  
   // LoginViewController *a=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
  //  a.userName =userName;
   // [self.navigationController pushViewController:a animated:YES];
*/
    //[self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:0] animated:YES];
    [timer invalidate];
    timer=nil;
    [tournament invalidate];
    tournament=nil;
    
    
     [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)settings:(id)sender {
    
    //self.tableView.userInteractionEnabled = NO;
   // self.tableView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:myView];
   
  //  self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }

     terms_and_services.userInteractionEnabled=NO;
    [settingView removeFromSuperview];
    UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,310,227)];
    imgview.image=[UIImage imageNamed:@"settings.png"];
    UIImageView *line1=[[UIImageView alloc] initWithFrame:CGRectMake(0,65,310,2)];
  //  line1.image=[UIImage imageNamed:@"line@2x.png"];
    UIImageView *line2=[[UIImageView alloc] initWithFrame:CGRectMake(0,105,310,2)];
  //  line2.image=[UIImage imageNamed:@"line@2x.png"];
    UIImageView *line3=[[UIImageView alloc] initWithFrame:CGRectMake(0,145,310,2)];
  //  line3.image=[UIImage imageNamed:@"line@2x.png"];
    UIImageView *line4=[[UIImageView alloc] initWithFrame:CGRectMake(0,185,310,2)];
  //  line4.image=[UIImage imageNamed:@"line@2x.png"];
    
    settingView=[[UIView alloc] initWithFrame:CGRectMake(5,53,310,227)];
    // [settingView setBackgroundColor:[UIColor whiteColor]];
    [settingView addSubview:imgview];
    [settingView addSubview:line1];
    [settingView addSubview:line2];
    [settingView addSubview:line3];
    [settingView addSubview:line4];
    UILabel *ocoinlabel = [[UILabel alloc]initWithFrame:CGRectMake(120,0,70,36)];
    [ocoinlabel setNumberOfLines:2];
    // [ocoinlabel setTextAlignment:UITextAlignmentCenter];
    
    [ocoinlabel setBackgroundColor:[UIColor clearColor]];
    
   // ocoinlabel.text=@"Settings";
    //ocoinlabel.font = [UIFont fontWithName:@"Helvetica Neue" size:22];
    ocoinlabel.textColor=[UIColor whiteColor];
    
    [ocoinlabel setFont:[UIFont boldSystemFontOfSize:17.5]];
    [settingView addSubview:ocoinlabel];
    
    UIButton *cancel= [UIButton buttonWithType:UIButtonTypeCustom] ;
    cancel.frame = CGRectMake(282,4,23,23);
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1@2x.png"]  forState:UIControlStateNormal];
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1_active@2x.png"]  forState:UIControlStateHighlighted];
    [settingView addSubview:cancel];
    [cancel addTarget:self
               action:@selector(cancelclicked1)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    UIButton  *mainmenu = [[UIButton alloc]init];
    mainmenu = [UIButton buttonWithType:UIButtonTypeCustom];
    mainmenu.frame = CGRectMake(0,28,310,42);
    [mainmenu setImage:[UIImage imageNamed:@"mian-menu-1.png"] forState:UIControlStateNormal];
    [mainmenu setImage:[UIImage imageNamed:@"mian-menuonclick.png"] forState:UIControlStateHighlighted];
   // [mainmenu setTitle:@"Main Menu" forState:UIControlStateNormal];
   // [mainmenu setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
   
    [mainmenu addTarget:self action:@selector(MainMenu_Alert:) forControlEvents:UIControlEventTouchUpInside];
   
    [mainmenu.titleLabel setTextAlignment:UITextAlignmentCenter];
    [mainmenu.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    
    [settingView addSubview:mainmenu];
    
    
    
    
    
    UIButton  *sounds = [[UIButton alloc]init];
    sounds = [UIButton buttonWithType:UIButtonTypeCustom];
   // [sounds setTitle:@"Sounds" forState:UIControlStateNormal];
    //[sounds setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
    sounds.frame = CGRectMake(0,70,310,37);
    [sounds.titleLabel setTextAlignment:UITextAlignmentCenter];
    [sounds.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
   // sounds.enabled=NO;
  //  sounds.userInteractionEnabled=NO;
    
  [sounds setImage:[UIImage imageNamed:@"sounds-1.png"] forState:UIControlStateNormal];
    [sounds setImage:[UIImage imageNamed:@"sounds-1onclick.png"] forState:UIControlStateHighlighted];
    //[settingView addSubview:sounds];
    
    
    sliderButton= [[UIButton alloc]init];
    
    sliderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        
        sliderButton.frame = CGRectMake(206,2,94,33);
        // [sliderButton setBackgroundColor:[UIColor redColor]];
        [sliderButton setBackgroundImage:[UIImage imageNamed:@"onbtn.png"] forState:UIControlStateNormal];
    }
    
    else
    {
        
        sliderButton.frame = CGRectMake(206,2,94,33);
        [sliderButton setImage:[UIImage imageNamed:@"offbtn.png"] forState:UIControlStateNormal];
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
    onoffButton.frame = CGRectMake(171,0,40,33);
    
  //  [sounds addSubview:onoffButton];
    
    
    
    
    
      [settingView addSubview:sounds];
    
    
    
    
    UIButton  *account = [[UIButton alloc]init];
    account = [UIButton buttonWithType:UIButtonTypeCustom];
    [account setTitle:@"Account" forState:UIControlStateNormal];
    [account setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
    account.frame = CGRectMake(0,108,310,37);
    [account.titleLabel setTextAlignment:UITextAlignmentCenter];
    [account.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [account addTarget:self action:@selector(Account_Alert) forControlEvents:UIControlEventTouchUpInside];
       [account setImage:[UIImage imageNamed:@"account-2.png"] forState:UIControlStateNormal];
    [account setImage:[UIImage imageNamed:@"account-2onclick.png"] forState:UIControlStateHighlighted];
    
    [settingView addSubview:account];
    
    
    UIButton  *aboutus = [[UIButton alloc]init];
    aboutus = [UIButton buttonWithType:UIButtonTypeCustom];
    [aboutus setTitle:@"About" forState:UIControlStateNormal];
    [aboutus setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
    aboutus.frame = CGRectMake(0,146,310,37);
    [aboutus.titleLabel setTextAlignment:UITextAlignmentCenter];
    [aboutus.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [aboutus addTarget:self action:@selector(About_Alert) forControlEvents:UIControlEventTouchUpInside];
    [aboutus setImage:[UIImage imageNamed:@"about-1.png"] forState:UIControlStateNormal];
    [aboutus setImage:[UIImage imageNamed:@"about-1onclick.png"] forState:UIControlStateHighlighted];
    [settingView addSubview:aboutus];
    
    
    UIButton  *feedback = [[UIButton alloc]init];
    feedback = [UIButton buttonWithType:UIButtonTypeCustom];
  //  [feedback setTitle:@"Feedback" forState:UIControlStateNormal];
  //  [feedback setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    // button6.titleLabel.text=@"Sounds";
    feedback.frame = CGRectMake(0,184,310,42);
    [feedback.titleLabel setTextAlignment:UITextAlignmentCenter];
    [feedback.titleLabel setTextAlignment:UITextAlignmentCenter];
    [feedback.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [feedback addTarget:self action:@selector(FeedBack_Alert:) forControlEvents:UIControlEventTouchUpInside];
    [feedback setImage:[UIImage imageNamed:@"feedback-1.png"] forState:UIControlStateNormal];
    [feedback setImage:[UIImage imageNamed:@"feedback-1onclick.png"] forState:UIControlStateHighlighted];
    [settingView addSubview:feedback];
    
    
    
    
    
    
       [self.view addSubview:settingView];
    
    [self attachPopUpAnimationToView:settingView];
    
  
    
    
}
-(void)cancelclicked1
{
    [myView removeFromSuperview];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    [settingView removeFromSuperview];
    terms_and_services.userInteractionEnabled=YES;
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
    [myView removeFromSuperview];
    [settingView removeFromSuperview];
     terms_and_services.userInteractionEnabled=YES;
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
   
 
    
}
-(void)FeedBack_Alert:(UIButton *)Sender{
    //[myView removeFromSuperview];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    //if([DatabaseHandler PlaySound]) [BS_player_blue play];
    //[settingalert dismissWithClickedButtonIndex:0 animated:NO];
    [self Email:nil];
    terms_and_services.userInteractionEnabled=YES;

}

   


- (void)Email:(id)sender {
    if ([MFMailComposeViewController canSendMail])
        
    {
        
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"Feedback on GTC"];
        NSArray *toRecipients = [NSArray arrayWithObjects:@"gtcserver@gmail.com",nil];
        [mailer setToRecipients:toRecipients];
        //  UIImage *myImage = [UIImage imageNamed:@"mobiletuts-logo.png"];
        // NSData *imageData = UIImagePNGRepresentation(myImage);
        // [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"mobiletutsImage"];
        
        NSString *emailBody = nil;
        [mailer setMessageBody:emailBody isHTML:NO];
        [self presentModalViewController:mailer animated:YES];
    }
    
    else
        
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"message:@"Your device doesn't support the composer sheet" delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
        
        [alert show];
        
    }
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"mail cancelled");
            break;
        case MFMailComposeResultSent:
            NSLog(@"mail sent");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"mail saved");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"error,mail not sent");
            break;
            
        default:NSLog(@"mail not sent");
            break;
    }
    
    [self dismissModalViewControllerAnimated:YES];
    
}


-(void)sliderClicked{
    
    
   // if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
   // {
        [audioPlayer play];
   // }
    
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"]){
        
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"sound"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        [sliderButton setImage:[UIImage imageNamed:@"offbtn.png"] forState:UIControlStateNormal];
        
        //  [self slideView:sliderButton withDuration:0.2 toX:90 andY:1];
        
        
        
    }
    
    else{
        
        
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"sound"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        [sliderButton setImage:[UIImage imageNamed:@"onbtn.png"] forState:UIControlStateNormal];
        
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
    [myView removeFromSuperview];
    [settingView removeFromSuperview];
    AboutSettingsViewController *a=[[AboutSettingsViewController alloc]initWithNibName:@"AboutSettingsViewController" bundle:nil];
    // a.userName =userName;
     terms_and_services.userInteractionEnabled=YES;
    [self.navigationController pushViewController:a animated:YES];
}

-(void)Account_Alert
{
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    [myView removeFromSuperview];
    [settingView removeFromSuperview];
    AccountSettingsViewController *a=[[AccountSettingsViewController alloc]initWithNibName:@"AccountSettingsViewController" bundle:nil];
    a.user=userName;
     terms_and_services.userInteractionEnabled=YES;
    [self.navigationController pushViewController:a animated:YES];
}

-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        // rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        // rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}


-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    [timer invalidate];
    [tournament invalidate];
    tournament=nil;
    
}


@end
