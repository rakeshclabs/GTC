//
//  NewGameUserNameViewController.m
//  GC
//
//  Created by fgh gf on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NewGameUserNameViewController.h"
#import "AnswerViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ASIFormDataRequest.h"
#import "SVProgressHUD.h"

#import "UIImage+StackBlur.h"
#import "GPUImageFastBlurFilter.h"
#import "GPUImagePicture.h"
@implementation NewGameUserNameViewController
@synthesize oppcoinslabel;
UIImageView *comment ;
@synthesize usercoinslabel;
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
@synthesize celebimagebox;
@synthesize timebackground;
@synthesize progimg1;
@synthesize name = _name;
@synthesize me = _me;

UIImageView *comment;
@synthesize imageView;
@synthesize button1;
@synthesize view1;
@synthesize view2;
@synthesize view3;

@synthesize time1=_time1;
@synthesize time2=_time2;
@synthesize time3=_time3;
@synthesize time4=_time4;
@synthesize time5=_time5;
@synthesize progbtn1;
@synthesize progbtn2;
@synthesize progbtn3;
@synthesize progbtn4;
@synthesize progbtn5;

@synthesize prog1=_prog1;
@synthesize prog2 = _prog2;
@synthesize prog3=_prog3;
@synthesize prog4=_prog4;
@synthesize prog5=_prog5;
NSString *str1;
NSString *str2;
NSString *str3;
NSString *str4;
NSString *str5;
float actual;
@synthesize usernameimageviewleft=_usernameimageviewleft;
@synthesize usernameimageviewright=_usernameimageviewright;
@synthesize pixelated_image,namecel,audio,option1,option4,option2,option3,pixelated_image2,name2,option21,option23,option24,option22,audio2,option21c,option22c,option23c,option24c,namec,pixelated_imagec,audioc,option41,option42,option43,option44,pixelated_image4,audio4,name4,option51,option52,option53,option54,audio5,pixelated_image5,name5,access_token,opponent_name,opponent_image,game_id,opptime1,opptime2,opptime3,opptime4,opptime5,title,us_image,opponent_coins,user_coins,imageid1,imageid5,imageid2,imageid3,imageid4,oppcount,ans1,ans2,ans3,ans4,ans5,original_image1,original_image2,original_image3,original_image4,original_image5,quicktime1,quicktime2,quicktime3,quicktime4,quicktime5,opponent_score,user_score;
UIView *hintsView;

MPMoviePlayerController *playr;
NSString *dirPath1;
NSString *dirPath2;
NSString *dirPath4;
NSString *dirPath5;
NSString *time1;
NSString *time2;
NSString *time3;
NSString *time4;
NSString *time5;
UIImageView *meImageView;
UIImageView *oppImageView;
UIImageView *versus;
UILabel *mycoin;
UILabel *opcoin;
AVAudioPlayer* audioPlayercountdown;
AVAudioPlayer* theAudio;
AVAudioPlayer* audioPlayer;
AVAudioPlayer* audioPlayerCorrect;
AVAudioPlayer* audioPlayerWrong;
int count1=0;
UIImageView *star11;
UIImageView *star12;
UIImageView *star13;
UIImageView *star14;
UIImageView *star15;
UIImageView *star16;
UIImageView *star17;
UIImageView *star18;
UIImageView *star19;
UIImageView *star110;
int countd=0;
UIImageView *image123;

NSString *opptime1;
NSString *opptime2;
NSString *opptime3;
NSString *opptime4;
NSString *opptime5;
NSMutableArray *AllOptions;
NSMutableArray *Temp;
int questionnumber;
int starcount1=0;
int starcount2=0;
int starcount3=0;
int starcount4=0;
int starcount5=0;
UIImageView *meImage1;
UIImageView *meImage;
double coins;
UIImage *currentFilteredVideoFrame11 ;
UIImage *currentFilteredVideoFrame12;
-(void)showActivityIndicater
{
meImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,10,320,480)];
    // meImage.image=[UIImage imageNamed:@"splashscreen_v2@2x.png"];
    
    //  NSData *meData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"splashscreen_v2@2x.png"]];
    
    // [meImage setImage:[UIImage imageWithData:meData]];
    
    
    [self.view addSubview:meImage];
    
    
    
    
    meImage.animationImages = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"img9.png"],[UIImage imageNamed:@"img8.png"], [UIImage imageNamed:@"img7.png"], [UIImage imageNamed:@"img6.png"],[UIImage imageNamed:@"img5.png"],[UIImage imageNamed:@"img4.png"],[UIImage imageNamed:@"img3.png"],[UIImage imageNamed:@"img11.png"],[UIImage imageNamed:@"img10.png"],nil];
    [self.view addSubview:meImage];
    //[self attachPopUpAnimationToView:imageView];
    

    
    if(![meImage1 isAnimating]) {
        NSLog(@"no");
        meImage1.animationDuration=1;
        [meImage1 startAnimating];
    }
    
   // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    
}
-(void)hideActivityIndicater
{
    //[SVProgressHUD dismiss];
    [meImage1 stopAnimating];
}



-(void) onTimer:(NSTimer *)timer1 {
    
    countdown = countdown - 0.01;
    NSLog(@"countdown %f",countdown);
    
    if(countdown>0.0f)
    {
        if(countdown1==1.0)
        {
            float var=_prog1.progress;
            [_prog1 setProgress:var];
            
            
            return;
            
        }
        else{
            
            [_prog1 setProgress: countdown];
            
            
            NSString *str = [NSString stringWithFormat:@"%.1f", countdown];
            
            
            _time1.text=str;
            
            
            
            
            
        }
        
    
        
        
    
    }
    else{
        [timer invalidate];
        timer=nil;
        
    }
}






-(void) onTimer2:(NSTimer *)timer1 {
    
    countdown = countdown - 0.01;
    NSLog(@"countdown %f",countdown);
    
    
    if(countdown>0.0f){
        if(countdown2==1.0)
        {
            float var=_prog2.progress;
            [_prog2 setProgress:var];
            
            
            return;   
        }
        else
        {
            [_prog2 setProgress: countdown];
            
            
            NSString *str7 = [NSString stringWithFormat:@"%.1f", countdown];
            _time2.text=str7;
        }
        //[_prog1 setNeedsDisplay];
    }
     else
     {
         
         
         [timer12 invalidate];
         timer12=nil;
         
     // Whatever you want to do once the time is up.
     
     // One thing you'll probably want to do here is stop the timer
     // from going off anymore.  So, you'd want something like
     
     //   [timer invalidate];
     //  [timer release];
     }
}




-(void) onTimer3:(NSTimer *)timer1 {
    
    countdown = countdown - 0.01;
    NSLog(@"countdown %f",countdown);
    
    if(countdown>0.0f){
        if(countdown3==1.0)
        {
            float var=_prog3.progress;
            [_prog3 setProgress:var];
            
        }
        else
        {
            [_prog3 setProgress: countdown];
            
            
            NSString *str7 = [NSString stringWithFormat:@"%.1f", countdown];
            _time3.text=str7;}
        //[_prog1 setNeedsDisplay];
    }
    else
    {
        [timer13 invalidate];
        timer13=nil;
        
    }
}





-(void) onTimer4:(NSTimer *)timer1 {
    
    countdown = countdown - 0.01;
    NSLog(@"countdown %f",countdown);
    
    if(countdown>0.0f){
        if(countdown4==1.0)
        {
            float var=_prog4.progress;
            [_prog4 setProgress:var];   
        }
        else
        {
            [_prog4 setProgress: countdown];
            
            
            NSString *str7 = [NSString stringWithFormat:@"%.1f", countdown];
            _time4.text=str7;
        }
        //[_prog1 setNeedsDisplay];}
    }
    else
    {
        // Whatever you want to do once the time is up.
        
        // One thing you'll probably want to do here is stop the timer
        // from going off anymore.  So, you'd want something like
        
        //[timer invalidate];
        //[timer release];
        [timer14 invalidate];
        timer14=nil;
        
    }
}

-(void) onTimer5:(NSTimer *)timer1 {
    
    countdown = countdown - 0.01;
    NSLog(@"countdown %f",countdown);
    
    if(countdown>0.0f){
	    [_prog5 setProgress: countdown];
        
        
        NSString *str7 = [NSString stringWithFormat:@"%.1f", countdown];
        _time5.text=str7;
        //[_prog1 setNeedsDisplay];
    }
    else
    {
        // Whatever you want to do once the time is up.
        
        // One thing you'll probably want to do here is stop the timer
        // from going off anymore.  So, you'd want something like
        
        [timer15 invalidate];
        timer15=nil;
       // [timer release];
    }
}









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
   // [self viewDidUnload];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 
 
 {"first_celeb":{"id":"4","name":"Anil Kumble","audio":"http:\/\/theroboticshomepage.com\/GTC\/audio\/107_sound.mp3","pixelated_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/pixelated\/107_image.jpg","original_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/107_image.jpg","options":["Anil Kumble","Bruce Jenner","Anil Kumble","Andre Agassi"]},"second_celeb":{"id":"3","name":"Andre Agassi","audio":"http:\/\/theroboticshomepage.com\/GTC\/audio\/105_sound.mp3","pixelated_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/pixelated\/105_image.jpg","original_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/105_image.jpg","options":["Andre Agassi","Candace Parker","Brian Urlacher","Albert Pujols"]},"third_celeb":{"id":"9","name":"Billie Jean King","audio":"http:\/\/theroboticshomepage.com\/GTC\/audio\/115_sound.mp3","pixelated_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/pixelated\/115_image.jpg","original_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/115_image.jpg","options":["Billie Jean King","Billie Jean King","Barry Bonds","Cal Ripken"]},"fourth_celeb":{"id":"15","name":"Candace Parker","audio":"http:\/\/theroboticshomepage.com\/GTC\/audio\/121_sound.mp3","pixelated_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/pixelated\/121_image.jpg","original_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/121_image.jpg","options":["Candace Parker","Candace Parker","Ben Johnson","Bruce Lee"]},"fifth_celeb":{"id":"14","name":"Calvin Johnson","audio":"http:\/\/theroboticshomepage.com\/GTC\/audio\/120_sound.mp3","pixelated_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/pixelated\/120_image.jpg","original_image":"http:\/\/theroboticshomepage.com\/GTC\/images1\/120_image.jpg","options":["Calvin Johnson","Albert Pujols","Abhinav Bindra","Candace Parker"]},"game_id":1231,"user_id":"218","opponent_image":"http:\/\/theroboticshomepage.com\/singMeSomething\/images\/user.png","user_name":"Rahul","status":"Novice"}
 
 
 */
/*
 
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 NSString *documentsDirectory = [paths objectAtIndex:0];
 NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"savedImage.png"];
 NSData *myData = [[[NSData alloc] initWithContentsOfFile:appFile] autorelease];
 [picker addAttachmentData:myData mimeType:@"image/png" fileName:@"savedImage"];
 
 
 
 */

/*
 
 - (IBAction)savedata:(id)sender {
 
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
 NSString *documentsDirectory = [paths objectAtIndex:0];
 NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"1.jpg"];
 
 // UIImage *image = imageView.image; // imageView is my image from camera
 NSData *imageData = [NSData dataWithContentsOfFile:pixelated_image];
 
 [imageData writeToFile:savedImagePath atomically:NO];   
 
 }
 
 */
 int i=10;
double s=0.0;


-(void) timer2:(NSTimer *)timer1 {
    if(i>0 && s<=10.0)
    {
        if([_time1.text isEqualToString: @"3.0"])
        {
              // imgview.image=currentFilteredVideoFrame;
            imageView.image =currentFilteredVideoFrame11;
            
            
        }
        if([_time1.text isEqualToString: @"6.0"])
        {
            imageView.image =currentFilteredVideoFrame12;
            
            
        }
        if([_time1.text isEqualToString: @"10.0"]||[_time1.text isEqualToString: @"1.0"] ||[_time1.text isEqualToString: @"2.0"] ||[_time1.text isEqualToString: @"3.0"]||[_time1.text isEqualToString: @"4.0"]||[_time1.text isEqualToString: @"5.0"]||[_time1.text isEqualToString: @"6.0"] ||[_time1.text isEqualToString: @"7.0"]||[_time1.text isEqualToString: @"8.0"]||[_time1.text isEqualToString: @"9.0"])
        {
    [progbtn1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn%d.png",i]] forState:UIControlStateNormal];
        i--;
        
        }
    
        _time1.text=[NSString stringWithFormat:@"%.1f",(double)s];
        s=s+0.1;
        }
    else
    {
        [progbtn1 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
        NSString *getImagePath6 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/6.jpg"];
        
        UIImage *img6 = [UIImage imageWithContentsOfFile:getImagePath6];
        imageView.image=img6;
        
        
        
    }
    
    
}

int j=10;
double t=0.0;
-(void) timer22:(NSTimer *)timer1 {
        if(j>0 && t<=10.0)
    {
        if([_time2.text isEqualToString: @"3.0"])
        {
            // imgview.image=currentFilteredVideoFrame;
            imageView.image =currentFilteredVideoFrame11;
            
            
        }
        if([_time2.text isEqualToString: @"6.0"])
        {
            imageView.image =currentFilteredVideoFrame12;
            
            
        }
        
         if([_time2.text isEqualToString: @"10.0"]||[_time2.text isEqualToString: @"1.0"] ||[_time2.text isEqualToString: @"2.0"] ||[_time2.text isEqualToString: @"3.0"]||[_time2.text isEqualToString: @"4.0"]||[_time2.text isEqualToString: @"5.0"]||[_time2.text isEqualToString: @"6.0"] ||[_time2.text isEqualToString: @"7.0"]||[_time2.text isEqualToString: @"8.0"]||[_time2.text isEqualToString: @"9.0"])
         {
        [progbtn2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn%d.png",j]] forState:UIControlStateNormal];
             j--;}

        _time2.text=[NSString stringWithFormat:@"%.1f",(double)t];
        
        t=t+0.1;
        
    }
    else
    {
        [progbtn2 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
        NSString *getImagePath7 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/7.jpg"];
        
        UIImage *img7 = [UIImage imageWithContentsOfFile:getImagePath7];
        imageView.image=img7;
        
        
        
    }
    
    
    
}
int k=10;
double u=0.0;
-(void) timer23:(NSTimer *)timer1 {
    
       if(k>0 && u<=10.0)
    {
        if([_time3.text isEqualToString: @"3.0"])
        {
            // imgview.image=currentFilteredVideoFrame;
            imageView.image =currentFilteredVideoFrame11;
            
            
        }
        if([_time3.text isEqualToString: @"6.0"])
        {
            imageView.image =currentFilteredVideoFrame12;
            
            
        }
         if([_time3.text isEqualToString: @"10.0"]||[_time3.text isEqualToString: @"1.0"] ||[_time3.text isEqualToString: @"2.0"] ||[_time3.text isEqualToString: @"3.0"]||[_time3.text isEqualToString: @"4.0"]||[_time3.text isEqualToString: @"5.0"]||[_time3.text isEqualToString: @"6.0"] ||[_time3.text isEqualToString: @"7.0"]||[_time3.text isEqualToString: @"8.0"]||[_time3.text isEqualToString: @"9.0"])
         {
        [progbtn3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn%d.png",k]] forState:UIControlStateNormal];
        k--;
         }
        _time3.text=[NSString stringWithFormat:@"%.1f",(double)u];
        u=u+0.1;
        
    }
    else
    {
        [progbtn3 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
        NSString *getImagePath8 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/8.jpg"];
        
        UIImage *img8 = [UIImage imageWithContentsOfFile:getImagePath8];
        
        imageView.image=img8;
        
        
        
    }
    
    
    
}
int l=10;
double v=0.0;

-(void) timer24:(NSTimer *)timer1 {
        
    if(l>0 && v<=10.0)
    {
        if([_time4.text isEqualToString: @"3.0"])
        {
            // imgview.image=currentFilteredVideoFrame;
            imageView.image =currentFilteredVideoFrame11;
            
            
        }
        if([_time4.text isEqualToString: @"6.0"])
        {
            imageView.image =currentFilteredVideoFrame12;
            
            
        }
        
         if([_time4.text isEqualToString: @"10.0"]||[_time4.text isEqualToString: @"1.0"] ||[_time4.text isEqualToString: @"2.0"] ||[_time4.text isEqualToString: @"3.0"]||[_time4.text isEqualToString: @"4.0"]||[_time4.text isEqualToString: @"5.0"]||[_time4.text isEqualToString: @"6.0"] ||[_time4.text isEqualToString: @"7.0"]||[_time4.text isEqualToString: @"8.0"]||[_time4.text isEqualToString: @"9.0"])
         {
        
        [progbtn4 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn%d.png",l]] forState:UIControlStateNormal];
        l--;
         }
        _time4.text=[NSString stringWithFormat:@"%.1f",(double)v];
        v=v+0.1;
        
    }
    else
    {
        [progbtn4 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
        NSString *getImagePath9 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.jpg"];
        
        UIImage *img9 = [UIImage imageWithContentsOfFile:getImagePath9];
        imageView.image=img9;
        
        
        
    }
    
    
    
}

int m=10;
double w=0.0;
-(void) timer25:(NSTimer *)timer1 {
    
        if(m>0 && w<=10.0)
    {
        if([_time5.text isEqualToString: @"3.0"])
        {
            // imgview.image=currentFilteredVideoFrame;
            imageView.image =currentFilteredVideoFrame11;
            
            
        }
        if([_time5.text isEqualToString: @"6.0"])
        {
            imageView.image =currentFilteredVideoFrame12;
            
            
        }
         if([_time5.text isEqualToString: @"10.0"]||[_time5.text isEqualToString: @"1.0"] ||[_time5.text isEqualToString: @"2.0"] ||[_time5.text isEqualToString: @"3.0"]||[_time5.text isEqualToString: @"4.0"]||[_time5.text isEqualToString: @"5.0"]||[_time5.text isEqualToString: @"6.0"] ||[_time5.text isEqualToString: @"7.0"]||[_time5.text isEqualToString: @"8.0"]||[_time5.text isEqualToString: @"9.0"])
         {
        [progbtn5 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn%d.png",m]] forState:UIControlStateNormal];
        m--;
         }
        _time5.text=[NSString stringWithFormat:@"%.1f",(double)w];
        w=w+0.1;
        
        
    }
    else
    {
        [progbtn5 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
        NSString *getImagePath10 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.jpg"];
        
        UIImage *img10 = [UIImage imageWithContentsOfFile:getImagePath10];
        imageView.image=img10;
        
        
        
    }
    
    NSLog(@"timer5");
    
}

-(void)button1:(id)sender{
    
}
-(void)goToFifthTrailer:(id)sender
{
    
    [theAudio stop];
    theAudio=nil;
   [hintsView removeFromSuperview]; 
    NSString *getImagePath10 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.jpg"];
    
    UIImage *img10 = [UIImage imageWithContentsOfFile:getImagePath10];
    imageView.image=img10;
    
    
    str5=[sender currentTitle];
    
    [timer25 invalidate];
    timer25=nil;
    [timer15 invalidate];
    timer15=nil;
    
    
    UIButton *button = (UIButton *)[self.view1 viewWithTag:17];
    
    UIButton *buttonn1 = (UIButton *)[self.view1 viewWithTag:18];
    UIButton *button2 = (UIButton *)[self.view1 viewWithTag:19];
    UIButton *button3 = (UIButton *)[self.view1 viewWithTag:20];
    
    button.userInteractionEnabled=NO;
    
    buttonn1.userInteractionEnabled=NO; 
    button2.userInteractionEnabled=NO; 
    button3.userInteractionEnabled=NO; 
    
   
    
   
    
    
       
    
    if([str5 isEqualToString:name5] && ![_time5.text isEqualToString:@"10.0"])
    {
        if(([str1 isEqualToString:namecel]&&![_time1.text isEqualToString:@"10.0"])&&([str2 isEqualToString:name2]&&![_time2.text isEqualToString:@"10.0"]) && ([str3 isEqualToString:namec]&&![_time3.text isEqualToString:@"10.0"]) && ([str4 isEqualToString:name4]&&![_time4.text isEqualToString:@"10.0"]))
        {
            comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"5_green_text.png"];
            [self.view1 addSubview:comment];
            
        }
        else if(([str2 isEqualToString:name2]&&![_time2.text isEqualToString:@"10.0"]) && ([str3 isEqualToString:namec]&&![_time3.text isEqualToString:@"10.0"]) && ([str4 isEqualToString:name4]&&![_time4.text isEqualToString:@"10.0"]))
        {
comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"4_green_text.png"];
            [self.view1 addSubview:comment];
        }
        else if(([str3 isEqualToString:namec]&&![_time3.text isEqualToString:@"10.0"]) && ([str4 isEqualToString:name4]&&![_time4.text isEqualToString:@"10.0"]))
        {
        comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"3_green_text.png"];
            [self.view1 addSubview:comment];
        }
        else if ( [str4 isEqualToString:name4]&&![_time4.text isEqualToString:@"10.0"])
        {
            comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"2_green_text.png"];
            [self.view1 addSubview:comment];
        }
        else{
    comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"1_green_text.png"];
            [self.view1 addSubview:comment];
        }
        if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
        {
            
         [audioPlayerCorrect play];
        }
        coins=coins+(100-([_time5.text doubleValue]*10));
        

        
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        

        
        [sender setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
        [progbtn5 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
        
      
        NSString *coins1=[NSString stringWithFormat:@"%d",(int)coins];
        mycoin.text=coins1;
        
        
        if([oppcoinslabel.text intValue]>=2000)
        {
            star11.image=[UIImage imageNamed:@"star@2x.png"];
        }
        if([oppcoinslabel.text intValue]>=4000)
        {
            star12.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=8000)
        {
            star13.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=16000)
        {
            star14.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if(
           [oppcoinslabel.text intValue]>=32000)
        {
            star15.image=[UIImage imageNamed:@"star@2x.png"];
            
            
        }
        if([mycoin.text intValue]>=2000)
        {
            star16.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=4000)
        {
            star17.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=8000)
        {
            star18.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=16000)
        {
            star19.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=32000)
        {
            star110.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        
        
        
        
        
        
        
        
        
      
    }
    else
    {
        if([str5 isEqualToString:name5])
        {
            if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
            {
                [audioPlayerCorrect play];
            }
            [progbtn5 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        else
        {
            if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
            {
                [audioPlayerWrong play];
            }
            [progbtn5 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        } 
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        

        
        [sender setBackgroundImage:[UIImage imageNamed:@"wrong_name_btn@2x.png"] forState:UIControlStateNormal];
        if([[button3 currentTitle] isEqualToString:name5]){
            
            
            
            [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button3 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
          //  [progbtn5 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[button currentTitle] isEqualToString:name5]){
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
        //    [progbtn5 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[buttonn1 currentTitle] isEqualToString:name5]){
            
            [buttonn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [buttonn1 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
          //  [progbtn5 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[button2 currentTitle] isEqualToString:name5]){
            
            [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button2 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
          //  [progbtn5 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        
        

        
    }
    
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    
    comment.image=nil;
     if(opptime1!=nil && opptime2!=nil && opptime3!=nil && opptime4!=nil && opptime5!=nil)
     {
     
     
     
     [button removeFromSuperview];
     [buttonn1 removeFromSuperview];
     [button2 removeFromSuperview];
     [button3 removeFromSuperview];
     
     UIImageView *separatorline = [[UIImageView alloc]initWithFrame:CGRectMake(65,35,170,70)];
     separatorline.image=[UIImage imageNamed: @"challenge_complete@2x.png"];
     [self.view1 addSubview:separatorline];
     
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    
     
     }
//    if((starcount2>starcount1)||(starcount3>starcount2)||(starcount4>starcount3)||(starcount5>starcount4))
//    {
//        
//    }
    time1=_time1.text;
    time2=_time2.text;
    time3=_time3.text;
    time4=_time4.text;
    time5=_time5.text;
    NSLog(@"%f",coins);
    
   // NSString *coins1=[NSString stringWithFormat:@"%d",(int)coins];
   // mycoin.text=coins1;
    
    NSLog(@"my game: %@",game_id);
  //  [self showActivityIndicater];
    
    NSString *a1;
    NSString *a2;
    NSString *a3;
    NSString *a4;
    NSString *a5;
    
    
    if([ans5 isEqualToString:@"1"])
        count1++;
    
    if([ans4 isEqualToString:@"1"])
        count1++;
        
    
    
    if([ans3 isEqualToString:@"1"])
       count1++;
        
        
    
    if([ans2 isEqualToString:@"1"])
          count1++;
    
    if([ans1 isEqualToString:@"1"])
        count1++;
        if(str5!=name5 || [_time5.text isEqualToString:@"10.0"])
        a5=@"0";
    else
        a5=@"1";
    
    if(str4!=name4 || [_time4.text isEqualToString:@"10.0"])
        a4=@"0";
    else
        a4=@"1";
    
    
    if(str3!=namec || [_time3.text isEqualToString:@"10.0"])
        a3=@"0";
    else
        a3=@"1";
    
    if(str2!=name2 || [_time2.text isEqualToString:@"10.0"] )
        a2=@"0";
    else
        a2=@"1";
    
    if(str1!=namecel || [_time1.text isEqualToString:@"10.0"])
        a1=@"0";
    else
        a1=@"1";


    NSLog(@"ans1=%@",a1);
    NSLog(@"ans2=%@",a2);
    NSLog(@"ans3=%@",a3);
    NSLog(@"ans4=%@",a4);
    NSLog(@"ans5=%@",a5);
    
    NSLog(@"Post Coins=%f",coins);
    double newCoins=coins-coins2.intValue;
    [[NSUserDefaults standardUserDefaults]setInteger:newCoins forKey:@"newCoins"];
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&q1=%@&q2=%@&q3=%@&q4=%@&q5=%@&a1=%@&a2=%@&a3=%@&a4=%@&a5=%@&coins=%d&game=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"],_time1.text,_time2.text,_time3.text,_time4.text,_time5.text,a1,a2,a3,a4,a5,(int)newCoins,game_id];
    NSLog(@"Complete game id=%@",game_id);
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/test_complete.php"];
    
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
    
//    [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    [[NSUserDefaults standardUserDefaults] setInteger:[[NSUserDefaults standardUserDefaults] integerForKey:@"ratecount"]+1  forKey:@"ratecount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
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
    
    NSLog(@"opponent Score=%@",opponent_score);
    NSLog(@"user score=%@",user_score);
    
  /*  NSArray *options3=[info3 objectForKey:@"options"];
options3=[options3 objectAtIndex:0];
    option32=[options3 objectAtIndex:1];
    option33=[options3 objectAtIndex:2];
    option34=[options3 objectAtIndex:3];
    
    */
    NSFileManager *neDir=[[NSFileManager alloc]init];
    
    NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.jpg"];
    NSString *getAudioPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/12.mp3"];
    [neDir removeItemAtPath:getImagePath error:NULL];
    [neDir removeItemAtPath:getAudioPath error:NULL];
    
  //  [self hideActivityIndicater];
    
    [self performSegueWithIdentifier:@"Answers" sender:self];   
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{   
    
    if(str5!=name5)
        _time5.text=@"";
    if(str4!=name4)
        _time4.text=@"";
    
    if(str3!=namec)
        _time3.text=@"";
    if(str2!=name2)
        _time2.text=@"";
    
    if(str1!=namecel)
        _time1.text=@"";
    
    
    if ([segue.identifier isEqualToString:@"Answers"])
    {
        AnswerViewController *vc= (AnswerViewController *)[segue destinationViewController];
        vc.str6=namecel;
        vc.str7=name2;
        vc.str8=namec;
        vc.str9=name4;
        vc.str10=name5;
        
        vc.str11=_time1.text;
        vc.str12=_time2.text;
        vc.str13=_time3.text;
        vc.str14=_time4.text;
        vc.str15=_time5.text;
        vc.access_token=access_token;
        NSLog(@"%@",str1);
        vc.otime1=opptime1;
        vc.otime2=opptime2;
        vc.otime3=opptime3;
        vc.otime4=opptime4;
        vc.otime5=opptime5;
        vc.opponent_name=opponent_name;
        vc.opponent_image=opponent_image;
        vc.us_image=us_image;
        vc.opponent_coins_p=self.oppcoinslabel.text;
        vc.user_coins_p=mycoin.text;
        vc.u1=str1;
        vc.u2=str2;
        vc.u3=str3;
        vc.u4=str4;
        vc.u5=str5;
        vc.game_id=game_id;
        
        vc.quicktime1=quicktime1;
        vc.quicktime2=quicktime2;
        vc.quicktime3=quicktime3;
        vc.quicktime4=quicktime4;
        vc.quicktime5=quicktime5;
        
          

        if([ans5 isEqualToString:@"0"])
            vc.a5=@"0";
        else{
            vc.a5=@"1";
    
        }
        if([ans4 isEqualToString:@"0"])
            vc.a4=@"0";
        else{
            
        
            vc.a4=@"1";
    
        
        }
        
        if([ans3 isEqualToString:@"0"])
            vc.a3=@"0";
        else{
        
        
            vc.a3=@"1";
        }
        
        if([ans2 isEqualToString:@"0"])
            vc.a2=@"0";
        else{
            vc.a2=@"1";
    
        }
    
        
        if([ans1 isEqualToString:@"0"])
            vc.a1=@"0";
        else{
            
        
            vc.a1=@"1";

            
        }
vc.user_score=user_score;
vc.opponent_score=opponent_score;
        
    }
}

-(void)goToFifthTrailerHint:(UIButton *)sender
{
    
    [hintsView removeFromSuperview];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    

    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&image_id=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],imageid5];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/hints.php"];
    
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
    NSError *error1;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error1];
    
    NSArray *msg12=[json objectForKey:@"hints"];
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingHints=[json objectForKey:@"remaining_hints"];
    if(remainingHints.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Get Hint' as you have not purchased any hints yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
   else
   {
    if(msg12)
    {
        //  sender.tag=0;
        
        
        if([[msg12 objectAtIndex:sender.tag] isEqualToString:@""])
        {
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
            hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(110,62,55, 30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
            [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:2];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=@"   No More Hints";
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(80,135,90,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            
            [hintsView addSubview:okbtn];
            
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
            [okbtn addTarget:self
                      action:@selector(hintok)
            forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
            
            
            [self.view addSubview:hintsView];
            
            [self attachPopUpAnimationToView:hintsView];
            
            
            //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"No More Hints"delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            //   [alert show];
            
            
            
        }
        else
        {
            
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
            hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(130,62, 55, 30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
            [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:4];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=[msg12 objectAtIndex:sender.tag];
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(110,160,80,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
            
            [self.view addSubview:hintsView];
            [okbtn addTarget:self
                      action:@selector(hintok)
            forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
            
            
            [self attachPopUpAnimationToView:hintsView];
            
            //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:[msg12 objectAtIndex:sender.tag] delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            // [alert show];
            sender.tag=sender.tag+1;
        }
        

            }
    if(error11)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show];
    }
    
   }
    
    
}



-(void)goToFifthTrailerEliminate:(id)sender
{
    UIButton *button=sender;
    button.enabled=NO;

    [hintsView removeFromSuperview];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/bombs.php"];
    
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
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingBombs=[json objectForKey:@"remaining_bombs"];
    if(remainingBombs.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Eliminate two options', as you have not purchased any eliminations yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {

    
    int count=0;
    UIButton *buttona = (UIButton *)[self.view1 viewWithTag:17];
    //   [button removeFromSuperview];
    UIButton *buttonb = (UIButton *)[self.view1 viewWithTag:18];
    
    
    UIButton *buttonc = (UIButton *)[self.view1 viewWithTag:19];
    
    UIButton *buttond = (UIButton *)[self.view1 viewWithTag:20];
    
    
    if([buttona currentTitle] != name5  && count!=2)
    {
        [buttona removeFromSuperview];
        count=count+1;
    }
    
    
    
    if([buttonb currentTitle] != name5  && count!=2)
    {
        [buttonb removeFromSuperview];
        count=count+1;
    }
    
    if([buttonc currentTitle] != name5 && count!=2)
    {
        [buttonc removeFromSuperview];
        count=count+1;
    }
    
    if([buttond currentTitle] != name5  && count!=2)
    {
        [buttond removeFromSuperview];
        count=count+1;
    }
        if(error11)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            [alert show];
        }
        
        
    }   


    
}


-(void)goToFourthTrailer:(id) sender {
    
    [theAudio stop];
    theAudio=nil;
       [hintsView removeFromSuperview];

    NSString *getImagePath9 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.jpg"];
    
    UIImage *img9 = [UIImage imageWithContentsOfFile:getImagePath9];
    imageView.image=img9;
    
    NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.jpg"];
    // UIImage *image11 = [UIImage imageWithContentsOfFile:getImagePath6];
    
    UIImage *image15 = [UIImage imageWithContentsOfFile:getImagePath];
    if(image15)
    {
    
    str4=[sender currentTitle];

    
    [self.view addSubviewWithZoomOutAnimation:progbtn4 duration:0 option:curveValues[1]];
    [self.view addSubviewWithZoomInAnimation:progbtn5 duration:0 option:curveValues[1]];
    [timer24 invalidate];
    timer24=nil;
    [timer14 invalidate];
    timer14=nil;
    
    
    
    
      
    UIButton *button = (UIButton *)[self.view1 viewWithTag:13];
    UIButton *buttonn1 = (UIButton *)[self.view1 viewWithTag:14];
    
    UIButton *button2 = (UIButton *)[self.view1 viewWithTag:15];
    UIButton *button3 = (UIButton *)[self.view1 viewWithTag:16];
    
    button.userInteractionEnabled=NO;
    
    buttonn1.userInteractionEnabled=NO; 
    button2.userInteractionEnabled=NO; 
    button3.userInteractionEnabled=NO; 
    
    
    
    
        
    
    
    if([str4 isEqualToString:name4]&&![_time4.text isEqualToString:@"10.0"])
    {
        if(([str1 isEqualToString:namecel]&&![_time1.text isEqualToString:@"10.0"])&&([str2 isEqualToString:name2]&&![_time2.text isEqualToString:@"10.0"])&& ([str3 isEqualToString:namec]&&![_time3.text isEqualToString:@"10.0"]))
        {
            comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"4_green_text.png"];
            [self.view1 addSubview:comment];
            
        }
        else if(([str2 isEqualToString:name2]&&![_time2.text isEqualToString:@"10.0"]) && ([str3 isEqualToString:namec]&&![_time3.text isEqualToString:@"10.0"]))
        {
        comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"3_green_text.png"];
            [self.view1 addSubview:comment];
            
        }
        else if([str3 isEqualToString:namec]&&![_time3.text isEqualToString:@"10.0"])
        {
        comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"2_green_text.png"];
            [self.view1 addSubview:comment];

        }
        else{
        comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"1_green_text.png"];
            [self.view1 addSubview:comment];
        }
    
        if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
        {
            
        [audioPlayerCorrect play];
        }
       
 coins=coins+(100-([_time4.text doubleValue]*10));
        
        
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        

        
        [sender setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
        [progbtn4 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
        
               
        NSString *coins1=[NSString stringWithFormat:@"%d",(int)coins];
        mycoin.text=coins1;
        
        if([oppcoinslabel.text intValue]>=2000)
        {
            star11.image=[UIImage imageNamed:@"star@2x.png"];
        }
        if([oppcoinslabel.text intValue]>=4000)
        {
            star12.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=8000)
        {
            star13.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=16000)
        {
            star14.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if(
           [oppcoinslabel.text intValue]>=32000)
        {
            star15.image=[UIImage imageNamed:@"star@2x.png"];
            
            
        }
        if([mycoin.text intValue]>=2000)
        {
            starcount5=1;
            star16.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=4000)
        {
             starcount5=2;
            star17.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=8000)
        {
             starcount5=3;
            star18.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=16000)
        {
             starcount5=4;
            star19.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=32000)
        {
             starcount5=5;
            star110.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        
        
        
      
    }
    else
    {
        if([str4 isEqualToString:name4])
        {
            if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
            {
                [audioPlayerCorrect play];
            }
            [progbtn4 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        else
        {
            if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
            {
                [audioPlayerWrong play];
            }
            [progbtn4 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        } 

        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
     
        
        [sender setBackgroundImage:[UIImage imageNamed:@"wrong_name_btn@2x.png"] forState:UIControlStateNormal];
        if([[button3 currentTitle] isEqualToString:name4]){
            
            [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button3 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
       //     [progbtn4 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[button currentTitle] isEqualToString:name4]){
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
         //   [progbtn4 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[buttonn1 currentTitle] isEqualToString:name4]){
            [buttonn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            

            [buttonn1 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
           // [progbtn4 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[button2 currentTitle] isEqualToString:name4]){
            
            
            
            [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button2 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
            //[progbtn4 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        
        

        
    }
    
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    comment.image=nil;
    // UIImage *image = [UIImage imageNamed: @"Orlando.jpeg"];
    
    
    //  [playr stop];
    //playr=nil;
   // NSURL *audioURL = [NSURL URLWithString:audio4];
    
    //playr = [[MPMoviePlayerController alloc] initWithContentURL:audioURL];
    //[playr play];
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
   // NSString *documentsDirectory = [paths objectAtIndex:0];
    /*NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/5.jpg"];
    
    UIImage *img = [UIImage imageWithContentsOfFile:getImagePath];
    
    
    imageView.image = img;
     
     */
    
  //  NSURL *url=[NSURL URLWithString:original_image5];
    
   // NSData *data9 = [NSData dataWithContentsOfURL:url];
   
    
   // source=image9;
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image15];
    
    Gpu = [[GPUImageFastBlurFilter alloc] init];
    [Gpu sizeofblurring:6];
    [stillImageSource addTarget:Gpu];
    [stillImageSource processImage];
    
    UIImage *currentFilteredVideoFrame = [Gpu imageFromCurrentlyProcessedOutput];
    
    GPUImagePicture *stillImageSource1 = [[GPUImagePicture alloc] initWithImage:image15];
    
    Gpu = [[GPUImageFastBlurFilter alloc] init];
    [Gpu sizeofblurring:4];
    [stillImageSource1 addTarget:Gpu];
    [stillImageSource1 processImage];
    
    currentFilteredVideoFrame11 = [Gpu imageFromCurrentlyProcessedOutput];
    GPUImagePicture *stillImageSource2= [[GPUImagePicture alloc] initWithImage:image15];
    
    Gpu = [[GPUImageFastBlurFilter alloc] init];
    [Gpu sizeofblurring:2];
    [stillImageSource2 addTarget:Gpu];
    [stillImageSource2 processImage];
    currentFilteredVideoFrame12 = [Gpu imageFromCurrentlyProcessedOutput];
   
    imageView.image =currentFilteredVideoFrame;
    
    
    //imageView.image =[image15 stackBlur:15];
    

    
   // NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //NSString *documentsDirectory1 = [paths1 objectAtIndex:0];
    NSString *getImagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/12.mp3"];
    
    
    
    
    theAudio =[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath: getImagePath1] error: NULL];
    theAudio.delegate = self;
    [theAudio play];
   
    [button removeFromSuperview];
    [buttonn1 removeFromSuperview];
    [button2 removeFromSuperview];
    [button3 removeFromSuperview];
    
    
    
    questionnumber=4;
    [self ShuffelOptions];
    
    
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(13,26, 143, 37);
    [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    [button5.titleLabel setNumberOfLines:2];
    button5.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button5 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button5.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    



    [button5 setTitle:[Temp objectAtIndex:0]
             forState:(UIControlState)UIControlStateNormal];
       
    button5.tag=17;
    [self.view1 addSubview:button5];
    
    
    [button5 addTarget:self
                action:@selector(goToFifthTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button5.titleLabel.minimumFontSize=12.0;
    button5.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(160, 26, 143, 37);
   [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    // [button setTitle:@"Selena" 
    //        forState:(UIControlState)UIControlStateNormal];
    // [self.view1 addSubview:button6];
   
    [button6.titleLabel setNumberOfLines:2];
    button6.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button6 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button6.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    



    [button6 setTitle:[Temp objectAtIndex:1]
             forState:(UIControlState)UIControlStateNormal];
       
    button6.tag=18;
    [self.view1 addSubview:button6];
    
    
    [button6 addTarget:self
                action:@selector(goToFifthTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button6.titleLabel.minimumFontSize=12.0;
    button6.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(13, 66, 143, 37);
   [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
   [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    // [button2 setTitle:@"Paris Hilton" 
    // forState:(UIControlState)UIControlStateNormal];
    button7.tag=19;
    [button7.titleLabel setNumberOfLines:2];
    button7.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button7 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button7.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    


    

    [button7 setTitle:[Temp objectAtIndex:2]
             forState:(UIControlState)UIControlStateNormal];
        [self.view1 addSubview:button7];
    [button7 addTarget:self
                action:@selector(goToFifthTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button7.titleLabel.minimumFontSize=12.0;
    button7.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(160, 66, 143, 37);
    [button8 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button8 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateHighlighted];
    //[button3 setTitle:@"Angelina" 
    //       forState:(UIControlState)UIControlStateNormal];
    button8.tag=20;
     [button8.titleLabel setNumberOfLines:2];
    button8.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button8 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button8.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    


    [button8 setTitle:[Temp objectAtIndex:3]
             forState:(UIControlState)UIControlStateNormal];
    button8.titleLabel.minimumFontSize=12.0;
    button8.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    [self.view1 addSubview:button8];
    [button8 addTarget:self
                action:@selector(goToFifthTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    
    
    UIButton *eliminate2 = [UIButton buttonWithType:UIButtonTypeCustom];
    eliminate2.frame = CGRectMake(13, 107, 292, 37);
    //    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"name_eliminate_btn@2x.png"] forState:UIButtonTypeCustom];
    
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn@2x.png"] forState:UIControlStateNormal];
    //  [button3 setTitle:@"Angelina" 
    //       forState:(UIControlState)UIControlStateNormal];
    // [self.view3 addSubview:button3];
    //  [eliminate2 setTitle:@"Eliminate Two Options" 
    //            forState:(UIControlState)UIControlStateNormal];
    
    [self.view1 addSubview:eliminate2];
    [eliminate2 addTarget:self
                   action:@selector(goToFifthTrailerEliminate:) 
         forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    UIButton *gethint = [UIButton buttonWithType:UIButtonTypeCustom];
    gethint.frame = CGRectMake(13, 149, 292, 37);
    gethint.tag=0;
    [gethint setBackgroundImage:[UIImage imageNamed:@"get_hint_btn@2x.png"] forState:UIControlStateNormal];
     [gethint setBackgroundImage:[UIImage imageNamed:@"get_hint_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    [self.view1 addSubview:gethint];
    [gethint addTarget:self
                action:@selector(goToFifthTrailerHint:)
      forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    
    
    
    
    // [self.view3 addSubview:button1];
    //[self.view3 addSubview:button2];
    //[self.view3 addSubview:button3];
    //[self.view3 addSubview:button4];
    
    
    
    
    // [self.view addSubview:self.view1];
    
    
    //   [_prog1 setProgress:1.0];
    [UIView transitionWithView:self.view
                      duration:1.0 
                       options:UIViewAnimationOptionTransitionCrossDissolve 
                    animations:^{
                        [self.imageView removeFromSuperview];
                        //  [self.view2 removeFromSuperview];
                        
                        [self.view addSubview:self.imageView];
                        
                        
                    }
                    completion:nil
     ];   
    
    
    countdown=1.0;
    
    countdown4=1.0;
    //timer15= [[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onTimer5:) userInfo:nil repeats:YES] retain];
    [timer25 invalidate];
    timer25=nil;
    
    timer25=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer25:) userInfo:nil repeats:YES];
   
    
    //  countdown1=0.0;
    // countdown=1.0;
    //countdown2=1.0;
    //timer= [[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer3:) userInfo:nil repeats:YES] retain];
    
    NSFileManager *neDir=[[NSFileManager alloc]init];
    
    NSString *getImagePathR = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.jpg"];
    NSString *getAudioPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/11.mp3"];
    [neDir removeItemAtPath:getImagePathR error:NULL];
    [neDir removeItemAtPath:getAudioPath error:NULL];
    
    
}
else {
    
    NSLog(@"NoImage");
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Internet" message:@"Connection Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alert.tag=4;
    [alert show];
    
    
}
    
    
    // self.view3.backgroundColor = [UIColor redColor];
    
    
}



-(void)goToFourthTrailerEliminate:(id)sender
{
    UIButton *button=sender;
    button.enabled=NO;

    [hintsView removeFromSuperview];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/bombs.php"];
    
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
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingBombs=[json objectForKey:@"remaining_bombs"];
    if(remainingBombs.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Eliminate two options', as you have not purchased any eliminations yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        

    int count=0;
    UIButton *buttona = (UIButton *)[self.view1 viewWithTag:13];
    //   [button removeFromSuperview];
    UIButton *buttonb = (UIButton *)[self.view1 viewWithTag:14];
    
    
    UIButton *buttonc = (UIButton *)[self.view1 viewWithTag:15];
    
    UIButton *buttond = (UIButton *)[self.view1 viewWithTag:16];
    
    
    if([buttona currentTitle] != name4  && count!=2)
    {
        [buttona removeFromSuperview];
        count=count+1;
    }
    
    
    
    if([buttonb currentTitle] != name4  && count!=2)
    {
        [buttonb removeFromSuperview];
        count=count+1;
    }
    
    if([buttonc currentTitle] != name4 && count!=2)
    {
        [buttonc removeFromSuperview];
        count=count+1;
    }
    
    if([buttond currentTitle] != name4  && count!=2)
    {
        [buttond removeFromSuperview];
        count=count+1;
    }
    if(error11)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show];
    }
    
    
}   


}







-(void)goToFourthTrailerHint:(UIButton *)sender
{
    [hintsView removeFromSuperview];

    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&image_id=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],imageid4];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/hints.php"];
    
    // NSLog(post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
  //  [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",data);
    NSError *error1;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error1];
    NSArray *msg12=[json objectForKey:@"hints"];
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingHints=[json objectForKey:@"remaining_hints"];
    if(remainingHints.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Get Hint' as you have not purchased any hints yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
   
    if(msg12)
    {
        //  sender.tag=0;
        
        
        if([[msg12 objectAtIndex:sender.tag] isEqualToString:@""])
        {
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
            hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 62, 55, 30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
            [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:2];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=@"   No More Hints";
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(80,135,90,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            
            [hintsView addSubview:okbtn];
            
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
            [okbtn addTarget:self
                      action:@selector(hintok)
            forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
            
            
            [self.view addSubview:hintsView];
            
            [self attachPopUpAnimationToView:hintsView];
            
            
            //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"No More Hints"delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            //   [alert show];
            
            
            
        }
        else
        {
            
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
            hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(130,62,55, 30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
            [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:4];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=[msg12 objectAtIndex:sender.tag];
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(110,160,80,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
            
            [self.view addSubview:hintsView];
            [okbtn addTarget:self
                      action:@selector(hintok)
            forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
            
            
            [self attachPopUpAnimationToView:hintsView];
            
            //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:[msg12 objectAtIndex:sender.tag] delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            // [alert show];
            sender.tag=sender.tag+1;
        }
        
       
        
    }
    if(error11)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show];
    }
    }

}



-(void)goToThirdTrailer:(id) sender {
    
    [theAudio stop];
    theAudio=nil;
     [hintsView removeFromSuperview];
  NSString *getImagePath8 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/8.jpg"];
    
    UIImage *img8 = [UIImage imageWithContentsOfFile:getImagePath8];
    imageView.image=img8;
    NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.jpg"];
    //UIImage *image11 = [UIImage imageWithContentsOfFile:getImagePath6];
    
    UIImage *image14 = [UIImage imageWithContentsOfFile:getImagePath];
    
   if(image14)
   {
     str3=[sender currentTitle];
    [self.view addSubviewWithZoomOutAnimation:progbtn3 duration:0 option:curveValues[1]];
    [self.view addSubviewWithZoomInAnimation:progbtn4 duration:0 option:curveValues[1]];
    [timer23 invalidate];
    timer23=nil;
    [timer13 invalidate];
    timer13=nil;
    
    
    
    
    
    UIButton *button = (UIButton *)[self.view1 viewWithTag:9];
    UIButton *buttonn1 = (UIButton *)[self.view1 viewWithTag:10];
    UIButton *button2 = (UIButton *)[self.view1 viewWithTag:11];
    UIButton *button3 = (UIButton *)[self.view1 viewWithTag:12];
    
    
    button.userInteractionEnabled=NO;
    
    buttonn1.userInteractionEnabled=NO; 
    button2.userInteractionEnabled=NO; 
    button3.userInteractionEnabled=NO; 
    
    
    
   
    if([str3 isEqualToString:namec] && ![_time3.text isEqualToString:@"10.0"])
    {
        if(([str1 isEqualToString:namecel]&& ![_time1.text isEqualToString:@"10.0"])&&([str2 isEqualToString:name2]&&![_time2.text isEqualToString:@"10.0"]))
        {
            comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"3_green_text.png"];
            [self.view1 addSubview:comment];
            
        }
        else if([str2 isEqualToString:name2]&&![_time2.text isEqualToString:@"10.0"])
        {
        comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"2_green_text.png"];
            [self.view1 addSubview:comment];
        }
        else
        {
            
        comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"1_green_text.png"];
            [self.view1 addSubview:comment];
    
        }
        if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
        {
            
        [audioPlayerCorrect play];
        }
         coins=coins+(100-([_time3.text doubleValue]*10));
        
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        

        
        [sender setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
        [progbtn3 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
        
        
        
                  
        NSString *coins1=[NSString stringWithFormat:@"%d",(int)coins];
        mycoin.text=coins1;
        

        if([oppcoinslabel.text intValue]>=2000)
        {
            star11.image=[UIImage imageNamed:@"star@2x.png"];
        }
        if([oppcoinslabel.text intValue]>=4000)
        {
            star12.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=8000)
        {
            star13.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=16000)
        {
            star14.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if(
           [oppcoinslabel.text intValue]>=32000)
        {
            star15.image=[UIImage imageNamed:@"star@2x.png"];
            
            
        }
        if([mycoin.text intValue]>=2000)
        {
            starcount4=1;

            star16.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=4000)
        {
            starcount4=2;
            star17.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=8000)
        {
            starcount4=3;
            star18.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=16000)
        {
            starcount4=4;
            star19.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=32000)
        {
            starcount4=5;
            star110.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        
        
        
        
              
    }
    else
        
    {
        if([str3 isEqualToString:namec])
        {
            if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
            {
                [audioPlayerCorrect play];
            }
            [progbtn3 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        else
        {
            if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
            {
                [audioPlayerWrong play];
            }
            [progbtn3 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        } 
        
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
 
        
        [sender setBackgroundImage:[UIImage imageNamed:@"wrong_name_btn@2x.png"] forState:UIControlStateNormal];
        
        if([[button3 currentTitle] isEqualToString:namec]){
            
            
            
            [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button3 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
          //  [progbtn3 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[button currentTitle] isEqualToString:namec]){
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
         //   [progbtn3 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[buttonn1 currentTitle] isEqualToString:namec]){
            
            [buttonn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [buttonn1 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
          //  [progbtn3 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[button2 currentTitle] isEqualToString:namec]){
            
            
            
            [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button2 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
          //  [progbtn3 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        
        


        
    }
    
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    
    
    
    comment.image=nil;
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
  /*  NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/4.jpg"];
    
    UIImage *img = [UIImage imageWithContentsOfFile:getImagePath];
    
    
    imageView.image =img;
    
    */
   // NSURL *url=[NSURL URLWithString:original_image4];
    
   // NSData *data9 = [NSData dataWithContentsOfURL:url];
    
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image14];
    
    Gpu = [[GPUImageFastBlurFilter alloc] init];
    [Gpu sizeofblurring:6];
    [stillImageSource addTarget:Gpu];
    [stillImageSource processImage];
    
    UIImage *currentFilteredVideoFrame = [Gpu imageFromCurrentlyProcessedOutput];
    
    GPUImagePicture *stillImageSource1 = [[GPUImagePicture alloc] initWithImage:image14];
    
    Gpu = [[GPUImageFastBlurFilter alloc] init];
    [Gpu sizeofblurring:4];
    [stillImageSource1 addTarget:Gpu];
    [stillImageSource1 processImage];
    
    currentFilteredVideoFrame11 = [Gpu imageFromCurrentlyProcessedOutput];
    GPUImagePicture *stillImageSource2= [[GPUImagePicture alloc] initWithImage:image14];
    
    Gpu = [[GPUImageFastBlurFilter alloc] init];
    [Gpu sizeofblurring:2];
    [stillImageSource2 addTarget:Gpu];
    [stillImageSource2 processImage];
    currentFilteredVideoFrame12 = [Gpu imageFromCurrentlyProcessedOutput];
    imageView.image =currentFilteredVideoFrame;
    
    
  //  imageView.image =[image14 stackBlur:15];
    

    
    
   // NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
   // NSString *documentsDirectory1 = [paths1 objectAtIndex:0];
    NSString *getImagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/11.mp3"];
    
    
    
    
    theAudio =[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath: getImagePath1] error: NULL];
    theAudio.delegate = self;
    [theAudio play];
   
    [button removeFromSuperview];
    [buttonn1 removeFromSuperview];
    [button2 removeFromSuperview];
    [button3 removeFromSuperview];
    
    
    questionnumber=3;
    [self ShuffelOptions];
    
    
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    button5.frame = CGRectMake(13,26, 143, 37);
    [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
   [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    
    [button5.titleLabel setNumberOfLines:2];
    button5.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button5 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button5.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    
    
    
    
   // [button5.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    
    

    
    


    
    

    [button5 setTitle:[Temp objectAtIndex:0]
             forState:(UIControlState)UIControlStateNormal];
      [self.view1 addSubview:button5];
    button5.tag=13;
    
    [button5 addTarget:self
                action:@selector(goToFourthTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button5.titleLabel.minimumFontSize=12.0;
    button5.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(160, 26, 143, 37);
   [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
   [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    // [button setTitle:@"Selena" 
    //        forState:(UIControlState)UIControlStateNormal];
    // [self.view1 addSubview:button6];
    [button6.titleLabel setNumberOfLines:2];
    button6.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button6 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button6.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
   // [button6.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    
    

    
    



    
    [button6 setTitle:[Temp objectAtIndex:1]
             forState:(UIControlState)UIControlStateNormal];
      
    button6.tag=14;
    [self.view1 addSubview:button6];
    
    
    [button6 addTarget:self
                action:@selector(goToFourthTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button6.titleLabel.minimumFontSize=12.0;
    button6.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(13, 66, 143, 37);
   [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
   [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    // [button2 setTitle:@"Paris Hilton" 
    // forState:(UIControlState)UIControlStateNormal];
    button7.tag=15;
    [button7.titleLabel setNumberOfLines:2];
    button7.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button7 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button7.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    

   // [button7.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    


    

    [button7 setTitle:[Temp objectAtIndex:2]
             forState:(UIControlState)UIControlStateNormal];
       [self.view1 addSubview:button7];
    [button7 addTarget:self
                action:@selector(goToFourthTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button7.titleLabel.minimumFontSize=12.0;
    button7.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(160, 66, 143, 37);
[button8 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
   [button8 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    //[button3 setTitle:@"Angelina" 
    //       forState:(UIControlState)UIControlStateNormal];
    button8.tag=16;
    [button8.titleLabel setNumberOfLines:2];
    button8.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button8 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button8.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    



    [button8 setTitle:[Temp objectAtIndex:3]
             forState:(UIControlState)UIControlStateNormal];
       
    [self.view1 addSubview:button8];
    [button8 addTarget:self
                action:@selector(goToFourthTrailer:) 
     
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    button8.titleLabel.minimumFontSize=12.0;
    button8.titleLabel.adjustsFontSizeToFitWidth=YES;

    UIButton *eliminate2 = [UIButton buttonWithType:UIButtonTypeCustom];
    eliminate2.frame = CGRectMake(13, 107, 292, 37);
    //  [eliminate2 setBackgroundImage:[UIImage imageNamed:@"name_eliminate_btn@2x.png"] forState:UIButtonTypeCustom];
    
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    
    
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn@2x.png"] forState:UIControlStateNormal];
    //  [button3 setTitle:@"Angelina" 
    //       forState:(UIControlState)UIControlStateNormal];
    // [self.view3 addSubview:button3];
    // [eliminate2 setTitle:@"Eliminate Two Options" 
    //           forState:(UIControlState)UIControlStateNormal];
    
    [self.view1 addSubview:eliminate2];
    [eliminate2 addTarget:self
                   action:@selector(goToFourthTrailerEliminate:) 
         forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    UIButton *gethint = [UIButton buttonWithType:UIButtonTypeCustom];
    gethint.frame = CGRectMake(13, 149, 292, 37);
    gethint.tag=0;
    [gethint setBackgroundImage:[UIImage imageNamed:@"get_hint_btn_h@2x.png"] forState:UIControlStateHighlighted];
    

    [gethint setBackgroundImage:[UIImage imageNamed:@"get_hint_btn@2x.png"] forState:UIControlStateNormal];
        [self.view1 addSubview:gethint];
    [gethint addTarget:self
                action:@selector(goToFourthTrailerHint:)
      forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    
    
    
    // [self.view3 addSubview:button1];
    //[self.view3 addSubview:button2];
    //[self.view3 addSubview:button3];
    //[self.view3 addSubview:button4];
    
    
    
    
    // [self.view addSubview:self.view1];
    
    
    //   [_prog1 setProgress:1.0];
    [UIView transitionWithView:self.view
                      duration:1.0 
                       options:UIViewAnimationOptionTransitionCrossDissolve 
                    animations:^{
                        [self.imageView removeFromSuperview];
                        //  [self.view2 removeFromSuperview];
                        
                        [self.view addSubview:self.imageView];
                        
                        
                    }
                    completion:nil
     ];   
    
    countdown=1.0;
    
    countdown3=1.0;
  //  timer14= [[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onTimer4:) userInfo:nil repeats:YES] retain];
    [timer24 invalidate];
    timer24=nil;
    
    timer24=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer24:) userInfo:nil repeats:YES];
      
    
    //  countdown1=0.0;
    // countdown=1.0;
    //countdown2=1.0;
    //timer= [[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer3:) userInfo:nil repeats:YES] retain];
    
    
    NSFileManager *neDir=[[NSFileManager alloc]init];
    
    NSString *getImagePathR = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/8.jpg"];
    NSString *getAudioPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.mp3"];
    [neDir removeItemAtPath:getImagePathR error:NULL];
    [neDir removeItemAtPath:getAudioPath error:NULL];
    
   }
   else {
       
       NSLog(@"NoImage");
       
       UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Internet" message:@"Connection Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
       alert.tag=4;
       [alert show];
       
       
   }
    
    
    // self.view3.backgroundColor = [UIColor redColor];
    
    
}




-(void)goToThirdTrailerEliminate:(id)sender
{
    [hintsView removeFromSuperview];
    UIButton *button=sender;
    button.enabled=NO;

    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/bombs.php"];
    
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
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingBombs=[json objectForKey:@"remaining_bombs"];
    if(remainingBombs.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Eliminate two options', as you have not purchased any eliminations yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        

    
    int count=0;
    UIButton *buttona = (UIButton *)[self.view1 viewWithTag:9];
    //   [button removeFromSuperview];
    UIButton *buttonb = (UIButton *)[self.view1 viewWithTag:10];
    
    
    UIButton *buttonc = (UIButton *)[self.view1 viewWithTag:11];
    
    UIButton *buttond = (UIButton *)[self.view1 viewWithTag:12];
    
    
    if([buttona currentTitle] != namec  && count!=2)
    {
        [buttona removeFromSuperview];
        count=count+1;
    }
    
    
    
    if([buttonb currentTitle] != namec  && count!=2)
    {
        [buttonb removeFromSuperview];
        count=count+1;
    }
    
    if([buttonc currentTitle] != namec && count!=2)
    {
        [buttonc removeFromSuperview];
        count=count+1;
    }
    
    if([buttond currentTitle] != namec  && count!=2)
    {
        [buttond removeFromSuperview];
        count=count+1;
    }
    if(error11)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show];
    }
    
    
}   


}






-(void)goToThirdTrailerHint:(UIButton *)sender
{
    
    [hintsView removeFromSuperview];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    

    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&image_id=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],imageid3];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/hints.php"];
    
    // NSLog(post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
  //  [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",data);
    NSError *error1;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error1];
    NSArray *msg12=[json objectForKey:@"hints"];
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingHints=[json objectForKey:@"remaining_hints"];
    if(remainingHints.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Get Hint' as you have not purchased any hints yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
    if(msg12)
    {
        //  sender.tag=0;
        
        
        if([[msg12 objectAtIndex:sender.tag] isEqualToString:@""])
        {
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
            hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(110,62, 55, 30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
            [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:2];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=@"   No More Hints";
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(80,135,90,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            
            [hintsView addSubview:okbtn];
            
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
            [okbtn addTarget:self
                      action:@selector(hintok)
            forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
            
            
            [self.view addSubview:hintsView];
            
            [self attachPopUpAnimationToView:hintsView];
            
            
            //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"No More Hints"delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            //   [alert show];
            
            
            
        }
        else
        {
            
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
            hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(130,62,55,30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
            [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:4];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=[msg12 objectAtIndex:sender.tag];
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(110,160,80,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
            
            [self.view addSubview:hintsView];
            [okbtn addTarget:self
                      action:@selector(hintok)
            forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
            
            
            [self attachPopUpAnimationToView:hintsView];
            
            //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:[msg12 objectAtIndex:sender.tag] delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            // [alert show];
            sender.tag=sender.tag+1;
        }
        
     
    }

    if(error11)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show];
    }
    }  

}




-(void)goToSecondTrailer:(id) sender {
    
    str2=[sender currentTitle];
    [theAudio stop];
    theAudio=nil;
   [hintsView removeFromSuperview];
    

    NSString *getImagePath7 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/7.jpg"];
    
    UIImage *img7 = [UIImage imageWithContentsOfFile:getImagePath7];
    imageView.image=img7;
    
    NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/8.jpg"];
    //  UIImage *image11 = [UIImage imageWithContentsOfFile:getImagePath6];
    
    UIImage *image10 = [UIImage imageWithContentsOfFile:getImagePath];
    
    
    if(image10)
   
    {  
    [self.view addSubviewWithZoomOutAnimation:progbtn2 duration:0 option:curveValues[1]];
    
    
    
    [self.view addSubviewWithZoomInAnimation:progbtn3 duration:0 option:curveValues[1]];
    [timer22 invalidate];
    timer22=nil;
    [timer12 invalidate];
    timer12=nil;
    
    
    
       
    UIButton *button = (UIButton *)[self.view1 viewWithTag:5];
    UIButton *buttonnn1 = (UIButton *)[self.view1 viewWithTag:6];
    UIButton *button2 = (UIButton *)[self.view1 viewWithTag:7];
    UIButton *button3 = (UIButton *)[self.view1 viewWithTag:8];
    
    button.userInteractionEnabled=NO;
    
    buttonnn1.userInteractionEnabled=NO; 
    button2.userInteractionEnabled=NO; 
    button3.userInteractionEnabled=NO; 
    
    
  
       
    if([str2 isEqualToString:name2] && ![_time2.text isEqualToString:@"10.0"])
    {
        if([str1 isEqualToString:namecel]&& ![_time1.text isEqualToString:@"10.0"])
        {
        comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"2_green_text.png"];
            [self.view1 addSubview:comment];
            
        }
        else{
            comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
            comment.image=[UIImage imageNamed: @"1_green_text.png"];
            [self.view1 addSubview:comment];
        }
        if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
        {
            
        [audioPlayerCorrect play];
        }
 coins=coins+(100-([_time2.text doubleValue]*10));
        
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        

        
        [sender setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
        [progbtn2 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
        
      
        
        NSString *coins1=[NSString stringWithFormat:@"%d",(int)coins];
        mycoin.text=coins1;
        
        if([oppcoinslabel.text intValue]>=2000)
        {
            star11.image=[UIImage imageNamed:@"star@2x.png"];
        }
        if([oppcoinslabel.text intValue]>=4000)
        {
            star12.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=8000)
        {
            star13.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=16000)
        {
            star14.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if(
           [oppcoinslabel.text intValue]>=32000)
        {
            star15.image=[UIImage imageNamed:@"star@2x.png"];
            
            
        }
        if([mycoin.text intValue]>=2000)
        {
            starcount3=1;
            star16.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=4000)
        {
            starcount3=2;

            star17.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=8000)
        {
            starcount3=3;

            star18.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=16000)
        {
            starcount3=4;

            star19.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=32000)
        {
            starcount3=5;

            star110.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        
        
        
              
    }
    
    
    else
    {
        if([str2 isEqualToString:name2])
        {
            if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
            {
                [audioPlayerCorrect play];
            }
            [progbtn2 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];

        }
        else
        {
            if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
            {
                [audioPlayerWrong play];
            }
            [progbtn2 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        } 
        
       [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"wrong_name_btn@2x.png"] forState:UIControlStateNormal];
        if([[button3 currentTitle] isEqualToString:name2]){
            
            
            [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button3 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
            //[progbtn2 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[button currentTitle] isEqualToString:name2]){
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
          //  [progbtn2 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[buttonnn1 currentTitle] isEqualToString:name2]){
            
            [buttonnn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [buttonnn1 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
           // [progbtn2 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        if([[button2 currentTitle] isEqualToString:name2]){
            
            
            [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            

            [button2 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
            
            
            //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
            
           // [progbtn2 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
            
        }
        
        
        
        
    }
    
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    
    comment.image=nil;
    // UIImage *image = [UIImage imageNamed: @"Orlando.jpeg"];
   // NSURL *audioURL = [NSURL URLWithString:audioc];
    
    // playr = [[MPMoviePlayerController alloc] initWithContentURL:audioURL];
    // [playr play];
   
    
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
   // NSString *documentsDirectory = [paths objectAtIndex:0];
    /*NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/3.jpg"];
    
    UIImage *img = [UIImage imageWithContentsOfFile:getImagePath];
    
    
    
    imageView.image =img;
    
    */
    //NSURL *url=[NSURL URLWithString:original_image3];
    
    //NSData *data9 = [NSData dataWithContentsOfURL:url];
      
   // source=image9;
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image10];
    
    Gpu = [[GPUImageFastBlurFilter alloc] init];
    [Gpu sizeofblurring:6];
    [stillImageSource addTarget:Gpu];
    [stillImageSource processImage];
    
    UIImage *currentFilteredVideoFrame = [Gpu imageFromCurrentlyProcessedOutput];
    
    GPUImagePicture *stillImageSource1 = [[GPUImagePicture alloc] initWithImage:image10];
    
    Gpu = [[GPUImageFastBlurFilter alloc] init];
    [Gpu sizeofblurring:4];
    [stillImageSource1 addTarget:Gpu];
    [stillImageSource1 processImage];
    
    currentFilteredVideoFrame11 = [Gpu imageFromCurrentlyProcessedOutput];
    GPUImagePicture *stillImageSource2= [[GPUImagePicture alloc] initWithImage:image10];
    
    Gpu = [[GPUImageFastBlurFilter alloc] init];
    [Gpu sizeofblurring:2];
    [stillImageSource2 addTarget:Gpu];
    [stillImageSource2 processImage];
    currentFilteredVideoFrame12 = [Gpu imageFromCurrentlyProcessedOutput];
     imageView.image =currentFilteredVideoFrame;
    
    
   // imageView.image =[image10 stackBlur:15];
    

    //NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
   // NSString *documentsDirectory1 = [paths1 objectAtIndex:0];
    NSString *getImagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.mp3"];
    
    
    
    theAudio =[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath: getImagePath1] error: NULL];
    theAudio.delegate = self;
    [theAudio play];
   // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
 
    
    [button removeFromSuperview];
    [buttonnn1 removeFromSuperview];
    [button2 removeFromSuperview];
    [button3 removeFromSuperview];
    
    
    
    
    
    questionnumber=2;
    [self ShuffelOptions];
    
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button5.frame = CGRectMake(13,26, 143, 37);
  [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    [button5.titleLabel setNumberOfLines:2];
    button5.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button5 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button5.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    



    [button5 setTitle:[Temp objectAtIndex:0]
             forState:(UIControlState)UIControlStateNormal];
      
    
    [self.view1 addSubview:button5];
    button5.tag=9;
    
    [button5 addTarget:self
                action:@selector(goToThirdTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button5.titleLabel.minimumFontSize=12.0;
    button5.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(160, 26, 143, 37);
    [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    // [button setTitle:@"Selena" 
    //        forState:(UIControlState)UIControlStateNormal];
    // [self.view1 addSubview:button6];
     [button6.titleLabel setNumberOfLines:2];
    button6.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button6 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button6.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    


    [button6 setTitle:[Temp objectAtIndex:1]
             forState:(UIControlState)UIControlStateNormal];
   
    
    button6.tag=10;
    [self.view1 addSubview:button6];
    
    
    [button6 addTarget:self
                action:@selector(goToThirdTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    button6.titleLabel.minimumFontSize=12.0;
    button6.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(13, 66, 143, 37);
   [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    // [button2 setTitle:@"Paris Hilton" 
   [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    // forState:(UIControlState)UIControlStateNormal];
    button7.tag=11;
    [button7.titleLabel setNumberOfLines:2];
    button7.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button7 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button7.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    


    
    [button7 setTitle:[Temp objectAtIndex:2]
             forState:(UIControlState)UIControlStateNormal];
       
    [self.view1 addSubview:button7];
    [button7 addTarget:self
                action:@selector(goToThirdTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    
    button7.titleLabel.minimumFontSize=12.0;
    button7.titleLabel.adjustsFontSizeToFitWidth=YES;
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(160, 66, 143, 37);
   [button8 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    
    
    [button8 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    //[button3 setTitle:@"Angelina" 
    //       forState:(UIControlState)UIControlStateNormal];
    button8.tag=12;
    [button8.titleLabel setNumberOfLines:2];
    button8.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button8 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button8.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    



    [button8 setTitle:[Temp objectAtIndex:3]
             forState:(UIControlState)UIControlStateNormal];
       
    [self.view1 addSubview:button8];
    [button8 addTarget:self
                action:@selector(goToThirdTrailer:)
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    button8.titleLabel.minimumFontSize=12.0;
    button8.titleLabel.adjustsFontSizeToFitWidth=YES;
    UIButton *eliminate2 = [UIButton buttonWithType:UIButtonTypeCustom];
    eliminate2.frame = CGRectMake(13, 107, 292, 37);
    // [eliminate2 setBackgroundImage:[UIImage imageNamed:@"name_eliminate_btn@2x.png"] forState:UIButtonTypeCustom];
    
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn@2x.png"] forState:UIControlStateNormal];
    //  [button3 setTitle:@"Angelina" 
    //       forState:(UIControlState)UIControlStateNormal];
    // [self.view3 addSubview:button3];
    //[eliminate2 setTitle:@"Eliminate Two Options" 
    //          forState:(UIControlState)UIControlStateNormal];
    
    [self.view1 addSubview:eliminate2];
    [eliminate2 addTarget:self
                   action:@selector(goToThirdTrailerEliminate:) 
         forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    
    UIButton *gethint = [UIButton buttonWithType:UIButtonTypeCustom];
    gethint.frame = CGRectMake(13, 149, 292, 37);
    [gethint setBackgroundImage:[UIImage imageNamed:@"get_hint_btn@2x.png"] forState:UIControlStateNormal];
     [gethint setBackgroundImage:[UIImage imageNamed:@"get_hint_btn_h@2x.png"] forState:UIControlStateHighlighted];
    gethint.tag=0;
    [self.view1 addSubview:gethint];
    [gethint addTarget:self
                action:@selector(goToThirdTrailerHint:)
      forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    
    
    
    // [self.view3 addSubview:button1];
    //[self.view3 addSubview:button2];
    //[self.view3 addSubview:button3];
    //[self.view3 addSubview:button4];
    
    
    
    
    // [self.view addSubview:self.view1];
    
    
    //   [_prog1 setProgress:1.0];
    [UIView transitionWithView:self.view
                      duration:1.0 
                       options:UIViewAnimationOptionTransitionCrossDissolve 
                    animations:^{
                        [self.imageView removeFromSuperview];
                        //  [self.view2 removeFromSuperview];
                        
                        [self.view addSubview:self.imageView];
                        
                        
                    }
                    completion:nil
     ];   
    
    countdown=1.0;
    countdown2=1.0;
    //timer13= [[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onTimer3:) userInfo:nil repeats:YES] retain];
    
    [timer23 invalidate];
    timer23=nil;
    
    timer23=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer23:) userInfo:nil repeats:YES];
  

    
    //  countdown1=0.0;
    // countdown=1.0;
    //countdown2=1.0;
    //timer= [[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer3:) userInfo:nil repeats:YES] retain];
    
    NSFileManager *neDir=[[NSFileManager alloc]init];
    
    NSString *getImagePathR = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/7.jpg"];
    NSString *getAudioPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.mp3"];
    [neDir removeItemAtPath:getImagePathR error:NULL];
    [neDir removeItemAtPath:getAudioPath error:NULL];
}
    else{
        NSLog(@"NoImage");
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Internet" message:@"Your internet speed is too slow. Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag=4;
        [alert show];
        

    }
    
    
    // self.view3.backgroundColor = [UIColor redColor];
    
    
}

-(void)goToSecondTrailerEliminate:(id)sender
{
    UIButton *button=sender;
    button.enabled=NO;
    [hintsView removeFromSuperview];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/bombs.php"];
    
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
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingBombs=[json objectForKey:@"remaining_bombs"];
    if(remainingBombs.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Eliminate two options', as you have not purchased any eliminations yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        

    
    int count=0;
    UIButton *buttona = (UIButton *)[self.view1 viewWithTag:5];
    //   [button removeFromSuperview];
    UIButton *buttonb = (UIButton *)[self.view1 viewWithTag:6];
    
    
    UIButton *buttonc = (UIButton *)[self.view1 viewWithTag:7];
    
    UIButton *buttond = (UIButton *)[self.view1 viewWithTag:8];
    
    
    if([buttona currentTitle] != name2  && count!=2)
    {
        [buttona removeFromSuperview];
        count=count+1;
    }
    
    
    
    if([buttonb currentTitle] != name2  && count!=2)
    {
        [buttonb removeFromSuperview];
        count=count+1;
    }
    
    if([buttonc currentTitle] != name2 && count!=2)
    {
        [buttonc removeFromSuperview];
        count=count+1;
    }
    
    if([buttond currentTitle] != name2  && count!=2)
    {
        [buttond removeFromSuperview];
        count=count+1;
    }
    if(error11)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show];
    }
    
    
}   


}




-(void)viewDidAppear:(BOOL)animated

{
    NSURL *url23 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Countdown"ofType:@"mp3"]];
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
    countd=0;
    [self count:nil];
    [image123 removeFromSuperview];
    NSString *getImagePath6 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/6.jpg"];
    UIImage *image11 = [UIImage imageWithContentsOfFile:getImagePath6];
    UIImage *currentFilteredVideoFrame;
    NSString *getImagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/8.mp3"];
    
    
    theAudio =[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath: getImagePath1] error: NULL];
    theAudio.delegate = self;
    if(image11&&theAudio)
    {    
        GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image11];
        Gpu = [[GPUImageFastBlurFilter alloc] init];
        [Gpu sizeofblurring:6];
        [stillImageSource addTarget:Gpu];
        [stillImageSource processImage];
        currentFilteredVideoFrame = [Gpu imageFromCurrentlyProcessedOutput];
        GPUImagePicture *stillImageSource1 = [[GPUImagePicture alloc] initWithImage:image11];
        Gpu = [[GPUImageFastBlurFilter alloc] init];
        [Gpu sizeofblurring:4];
        [stillImageSource1 addTarget:Gpu];
        [stillImageSource1 processImage];
        currentFilteredVideoFrame11 = [Gpu imageFromCurrentlyProcessedOutput];
        GPUImagePicture *stillImageSource2= [[GPUImagePicture alloc] initWithImage:image11];
        Gpu = [[GPUImageFastBlurFilter alloc] init];
        [Gpu sizeofblurring:2];
        [stillImageSource2 addTarget:Gpu];
        [stillImageSource2 processImage];
        currentFilteredVideoFrame12 = [Gpu imageFromCurrentlyProcessedOutput];
   

    i=10;
    j=10;
    k=10;
    l=10;
    m=10;
    s=0.0;
     t=0.0;
     u=0.0;
     v=0.0;
     w=0.0;
     
     
    
    
    
    versus = [[UIImageView alloc]initWithFrame:CGRectMake(135,400,58,64)];
    
    [versus setImage:[UIImage imageNamed:@"vs@2x.png"]];
    
    
    
    meImageView = [[UIImageView alloc]initWithFrame:CGRectMake(400,48, 134, 65)];
    
    [meImageView setImage:[UIImage imageNamed:@"player_box_bg@2x.png"]];
    
    oppImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-200,48, 134, 65)];
    
    [oppImageView setImage:[UIImage imageNamed:@"player_box_bg@2x.png"]];
    
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
    
//    NSURL *url23 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Countdown"ofType:@"mp3"]];
//    NSError *error23;
//    audioPlayercountdown = [[AVAudioPlayer alloc]
//                   initWithContentsOfURL:url23
//                   error:&error23];
//    if (error23)
//    {
//        NSLog(@"Error in audioPlayer: %@",
//              [error23 localizedDescription]);
//    } else {
//        audioPlayer.delegate = self;
//        [audioPlayer prepareToPlay];
//    }
//    
    
    NSURL *url21 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Correct1"ofType:@"mp3"]];
    NSError *error21;
    audioPlayerCorrect = [[AVAudioPlayer alloc]
                          initWithContentsOfURL:url21
                          error:&error21];
    if (error21)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error21 localizedDescription]);
    } else {
        audioPlayerCorrect.delegate = self;
        [audioPlayerCorrect prepareToPlay];
    }
    
    
    NSURL *url22 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Wrong"ofType:@"mp3"]];
    NSError *error22;
    audioPlayerWrong = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:url22
                        error:&error22];
    if (error22)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error22 localizedDescription]);
    } else {
        audioPlayerWrong.delegate = self;
        [audioPlayerWrong prepareToPlay];
    }
    
    
       
        // imgview.image=currentFilteredVideoFrame;
        questionnumber=0;
    [self ShuffelOptions];
    //[audioPlayercountdown play];
    //countd=0;
     // [self count:nil];
      //[image123 removeFromSuperview];
    [self.view addSubview:versus];
    [self.view addSubview:meImageView];
    [self.view addSubview:celebimagebox];
    [self.view addSubview:oppImageView];
    [self.view1 addSubview:timebackground];
    [self.view1 addSubview:progbtn1];
    [self.view1 addSubview:progbtn2];
    [self.view1 addSubview:progbtn3];
    [self.view1 addSubview:progbtn4];
    [self.view1 addSubview:progbtn5];
    
    [self.view1 addSubview:_time1];
      [self.view1 addSubview:_time2];
      [self.view1 addSubview:_time3];
      [self.view1 addSubview:_time4];
      [self.view1 addSubview:_time5];
    UILabel *meLabel = [[UILabel alloc]initWithFrame:CGRectMake(70,6,60 ,15)];
    meLabel.textAlignment=UITextAlignmentRight;
    [meLabel setNumberOfLines:2];
    
    meLabel.textColor = [UIColor grayColor];
    
    [meLabel setBackgroundColor:[UIColor clearColor]];
    
    meLabel.text = @"Me";
    
    meLabel.font=[UIFont boldSystemFontOfSize:12];
    
    [meImageView addSubview:meLabel];
    
    
    UILabel *opname = [[UILabel alloc] initWithFrame:CGRectMake(10,6,90 ,15)];
    
    [opname setNumberOfLines:2];
    
    opname.textColor = [UIColor grayColor];
    
    [opname setBackgroundColor:[UIColor clearColor]];
    
    opname.text = opponent_name;//[oppNameArray valueForKey:@"name"] ;
    
    //[opname setTextAlignment:UITextAlignmentCenter];
    
    opname.font=[UIFont boldSystemFontOfSize:12];
    
    [oppImageView addSubview:opname];
    
    NSString *coins11=[NSString stringWithFormat:@"%d",[opponent_coins intValue]];
    
    coins2=[NSString stringWithFormat:@"%d",[user_coins intValue]];
    
    oppcoinslabel.text=coins11;
    //mycoin.text=coins2;
    
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    
    [defaults1 setObject:coins2 forKey:@"coinsforstars"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    mycoin = [[UILabel alloc]initWithFrame:CGRectMake(40,22,90 ,15)];
    mycoin.textAlignment=UITextAlignmentRight;
    
    [mycoin setNumberOfLines:2];
    
    mycoin.textColor = [UIColor grayColor];
    
    [mycoin setBackgroundColor:[UIColor clearColor]];
    
    mycoin.text =coins2;
    
    mycoin.font=[UIFont boldSystemFontOfSize:12];
    
    [meImageView addSubview:mycoin];
    
    
    opcoin = [[UILabel alloc] initWithFrame:CGRectMake(10,22,80 ,15)];
    
    [opcoin setNumberOfLines:2];
    
    opcoin.textColor = [UIColor grayColor];
    
    [opcoin setBackgroundColor:[UIColor clearColor]];
    
    opcoin.text = coins11;//[oppNameArray valueForKey:@"name"] ;
    
    //[opcoin setTextAlignment:UITextAlignmentCenter];
    
    opcoin.font=[UIFont boldSystemFontOfSize:12];
    
    [oppImageView addSubview:opcoin];
    
    
    
       
   AsyncImageView *meImage = [[AsyncImageView alloc]initWithFrame:CGRectMake(7,6,30,35)];
    
    //NSData *meData = [NSData dataWithContentsOfURL:[NSURL URLWithString:us_image]];
    
    //[meImage setImage:[UIImage imageWithData:meData]];
    [meImage loadImageFromURL:[NSURL URLWithString:us_image]];
    [meImageView addSubview:meImage];
    
    // NSLog(@"%@",oppImageUrl);
    
    
    AsyncImageView *oppImage = [[AsyncImageView alloc]initWithFrame:CGRectMake(95, 6,30,35)];
    
    // [oppImage setBackgroundColor:[UIColor blackColor]];
    
   // NSData *oppData = [NSData dataWithContentsOfURL:[NSURL URLWithString:opponent_image]];
    
    //[oppImage setImage:[UIImage imageWithData:oppData]];
     [oppImage loadImageFromURL:[NSURL URLWithString:opponent_image]];
    [oppImageView addSubview:oppImage];
    UIImageView *seprator1 = [[UIImageView alloc]initWithFrame:CGRectMake(10,45,110,2)];
    seprator1.image=[UIImage imageNamed:@"separator_player_line@2x.png"];
    
    
    [oppImageView addSubview:seprator1];
    UIImageView *seprator2 = [[UIImageView alloc]initWithFrame:CGRectMake(10,45,110,2)];
    seprator2.image=[UIImage imageNamed:@"separator_player_line@2x.png"];
    
    
    [meImageView addSubview:seprator2];
    
    
    
    star11 = [[UIImageView alloc]initWithFrame:CGRectMake(5,47,20,15)];
    star11.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    
    [oppImageView addSubview:star11];
    star12 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 47,20,15)];
    star12.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    
    [oppImageView addSubview:star12];
    
    
    star13 = [[UIImageView alloc]initWithFrame:CGRectMake(55, 47,20,15)];
    
    star13.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    [oppImageView addSubview:star13];
    
    star14 = [[UIImageView alloc]initWithFrame:CGRectMake(80,47,20,15)];
    
    star14.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    
    [oppImageView addSubview:star14];
    
    star15 = [[UIImageView alloc]initWithFrame:CGRectMake(105,47,20,15)];
    
    star15.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    [oppImageView addSubview:star15];
    
    
    star16 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 47,20,15)];
    
    star16.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    
    [meImageView addSubview:star16];
    
    
    
    star17 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 47,20,15)];
    
    star17.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    
    [meImageView addSubview:star17];
    
    star18 = [[UIImageView alloc]initWithFrame:CGRectMake(55, 47,20,15)];
    
    star18.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    
    [meImageView addSubview:star18];
    
    
    star19 = [[UIImageView alloc]initWithFrame:CGRectMake(80, 47,20,15)];
    
    star19.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    
    [meImageView addSubview:star19];
    star110 = [[UIImageView alloc]initWithFrame:CGRectMake(105, 47,20,15)];
    
    star110.image=[UIImage imageNamed:@"star_on@2x.png"];
    
    
    [meImageView addSubview:star110];
    
    
    
    
    
    _time1.text=@"0.0";
    _time2.text=@"0.0";
    _time3.text=@"0.0";
    _time4.text=@"0.0";
    _time5.text=@"0.0";
    [self.view addSubviewWithZoomInAnimation:progbtn1 duration:0 option:curveValues[1]];
    
     coins=[mycoin.text intValue];
    
     
    if([oppcoinslabel.text intValue]>=2000)
    {
        star11.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([oppcoinslabel.text intValue]>=4000)
    {
        star12.image=[UIImage imageNamed:@"star@2x.png"];
        
        
    }
    if([oppcoinslabel.text intValue]>=8000)
    {
        star13.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([oppcoinslabel.text intValue]>=16000)
    {
        star14.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if(
       [oppcoinslabel.text intValue]>=32000)
    {
        star15.image=[UIImage imageNamed:@"star@2x.png"];
        
        
    }
    if([mycoin.text intValue]>=2000)
    {
        starcount1=1;
        
        star16.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([mycoin.text intValue]>=4000)
    {
        
        starcount1=2;
        star17.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([mycoin.text intValue]>=8000)
    {
        starcount1=3;
        star18.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([mycoin.text intValue]>=16000)
    {
        starcount1=4;
        star19.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    if([mycoin.text intValue]>=32000)
    {
        starcount1=5;
        star110.image=[UIImage imageNamed:@"star@2x.png"];
        
    }
    
    
        
    
    _name.text=opponent_name;
    _me.text=@"Me";
    countdown=1.0;
    NSURL *audioURL = [NSURL URLWithString:audio];
    
    playr = [[MPMoviePlayerController alloc] initWithContentURL:audioURL];
    // [playr play];
    
  //  _usernameimageviewleft.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:opponent_image]]];
    // _usernameimageviewleft.image=[UIImage imageNamed:opponent_image];
  //  _usernameimageviewright.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:us_image]]];
    
    
    
    
    
    
    // NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    /*  NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/1.jpg"];
     
     UIImage *img = [UIImage imageWithContentsOfFile:getImagePath];
     
     */
 
    
   // source=image9;
  // imgview.image=currentFilteredVideoFrame;
    imageView.image =currentFilteredVideoFrame;
    
    
    
    
    //NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //  NSString *documentsDirectory1 = [paths1 objectAtIndex:0];
    //[theAudio play];
    
    // imageView.image =img;
   
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(13,26, 143, 37);
    
    [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    //   [button5 addTarget:self
    //   action:@selector(button1:)
    //  forControlEvents:UIControlEventTouchUpInside];
    [self.view1 addSubview:button5];
    [button5.titleLabel setNumberOfLines:2];
    button5.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    [button5 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    //  button5.titleLabel.textColor=[UIColor blackColor];
    [button5.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    [button5 setTitle:[Temp objectAtIndex:0]
             forState:(UIControlState)UIControlStateNormal];
    
    button5.tag=1;
    [button5 addTarget:self
                action:@selector(goToFirstTrailer:)
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button5.titleLabel.minimumFontSize=12.0;
    button5.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(160, 26, 143, 37);
    [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    [self.view1 addSubview:button6];
    [button6.titleLabel setNumberOfLines:2];
    button6.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    [button6 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button6.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    
    
    [button6 setTitle:[Temp objectAtIndex:1]
             forState:(UIControlState)UIControlStateNormal];
    
    
    button6.tag=2;
    [button6 addTarget:self
                action:@selector(goToFirstTrailer:)
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    button6.titleLabel.minimumFontSize=12.0;
    button6.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(13, 66, 143, 37);
    [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    [self.view1 addSubview:button7];
    [button7.titleLabel setNumberOfLines:2];
    button7.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    [button7 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button7.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    
    [button7 setTitle:[Temp objectAtIndex:2]
             forState:(UIControlState)UIControlStateNormal];
    
    
    button7.tag=3;
    [button7 addTarget:self
                action:@selector(goToFirstTrailer:)
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button7.titleLabel.minimumFontSize=12.0;
    button7.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(160, 66, 143, 37);
    [button8 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button8 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    [self.view1 addSubview:button8];
    [button8.titleLabel setNumberOfLines:2];
    button8.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    [button8 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button8.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    
    
    [button8 setTitle:[Temp objectAtIndex:3]
             forState:(UIControlState)UIControlStateNormal];
    
    button8.tag=4;
    [button8 addTarget:self
                action:@selector(goToFirstTrailer:)
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button8.titleLabel.minimumFontSize=12.0;
    button8.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    UIButton *eliminate2 = [UIButton buttonWithType:UIButtonTypeCustom];
    eliminate2.frame = CGRectMake(13, 107, 292, 37);
    //  [button3 setTitle:@"Angelina"
    //       forState:(UIControlState)UIControlStateNormal];
    // [self.view3 addSubview:button3];
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn@2x.png"] forState:UIControlStateNormal];
    
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    // [eliminate2 setTitle:@"Eliminate Two Options"
    //forState:(UIControlState)UIControlStateNormal];
    
    [self.view1 addSubview:eliminate2];
    [eliminate2 addTarget:self
                   action:@selector(goToFirstTrailerEliminate:)
         forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    UIButton *gethint = [UIButton buttonWithType:UIButtonTypeCustom];
    gethint.frame = CGRectMake(13, 149, 292, 37);
    
    [gethint setImage:[UIImage imageNamed:@"get_hint_btn@2x.png"] forState:UIControlStateNormal];
    [gethint setImage:[UIImage imageNamed:@"get_hint_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    gethint.tag=0;
    
    //    gethint.enabled=YES;
    //  gethint.userInteractionEnabled=YES;
    [self.view1 addSubview:gethint];
    [gethint addTarget:self action:@selector(goToFirstTrailerHint:) forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    // timer= [[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES] retain];
    
    //   NSString *post =[[NSString alloc] initWithFormat:@"user_id=%d&game_id=%d&q1=%@&q2=%@&q3=%@&q4=%@&q5=%@",1,1,@"question1",@"question2",@"question3",@"question4",@"question5"];
    
    // Do any additional setup after loading the view from its nib.
    
    
    [self slideView:oppImageView withDuration:1 toX:7 andY:48];
    
    [self slideView:meImageView withDuration:1 toX:180 andY:48];
    
    [self slideView:versus withDuration:1 toX:131 andY:52];
    
   
     [theAudio play];
    [timer2 invalidate];
    timer2=nil;
    
    timer2=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer2:) userInfo:nil repeats:YES] ;
    
    
    NSLog(@"time 1 =%@",_time1.text);
    
    }
    else {
        NSLog(@"NoImage");
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Internet" message:@"Your internet speed is too slow. Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag=4;
        [alert show];
        
       // [self performSelector:@selector(viewDidAppear:) withObject:nil afterDelay:3.0];
       // [self viewDidAppear:YES];
    }  
    
    
}

 -(void)count:(id)sender
{
 
 [image123 removeFromSuperview];
 image123=nil;
 image123 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 160, 72, 146)];
 
 if(countd==0)   {
 
 
 [image123 setImage:[UIImage imageNamed:@"3n.png"]]
 ; countd++;}
 else if(countd==1)
 {       
 [image123 setImage:[UIImage imageNamed:@"2n.png"]];
 countd++;
 }
 else if(countd==2)  {
 [image123 setImage:[UIImage imageNamed:@"1n.png"]];
 countd++;}
  
 else if(countd==3)  {
     image123 = [[UIImageView alloc]initWithFrame:CGRectMake(90, 160,150, 146)];
     [image123 setImage:[UIImage imageNamed:@"go.png"]];
     countd++;}
 
 [imageView addSubview:image123];
 [self attachPopUpAnimationToView:image123];
 [self.view addSubviewWithFadeAnimation:image123 duration:1.1 option:UIViewAnimationCurveEaseOut];
 [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.1]];
     
 
 if(countd<4)
 [ self count:nil];
 
 }
 
 
 
 

-(void)goToSecondTrailerHint:(UIButton *)sender
{
    [hintsView removeFromSuperview];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    

    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&image_id=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],imageid2];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/hints.php"];
    
    // NSLog(post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length] ];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
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
    
    NSArray *msg12=[json objectForKey:@"hints"];
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingHints=[json objectForKey:@"remaining_hints"];
    if(remainingHints.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Get Hint' as you have not purchased any hints yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
    if(msg12)
    {
        //  sender.tag=0;
        
        
        if([[msg12 objectAtIndex:sender.tag] isEqualToString:@""])
        {
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
            hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(110,62, 55, 30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
            [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintlabel setTextAlignment:UITextAlignmentCenter];
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:2];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=@"   No More Hints";
            [hint setTextAlignment:UITextAlignmentCenter];
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(80,135,90,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            
            [hintsView addSubview:okbtn];
            
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
            [okbtn addTarget:self
                      action:@selector(hintok)
            forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
            
            
            [self.view addSubview:hintsView];
            
            [self attachPopUpAnimationToView:hintsView];
            
            
            //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"No More Hints"delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            //   [alert show];
            
            
            
        }
        else
        {
            
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
            hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(130,62,55, 30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
            [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintlabel setTextAlignment:UITextAlignmentCenter];
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:4];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=[msg12 objectAtIndex:sender.tag];
            [hint setTextAlignment:UITextAlignmentCenter];
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(110,160,80,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
            
            [self.view addSubview:hintsView];
            [okbtn addTarget:self
                      action:@selector(hintok)
            forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
        
            
            
            [self attachPopUpAnimationToView:hintsView];
            
            //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:[msg12 objectAtIndex:sender.tag] delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            // [alert show];
            sender.tag=sender.tag+1;
        }}
        

    if(error11)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show];
    }
    
    }
    
    
}


-(void)goToFirstTrailer:(id) sender 
{
    //[imageDatao3 writeToFile:pngPatho3 atomically:YES];
     
    NSString *pngPatho4 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.jpg"];
    NSString *imagesURLo4= original_image4;
    NSURL * imageURLo4 = [NSURL URLWithString:imagesURLo4] ;
    // NSData * imageDatao4 = [NSData dataWithContentsOfURL:imageURLo4];
    ASIHTTPRequest *requestImg4 = [ASIHTTPRequest requestWithURL:imageURLo4];
    [requestImg4 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",pngPatho4]]; //use the path from earlier
    
    [requestImg4 setDelegate:self];
    
    [requestImg4 startAsynchronous];
    
    NSString *pngPatho5 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.jpg"];
    NSString *imagesURLo5= original_image5;
    NSURL * imageURLo5 = [NSURL URLWithString:imagesURLo5] ;
    //  NSData * imageDatao5 = [NSData dataWithContentsOfURL:imageURLo5];
    //  UIImage  *imageo5 = [UIImage imageWithData:imageDatao5];
    
    ASIHTTPRequest *requestImg5 = [ASIHTTPRequest requestWithURL:imageURLo5];
    [requestImg5 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",pngPatho5]]; //use the path from earlier
    
    [requestImg5 setDelegate:self];
    
    [requestImg5 startAsynchronous];
    
    
    NSString  *dirPath5= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/12.mp3"];
    NSURL *url5 = [NSURL URLWithString:audio5];
    
    ASIHTTPRequest *request5 = [ASIHTTPRequest requestWithURL:url5];
    
    [request5 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",dirPath5]]; //use the path from earlier
    
    [request5 setDelegate:self];
    
    [request5 startAsynchronous];
    
    
    
    
    
    
    
    [theAudio stop];
    theAudio=nil;
    [hintsView removeFromSuperview];
    NSLog(@"time 1 =%@",_time1.text);
  
    NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/7.jpg"];
    UIImage *image12 = [UIImage imageWithContentsOfFile:getImagePath];
    if(image12)
    {
    
    
    
    NSString *getImagePath6 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/6.jpg"];
    
    UIImage *img6 = [UIImage imageWithContentsOfFile:getImagePath6];
    imageView.image=img6;
    
    str1=[sender currentTitle];

    [self.view addSubviewWithZoomOutAnimation:progbtn1 duration:0 option:curveValues[1]];
    
    
    [self.view addSubviewWithZoomInAnimation:progbtn2 duration:0 option:curveValues[1]];
    [timer2 invalidate];
    timer2=nil;
    [timer invalidate];
    timer=nil;
    
    if([str1 isEqualToString:namecel] )
    {
        coins=coins+(100-([_time1.text doubleValue]*10));

        if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
        {
            
        [audioPlayerCorrect play];
        }
        
              NSString *coins1=[NSString stringWithFormat:@"%d",(int)coins];
        mycoin.text=coins1;
        if([oppcoinslabel.text intValue]>=2000)
        {
            star11.image=[UIImage imageNamed:@"star@2x.png"];
        }
        if([mycoin.text intValue]>=4000)
        {
            star12.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=8000)
        {
            star13.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([oppcoinslabel.text intValue]>=16000)
        {
            star14.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if(
           [oppcoinslabel.text intValue]>=32000)
        {
            star15.image=[UIImage imageNamed:@"star@2x.png"];
            
            
        }
        if([mycoin.text intValue]>=2000)
        {
            starcount2=1;
            star16.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=4000)
        {
            starcount2=2;
            star17.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=8000)
        {
            starcount2=3;
            star18.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=16000)
        {
            starcount2=4;
            star19.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        if([mycoin.text intValue]>=32000)
        {
            starcount2=5;
            star110.image=[UIImage imageNamed:@"star@2x.png"];
            
        }
        
        
        
        
    
    }
    else{
        if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
        {
            
         [audioPlayerWrong play];
        }
    }
    UIButton *button = (UIButton *)[self.view1 viewWithTag:1];
    UIButton *buttonnn1 = (UIButton *)[self.view1 viewWithTag:2];
    UIButton *button2 = (UIButton *)[self.view1 viewWithTag:3];
    UIButton *button3 = (UIButton *)[self.view1 viewWithTag:4];

    button.userInteractionEnabled=NO;

    buttonnn1.userInteractionEnabled=NO; 
    button2.userInteractionEnabled=NO; 
    button3.userInteractionEnabled=NO; 
    
    
        if([str1 isEqualToString:namecel]&& ![_time1.text isEqualToString:@"10.0"])
    {
        
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
        [progbtn1 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
        
        comment = [[UIImageView alloc]initWithFrame:CGRectMake(65,30,170,70)];
        comment.image=[UIImage imageNamed: @"1_green_text.png"];
        [self.view1 addSubview:comment];
        
    }
   else
   {
     if([str1 isEqualToString:namecel])
         [progbtn1 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
     else
         [progbtn1 setBackgroundImage:[UIImage imageNamed:@"wrong_answer@2x.png"] forState:UIControlStateNormal];
       
       
       
       [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       
       [sender setBackgroundImage:[UIImage imageNamed:@"wrong_name_btn@2x.png"] forState:UIControlStateNormal];
       if([[button3 currentTitle] isEqualToString:namecel]){
           
           [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
           

       [button3 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
       
       
       //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
       

       }
       if([[button currentTitle] isEqualToString:namecel]){
           
           [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
           

           [button setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
           
           
           //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
           
        //   [progbtn1 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
           
       }
       if([[buttonnn1 currentTitle] isEqualToString:namecel]){
           
           [buttonnn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
           

           [buttonnn1 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
           
           
           //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
           
         //  [progbtn1 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
           
       }
       if([[button2 currentTitle] isEqualToString:namecel]){
           
           [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
           

           [button2 setBackgroundImage:[UIImage imageNamed:@"win_name_btn@2x.png"] forState:UIControlStateNormal];
           
           
           //   progimg1.image=[UIImage imageNamed:@"wrong_answer@2x.png"];
           
          // [progbtn1 setBackgroundImage:[UIImage imageNamed:@"win_answer@2x.png"] forState:UIControlStateNormal];
           
       }

       

   }

    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
   // [self.view1 removeFromSuperview];
    comment.image=nil;
    //[comment removeFromSuperview];
   
   // [UIView beginAnimations:nil context:nil];
   // [UIView animateWithDuration:1 animations:nil];
  //  comment.image = nil;
   // [UIView commitAnimations];
    

   // NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
   // NSString *documentsDirectory = [paths objectAtIndex:0];
  /*  NSString *getImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/2.jpg"];
    
    UIImage *img = [UIImage imageWithContentsOfFile:getImagePath];
    
    
    imageView.image=img;
  */
    
   // NSURL *url=[NSURL URLWithString:original_image2];
    
  //  NSData *data9 = [NSData dataWithContentsOfURL:url];
       
    
  //  imageView.image =[image12 stackBlur:15];
    

    
   // NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //NSString *documentsDirectory1 = [paths1 objectAtIndex:0];
        
        GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image12];
        
        Gpu = [[GPUImageFastBlurFilter alloc] init];
        [Gpu sizeofblurring:6];
        [stillImageSource addTarget:Gpu];
        [stillImageSource processImage];
        
        UIImage *currentFilteredVideoFrame = [Gpu imageFromCurrentlyProcessedOutput];
        
        GPUImagePicture *stillImageSource1 = [[GPUImagePicture alloc] initWithImage:image12];
        
        Gpu = [[GPUImageFastBlurFilter alloc] init];
        [Gpu sizeofblurring:4];
        [stillImageSource1 addTarget:Gpu];
        [stillImageSource1 processImage];
        
        currentFilteredVideoFrame11 = [Gpu imageFromCurrentlyProcessedOutput];
        GPUImagePicture *stillImageSource2= [[GPUImagePicture alloc] initWithImage:image12];
        
        Gpu = [[GPUImageFastBlurFilter alloc] init];
        [Gpu sizeofblurring:2];
        [stillImageSource2 addTarget:Gpu];
        [stillImageSource2 processImage];
        currentFilteredVideoFrame12 = [Gpu imageFromCurrentlyProcessedOutput];
        // source=image9;
        // imgview.image=currentFilteredVideoFrame;
        imageView.image =currentFilteredVideoFrame;

    NSString *getImagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.mp3"];
    
    
    theAudio =[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath: getImagePath1] error: NULL];
    theAudio.delegate = self;
    [theAudio play];
    

   
    
    [button removeFromSuperview];
   [buttonnn1 removeFromSuperview];
    [button2 removeFromSuperview];
  [button3 removeFromSuperview];
    
    
    
    questionnumber=1;
    [self ShuffelOptions];
    
   
    
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(13,26, 143, 37);
    [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button5 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    [button5.titleLabel setNumberOfLines:2];
    
button5.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button5 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button5.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    

    
    [button5 setTitle:[Temp objectAtIndex:0]
             forState:(UIControlState)UIControlStateNormal];
       
    [self.view1 addSubview:button5];
    button5.tag=5;
    
    [button5 addTarget:self
                action:@selector(goToSecondTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button5.titleLabel.minimumFontSize=12.0;
    button5.titleLabel.adjustsFontSizeToFitWidth=YES;
  //  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];

    
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(160, 26, 143, 37);
        [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    [button6 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    // [button setTitle:@"Selena" 
    //        forState:(UIControlState)UIControlStateNormal];
    // [self.view1 addSubview:button6];
    [button6.titleLabel setNumberOfLines:2];

    [button6 setTitle:[Temp objectAtIndex:1]
             forState:(UIControlState)UIControlStateNormal];
    button6.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button6 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button6.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    


    button6.tag=6;
    [self.view1 addSubview:button6];
    
    
    [button6 addTarget:self
                action:@selector(goToSecondTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button6.titleLabel.minimumFontSize=12.0;
    button6.titleLabel.adjustsFontSizeToFitWidth=YES;
   // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];

    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(13, 66, 143, 37);
    [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button7 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    // [button2 setTitle:@"Paris Hilton" 
    // forState:(UIControlState)UIControlStateNormal];
    button7.tag=7;
    button7.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button7 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button7.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    

    [button7.titleLabel setNumberOfLines:2];
    [button7 setTitle:[Temp objectAtIndex:2]
             forState:(UIControlState)UIControlStateNormal];
    
    
    [self.view1 addSubview:button7];
    [button7 addTarget:self
                action:@selector(goToSecondTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button7.titleLabel.minimumFontSize=12.0;
    button7.titleLabel.adjustsFontSizeToFitWidth=YES;
  //  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];

    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(160, 66, 143, 37);
   [button8 setBackgroundImage:[UIImage imageNamed:@"name_btn@2x.png"] forState:UIControlStateNormal];
    
    [button8 setBackgroundImage:[UIImage imageNamed:@"name_btn_h@2x.png"] forState:UIControlStateHighlighted];
    //[button3 setTitle:@"Angelina" 
    //       forState:(UIControlState)UIControlStateNormal];
    
    button8.tag=8;
    [button8.titleLabel setNumberOfLines:2];
     button8.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
          [button8 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button8.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    
    


    [button8 setTitle:[Temp objectAtIndex:3]
             forState:(UIControlState)UIControlStateNormal];
        [self.view1 addSubview:button8];
    [button8 addTarget:self
                action:@selector(goToSecondTrailer:) 
      forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    button8.titleLabel.minimumFontSize=12.0;
    button8.titleLabel.adjustsFontSizeToFitWidth=YES;
    UIButton *eliminate2 = [UIButton buttonWithType:UIButtonTypeCustom];
    eliminate2.frame = CGRectMake(13, 107, 292, 37);
    //  [eliminate2 setBackgroundImage:[UIImage imageNamed:@"name_eliminate_btn@2x.png"] forState:UIButtonTypeCustom];
    
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn_h@2x.png"] forState:UIControlStateHighlighted];
    
    
    [eliminate2 setBackgroundImage:[UIImage imageNamed:@"eliminate_btn@2x.png"] forState:UIControlStateNormal];
    //  [button3 setTitle:@"Angelina" 
    //       forState:(UIControlState)UIControlStateNormal];
    // [self.view3 addSubview:button3];
    //[eliminate2 setTitle:@"Eliminate Two Options" 
    //          forState:(UIControlState)UIControlStateNormal];
    
    [self.view1 addSubview:eliminate2];
    [eliminate2 addTarget:self
                   action:@selector(goToSecondTrailerEliminate:) 
         forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    
    UIButton *gethint = [UIButton buttonWithType:UIButtonTypeCustom];
    gethint.frame = CGRectMake(13, 149, 292, 37);
    [gethint setImage:[UIImage imageNamed:@"get_hint_btn_h@2x.png"] forState:UIControlStateHighlighted];

    [gethint setImage:[UIImage imageNamed:@"get_hint_btn@2x.png"] forState:UIControlStateNormal];
        gethint.tag=0;
    
    [self.view1 addSubview:gethint];
    [gethint addTarget:self
                action:@selector(goToSecondTrailerHint:)
      forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    
    
    
    
    
    
    // [self.view3 addSubview:button1];
    //[self.view3 addSubview:button2];
    //[self.view3 addSubview:button3];
    //[self.view3 addSubview:button4];
    
    
    
    
    // [self.view addSubview:self.view1];
    
    
    //   [_prog1 setProgress:1.0];
    [UIView transitionWithView:self.view
                      duration:1.0 
                       options:UIViewAnimationOptionTransitionCrossDissolve 
                    animations:^{
                        [self.imageView removeFromSuperview];
                        //  [self.view2 removeFromSuperview];
                        
                        [self.view addSubview:self.imageView];
                        
                        
                    }
                    completion:nil
     ];   
    
    countdown1=1.0;
    countdown=1.0;
    //timer12= [[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onTimer2:) userInfo:nil repeats:YES] retain];
    [timer22 invalidate];
    timer22=nil;
    
    timer22=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer22:) userInfo:nil repeats:YES];
    
      //  countdown1=0.0;
    // countdown=1.0;
    //countdown2=1.0;
    //timer= [[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer3:) userInfo:nil repeats:YES] retain];
    
    NSFileManager *neDir=[[NSFileManager alloc]init];
    
    NSString *getImagePathR = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/6.jpg"];
    NSString *getAudioPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/8.mp3"];
    [neDir removeItemAtPath:getImagePathR error:NULL];
    [neDir removeItemAtPath:getAudioPath error:NULL];
    
    
    }
    else {
        
            NSLog(@"NoImage");
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Internet" message:@"Connection Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            alert.tag=4;
            [alert show];
            

    }
    
    
    // self.view3.backgroundColor = [UIColor redColor];
   
    
}
-(void)hintok
{
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    [hintsView removeFromSuperview];
}

-(void)goToFirstTrailerHint:(UIButton *)sender
{
    [hintsView removeFromSuperview];
    
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    
    

    
    //  [sender setImage:[UIImage imageNamed:@"get_hint_btn_h@2x.png"] forState:UIControlStateHighlighted];
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@&image_id=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],imageid1];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/hints.php"];
    
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
    
    NSArray *msg12=[json objectForKey:@"hints"];
    NSLog(@"%@",msg12);
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingHints=[json objectForKey:@"remaining_hints"];
    if(remainingHints.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Get Hint' as you have not purchased any hints yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
    
    if(msg12)
    {
      //  sender.tag=0;


        if([[msg12 objectAtIndex:sender.tag] isEqualToString:@""])
        {
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
            hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(110,62,55,30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
            [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintlabel setTextAlignment:UITextAlignmentCenter];
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:2];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=@"   No More Hints";
            [hint setTextAlignment:UITextAlignmentCenter];
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(100,135,90,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            
            [hintsView addSubview:okbtn];
            
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
            [okbtn addTarget:self
                      action:@selector(hintok)
            forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
            
            
                       [self.view addSubview:hintsView];
            
            [self attachPopUpAnimationToView:hintsView];
            

            //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"No More Hints"delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
         //   [alert show];


            
        }
        else
        {
         
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            imgview.image=[UIImage imageNamed:@"hint_bg@2x2.png"];
        hintsView=[[UIView alloc] initWithFrame:CGRectMake(24,52,237,190)];
            [hintsView addSubview:imgview];
            UILabel *hintlabel = [[UILabel alloc]initWithFrame:CGRectMake(130,62,55,30)];
            [hintlabel setBackgroundColor:[UIColor clearColor]];
            [hintlabel setTextColor:[UIColor whiteColor]];
            [hintlabel setNumberOfLines:2];
              [hintlabel setFont:[UIFont boldSystemFontOfSize:16]];
            hintlabel.text=@"Hint";
            [hintsView addSubview:hintlabel];
            UILabel *hint = [[UILabel alloc]initWithFrame:CGRectMake(40,80,200,60)];
            [hint setBackgroundColor:[UIColor clearColor]];
            [hint setTextColor:[UIColor whiteColor]];
            [hint setNumberOfLines:4];
            [hint setFont:[UIFont boldSystemFontOfSize:14]];
            hint.text=[msg12 objectAtIndex:sender.tag];
            [hintsView addSubview:hint];
            
            
            UIButton *okbtn= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
            okbtn.frame = CGRectMake(110,160,80,30);
            [okbtn setBackgroundImage:[UIImage imageNamed:@"ok_btn@2x.png"]  forState:UIControlStateNormal];
            [hintsView addSubview:okbtn];
         
            [self.view addSubview:hintsView];
            [okbtn addTarget:self
                        action:@selector(hintok)
              forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];

            
            [self attachPopUpAnimationToView:hintsView];
            
        //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:[msg12 objectAtIndex:sender.tag] delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
       // [alert show];
            sender.tag=sender.tag+1;
        }
        
        
    }
    
    if(error11)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show];
    }
    
    } 
    
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

-(void)goToFirstTrailerEliminate:(id)sender
{
    UIButton *button=sender;
    button.enabled=NO;

    [hintsView removeFromSuperview];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    //  [sender setImage:[UIImage imageNamed:@"get_hint_btn_h@2x.png"] forState:UIControlStateHighlighted];
    NSString *post =[[NSString alloc] initWithFormat:@"access_token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/bombs.php"];
    
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
    NSString *error11=[json objectForKey:@"error"];
    NSString *remainingBombs=[json objectForKey:@"remaining_bombs"];
    NSLog(@"remaining_bombs=%@",remainingBombs);
    
    if(remainingBombs.intValue==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can not use 'Eliminate two options', as you have not purchased any eliminations yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        
    
    
    
    int count=0;
    
    
    UIButton *buttona = (UIButton *)[self.view1 viewWithTag:1];
 //   [button removeFromSuperview];
    UIButton *buttonb = (UIButton *)[self.view1 viewWithTag:2];
    
    
    UIButton *buttonc = (UIButton *)[self.view1 viewWithTag:3];

    UIButton *buttond = (UIButton *)[self.view1 viewWithTag:4];
    
   
    if([buttona currentTitle] != namecel && count!=2)
    {
        [buttona removeFromSuperview];
        count=count+1;
    }
    
    
    
    if([buttonb currentTitle] != namecel  && count!=2)
    {
        [buttonb removeFromSuperview];
        count=count+1;
    }
    
    if([buttonc currentTitle] != namecel  && count!=2)
    {
        [buttonc removeFromSuperview];
        count=count+1;
    }
    
    if([buttond currentTitle] != namecel  && count!=2)
    {
        [buttond removeFromSuperview];
        count=count+1;
    }
    
    
        if(error11)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:error11 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
            [alert show];
        }
        
        
    }   
    
    
    
    
}




- (void)viewDidLoad
{
    
    
    
    
    
    [super viewDidLoad];
    [_time1 removeFromSuperview];
    [_time2 removeFromSuperview];
    [_time3 removeFromSuperview];
    [_time4 removeFromSuperview];
    [_time5 removeFromSuperview];
 [progbtn1 removeFromSuperview];

    [progbtn2 removeFromSuperview];
    [progbtn3 removeFromSuperview];
    [progbtn4 removeFromSuperview];
    [progbtn5 removeFromSuperview];
    [timebackground removeFromSuperview];
    [celebimagebox removeFromSuperview];
   
}

- (IBAction)flipToView
{
//ViewController *vc = [[AnotherViewController alloc] init...];
 //   MyAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
   // [appDelegate.transitionController transitionToViewController:vc withOptions:UIViewAnimationOptionTransitionFlipFromRight];
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
 
 -(void)ShuffelOptions{
 
 AllOptions=nil;
 
 Temp =nil;
 
 if(questionnumber==0) AllOptions =[[NSMutableArray alloc]initWithObjects:option1,option2,option3,option4, nil];
 
 else if(questionnumber==1) AllOptions =[[NSMutableArray alloc]initWithObjects:option21,option22,option23,option24, nil];
 
 else if(questionnumber==2) AllOptions =[[NSMutableArray alloc]initWithObjects:option21c,option22c,option23c,option24c, nil];
 
 else if(questionnumber==3) AllOptions =[[NSMutableArray alloc]initWithObjects:option41,option42,option43,option44, nil];
 
 else if(questionnumber==4) AllOptions =[[NSMutableArray alloc]initWithObjects:option51,option52,option53,option54, nil];
 
 Temp=[[NSMutableArray alloc]init];
 
 
 
 NSLog(@"all Options%@",AllOptions);
 
 NSString * TempString;
 
 while (AllOptions.count>0) {
 
 TempString=[AllOptions objectAtIndex:arc4random() %  [AllOptions count] ];
 
 [ Temp addObject: TempString ];
 
 [AllOptions removeObject:TempString];
 
 }
 
 
 
 NSLog(@"Temp=%@",Temp);
 
 }
 
 
 
 

- (void)viewDidUnload
{
    [self setName:nil];
    [self setMe:nil];
    [self setProgimg1:nil];
    [self setProgbtn1:nil];
    [self setProgbtn2:nil];
    [self setProgbtn3:nil];
    [self setProgbtn4:nil];
    [self setProgbtn5:nil];
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
    [self setUsercoinslabel:nil];
    [self setTimebackground:nil];
    [self setCelebimagebox:nil];
   // meImage=nil;
  //  comment=nil;
   //hintsView=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)dealloc {
    //[celebimagebox release];
  //  [timebackground release];
   // [_prog1 release];
    //[_prog2 release];
    //[_prog3 release];
    //[_prog4 release];
    //[_prog5 release];
    //[_usernameimageviewleft release];
    //[_usernameimageviewright release];
    //[playr release];
 /*   [timer release];
    [_name release];
    [_me release];
    [audio release];
    [pixelated_image release];
    [namecel release];
    [progimg1 release];
    [progbtn1 release];
    [progbtn2 release];
    [progbtn3 release];
    [progbtn4 release];
    [progbtn5 release];
    [star1 release];
    [star2 release];
    [star3 release];
    [star4 release];
    [star5 release];
    [star6 release];
    [star7 release];
    [star8 release];
    [star9 release];
    [star10 release];
    [oppcoinslabel release];
    [usercoinslabel release];
  
    [super dealloc];
  */
  
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex 
{
   if(buttonIndex==0&&alertView.tag==4)
   {
       [self.navigationController popViewControllerAnimated:YES];
   }
       
    
}



- (IBAction)back1:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
    [theAudio stop];
}
@end
