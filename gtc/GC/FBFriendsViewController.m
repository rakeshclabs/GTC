       //
//  FBFriendsViewController.m
//  WordDraw
//
//  Created by Chirag Sharma on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FBFriendsViewController.h"
#import <QuartzCore/QuartzCore.h>
//#import "ChooseViewController.h"
#import "FacebookManager.h"
#import "ASIFormDataRequest.h"
#import "NewGameUserNameViewController.h"
#import "SVProgressHUD.h"
@interface FBFriendsViewController ()

@end

@implementation FBFriendsViewController
@synthesize myTable;
@synthesize fbRegFriends, fbNotRegFriends;
@synthesize pixelated_image,namecel,audio,option1,option4,option2,option3,pixelated_image2,name2,option21,option23,option24,option22,audio2,option21c,option22c,option23c,option24c,namec,pixelated_imagec,audioc,option41,option42,option43,option44,pixelated_image4,audio4,name4,option51,option52,option53,option54,audio5,pixelated_image5,name5,access_token,opponent_name,opponent_image,game_id,us1_image,imageid1,imageid4,imageid5,imageid2,imageid3,original_image1,original_image2,original_image3,original_image4,original_image5;

NSString *us_image;
UIImageView *meImage;

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
  //Mltimedia_button_click.mp3
 /*   NSString *path = [[NSBundle mainBundle] pathForResource:@"click2" ofType:@"mp3"];
    NSLog(@"path: %@",path);
    theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    theAudio.delegate = self;
    theAudio.volume =1.0;
    [theAudio prepareToPlay];
      [theAudio play];
   */ 
    myTable.delegate = self;
    myTable.dataSource = self;
    arrayForPictures1 = [[NSMutableArray alloc]init];
    arrayForPictures2 = [[NSMutableArray alloc]init];
    NSLog(@"fb :%@", fbNotRegFriends);
    
    [FacebookManager facebookConnect].Delegate=self;
        NSSortDescriptor *lastDescriptor =[[NSSortDescriptor alloc] initWithKey:@"name"
                                ascending:YES
                                 selector:@selector(localizedCaseInsensitiveCompare:)];
    NSArray *descriptors = [NSArray arrayWithObjects:lastDescriptor, nil];
    if(!(fbNotRegFriends ==(id)[NSNull null]))
    {
       
       fbNotRegFriends=[fbNotRegFriends sortedArrayUsingDescriptors:descriptors];
    }
        fbRegFriends=[fbRegFriends sortedArrayUsingDescriptors:descriptors];
   	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];

    [self setMyTable:nil];

    friendName = nil;
        // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0) {
        return [fbRegFriends count];
    }
    else {
        
        if(fbNotRegFriends ==(id)[NSNull null]) {
            return 0;
        }
        else {
            return [fbNotRegFriends count];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return @"Choose Opponent";
    }
    else {
        return @"Invite Friends";
    }
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    else {
        AsyncImageView* oldImage = (AsyncImageView*)
        [cell.contentView viewWithTag:999];
        [oldImage removeFromSuperview];
    }
   /* cellLabel = nil;
    cellLabel = [[UILabel alloc]initWithFrame:CGRectMake(78, 17, 68, 25)];
    [cellLabel setFont:[UIFont boldSystemFontOfSize:20]];
    cellLabel.text = @"";
    [cell addSubview:cellLabel];
    */
    
    if(indexPath.section==0) {
        NSLog(@"%@",fbRegFriends);
        cell.textLabel.text = [NSString stringWithFormat:@"            %@", [[fbRegFriends objectAtIndex:indexPath.row] objectForKey:@"name"]];
        asyncImageView = [[AsyncImageView alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];
        [asyncImageView setTag:999];
        //NSURL *url = [image
        if([arrayForPictures1 count] >=indexPath.row+1) {
            asyncImageView = [arrayForPictures1 objectAtIndex:indexPath.row];
        }
        else {
            NSLog(@"else");
            [asyncImageView loadImageFromURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", [[fbRegFriends objectAtIndex:indexPath.row] objectForKey:@"id"]]]];
            [arrayForPictures1 addObject:asyncImageView];
        }
    }
    else {
        cell.textLabel.text = [NSString stringWithFormat:@"            %@",[[fbNotRegFriends  objectAtIndex:indexPath.row] objectForKey:@"name"]];
        asyncImageView = [[AsyncImageView alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];
        [asyncImageView setTag:999];
       
        if([arrayForPictures2 count] >=indexPath.row+1) {
          //  NSLog(@"[arrayForPictures1 count] >=indexPath.row+1=%@  %@  %@",arrayForPictures1.count,indexPath.row,arrayForPictures2)
            asyncImageView = [arrayForPictures2 objectAtIndex:indexPath.row];
        }
        else {
            NSLog(@"else2");
            [asyncImageView loadImageFromURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", [[fbNotRegFriends objectAtIndex:indexPath.row] objectForKey:@"id"]]]];
            [arrayForPictures2 addObject:asyncImageView];
        }
        
    } 
    [cellLabel sizeToFit];
    [cell.contentView addSubview:asyncImageView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self showActivityIndicater];
    if([@"ON" isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"sound"]]) {
        //[theAudio play];
    }
    NSLog(@"indexpath=%d",indexPath.row);
    if(indexPath.section==0) {
        
        [[FacebookManager facebookConnect]Post_To_Friend_Wall_WithMsg:@"You have been challenged on 'Guess That Celebrity' . Play it" Friend_FBID:[[fbRegFriends objectAtIndex:indexPath.row] objectForKey:@"id"] WithLink:nil];
        
        [self PostForUsernameOrEmail:[[fbRegFriends objectAtIndex:indexPath.row] objectForKey:@"id"]];
    }
    else {
        
        face=TRUE;
        [[FacebookManager facebookConnect]Post_To_Friend_Wall_WithMsg:@"Hello I am playing 'Guess That Celibrity ' . It's an awesome game . Try it" Friend_FBID:[[fbNotRegFriends objectAtIndex:indexPath.row] objectForKey:@"id"] WithLink:nil];
       // [self hideActivityIndicater];

        
      
    }
 
    
    [tableView  reloadData];
   // [self hideActivityIndicater];
}
-(void)FB_Post_To_Wall_Successfully
{
    
}

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
    
    
    if(![meImage isAnimating]) {
        NSLog(@"no");
        meImage.animationDuration=1;
        [meImage startAnimating];
    }
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    
    
    
}
-(void)hideActivityIndicater
{
    //[SVProgressHUD dismiss];
    [meImage stopAnimating];
    [meImage removeFromSuperview];

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
    [self hideActivityIndicater];
    if(face)
    {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Successfully posted on the wall" delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles:nil];
    [alert show];
        face=false;
    
    }
}
- (void)settingsItemChoosen:(id)sender
{
    if([@"ON" isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"sound"]]) {
       // [theAudio play];
    }
    UIButton *button = (UIButton *)sender;
    if(button.tag==5001) {
        [self performSegueWithIdentifier:@"mainMenu" sender:nil];
    }
    else if(button.tag==5002) {
        
    }
    else if(button.tag==5003) {
        [self performSegueWithIdentifier:@"settings" sender:nil];
    }
    else if(button.tag==5004) {
        
    }
    else if(button.tag==5005) {
        if ([MFMailComposeViewController canSendMail])
        {
            MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
            
            mailer.mailComposeDelegate = self;
            
            [mailer setSubject:@"Feedback about WordPlay"];
            
            NSArray *toRecipients = [NSArray arrayWithObjects:@"chinmay@click-labs.com", @"vivek.k@click-labs.com", nil];
            [mailer setToRecipients:toRecipients];
            
            UIImage *myImage = [UIImage imageNamed:@"icon57.png"];
            NSData *imageData = UIImagePNGRepresentation(myImage);
            [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"icon57"]; 
            
            NSString *emailBody = @"";
            [mailer setMessageBody:emailBody isHTML:NO];
            
            [self presentModalViewController:mailer animated:YES];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                            message:@"Your device doesn't support the composer sheet"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }

    }
    else if(button.tag==5006) {
        [settingsView removeFromSuperview];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissModalViewControllerAnimated:YES];
}


- (IBAction)settingsPressed:(id)sender {
   
    if([@"ON" isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"sound"]]) {
       // [theAudio play];
    }
    settingsView = [[UIImageView alloc]initWithFrame:self.view.frame];
    settingsView.image = [UIImage imageNamed:@"settings.png"];
    [settingsView setUserInteractionEnabled:YES];
    UIButton *button1 = [[UIButton alloc]init];
    button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    //[button4 setAlpha:0.6];
    // [button1 setTitle:@"5" forState:UIControlStateNormal];
    button1.frame = CGRectMake(20, 133, 280, 51);
    [button1 addTarget:self action:@selector(settingsItemChoosen:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setShowsTouchWhenHighlighted:YES];
    button1.tag = 5001;
    button1.enabled = YES;
    button1.userInteractionEnabled = YES;
    [settingsView addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc]init];
    button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(20, button1.frame.origin.y+button1.frame.size.height, 280, 51);
    [button2 addTarget:self action:@selector(settingsItemChoosen:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setShowsTouchWhenHighlighted:YES];
    button2.tag = 5002;
    button1.enabled = YES;
    button2.userInteractionEnabled = YES;
    [settingsView addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc]init];
    button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(20, button2.frame.origin.y+button2.frame.size.height, 280, 51);
    [button3 addTarget:self action:@selector(settingsItemChoosen:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setShowsTouchWhenHighlighted:YES];
    button3.tag = 5003;
    button3.enabled = YES;
    button3.userInteractionEnabled = YES;
    [settingsView addSubview:button3];
    
    UIButton *button4 = [[UIButton alloc]init];
    button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(20, button3.frame.origin.y+button3.frame.size.height, 280, 51);
    [button4 addTarget:self action:@selector(settingsItemChoosen:) forControlEvents:UIControlEventTouchUpInside];
    [button4 setShowsTouchWhenHighlighted:YES];
    button4.tag = 5004;
    button4.enabled = YES;
    button4.userInteractionEnabled = YES;
    [settingsView addSubview:button4];
    
    UIButton *button5 = [[UIButton alloc]init];
    button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(20, button4.frame.origin.y+button4.frame.size.height, 280, 51);
    [button5 addTarget:self action:@selector(settingsItemChoosen:) forControlEvents:UIControlEventTouchUpInside];
    [button5 setShowsTouchWhenHighlighted:YES];
    button5.tag = 5005;
    button5.enabled = YES;
    button5.userInteractionEnabled = YES;
    [settingsView addSubview:button5];
    
    UIButton *button6 = [[UIButton alloc]init];
    button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(251, 93, 36, 34);
    [button6 addTarget:self action:@selector(settingsItemChoosen:) forControlEvents:UIControlEventTouchUpInside];
    [button6 setShowsTouchWhenHighlighted:YES];
    button6.tag = 5006;
    button6.enabled = YES;
    button6.userInteractionEnabled = YES;
    [settingsView addSubview:button6];
    
    soundSlider = [[UISwitch alloc]initWithFrame:CGRectMake(208, 200, 10, 10)];
    [soundSlider setOnTintColor:[UIColor colorWithRed:247.0/255.0 green:135.0/255.0 blue:28.0/255.0 alpha:1.0]];
    [soundSlider addTarget:self action:@selector(switchPressed) forControlEvents:UIControlEventValueChanged];
    if([@"ON" isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"sound"]]) {
        [soundSlider setOn:YES];
    }
    else {
        [soundSlider setOn:NO];
    }
    [soundSlider setUserInteractionEnabled:YES];
    [soundSlider setEnabled:YES];
    [soundSlider setHidden:NO];
    [settingsView addSubview:soundSlider];
    
    [self.view addSubview:settingsView];
    [self attachPopUpAnimationToView:settingsView];
}

- (void)switchPressed
{
    if([@"ON" isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"sound"]]) {
        [soundSlider setOn:NO];
        [[NSUserDefaults standardUserDefaults] setObject:@"OFF" forKey:@"sound"];
    }
    else {
        [soundSlider setOn:YES];
        [[NSUserDefaults standardUserDefaults] setObject:@"ON" forKey:@"sound"];
     //   [theAudio play];
    }
}
-(void)FB_Logged_In_Successfully{
    
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

-(void)SaveData
{
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
    //[imageDatao3 writeToFile:pngPatho3 atomically:YES];
    NSString *pngPatho4 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/9.jpg"];
    NSString *imagesURLo4= original_image4;
    NSURL * imageURLo4 = [NSURL URLWithString:imagesURLo4] ;
    // NSData * imageDatao4 = [NSData dataWithContentsOfURL:imageURLo4];
    ASIHTTPRequest *requestImg4 = [ASIHTTPRequest requestWithURL:imageURLo4];
    [requestImg4 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",pngPatho4]]; //use the path from earlier
    
    [requestImg4 setDelegate:self];
    
    [requestImg4 startAsynchronous];
    //UIImage  *imageo4 = [UIImage imageWithData:imageDatao4];
    // [imageDatao4 writeToFile:pngPatho4 atomically:YES];
    NSString *pngPatho5 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.jpg"];
    NSString *imagesURLo5= original_image5;
    NSURL * imageURLo5 = [NSURL URLWithString:imagesURLo5] ;
    //  NSData * imageDatao5 = [NSData dataWithContentsOfURL:imageURLo5];
    //  UIImage  *imageo5 = [UIImage imageWithData:imageDatao5];
    
    ASIHTTPRequest *requestImg5 = [ASIHTTPRequest requestWithURL:imageURLo5];
    [requestImg5 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",pngPatho5]]; //use the path from earlier
    
    [requestImg5 setDelegate:self];
    
    [requestImg5 startAsynchronous];
    
    // [imageDatao5 writeToFile:pngPatho5 atomically:YES];
    
    
    
    
    
    
    
    
    NSString *dirPath2= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/10.mp3"];
    NSURL *url2 = [NSURL URLWithString:audioc];
    
    ASIHTTPRequest *request2 = [ASIHTTPRequest requestWithURL:url2];
    
    [request2 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",dirPath2]]; //use the path from earlier
    
    [request2 setDelegate:self];
    
    [request2 startAsynchronous];
    
    
    
    NSString  *dirPath4= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/11.mp3"];
    NSURL *url4 = [NSURL URLWithString:audio4];
    
    ASIHTTPRequest *request4 = [ASIHTTPRequest requestWithURL:url4];
    
    [request4 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",dirPath4]]; //use the path from earlier
    
    [request4 setDelegate:self];
    
    [request4 startAsynchronous];
    NSString  *dirPath5= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/12.mp3"];
    NSURL *url5 = [NSURL URLWithString:audio5];
    
    ASIHTTPRequest *request5 = [ASIHTTPRequest requestWithURL:url5];
    
    [request5 setDownloadDestinationPath:[NSString stringWithFormat:@"%@",dirPath5]]; //use the path from earlier
    
    [request5 setDelegate:self];
    
    [request5 startAsynchronous];
    
    
}





- (void)PostForUsernameOrEmail:(NSString *)fbid
{
    
   // [[FacebookManager facebookConnect]Post_To_Friend_Wall_WithMsg:@"Hello I am playing GTC . It's an awesome game . Try it" Friend_FBID:fbid WithLink:nil];
    
      NSString *post =[NSString stringWithFormat:@"random=0&access_token=%@&fbid=%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"], fbid];
    
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    
    [request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/test_create_game.php"]];
    
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
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
       NSLog(@"%@",json);
        if([json objectForKey:@"error"]) {
            UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"" message:[json valueForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [a show];
        }
        else if([json objectForKey:@"already"])
        {
           
            NSString *msg12=[json valueForKey:@"already"];
            
            
            if(msg12)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:msg12 delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
                [alert show];
            }
            [self hideActivityIndicater];
        }
        
        else if([json objectForKey:@"first_celeb"]) 
        
        {
       
            
            opponent_name=[json objectForKey:@"opponent_name"];   
            NSLog(@"%@",opponent_name);
            
            
            opponent_image=[json valueForKey:@"opponent_image"];   
            NSLog(@"%@",opponent_image);
            
        us1_image=[json objectForKey:@"user_image"];
            NSDictionary *info1 = [json objectForKey:@"first_celeb"];
           
            audio=[info1 objectForKey:@"audio"];
            NSLog(@"value is %@", audio);
            namecel=[info1 objectForKey:@"name"];
            NSLog(@"value is %@",namecel);
            pixelated_image=[info1 objectForKey:@"pixelated_image"];
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
            
            pixelated_image2=[info2 objectForKey:@"pixelated_image"];
            original_image2=[info2 objectForKey:@"original_image"];
            NSArray *options2=[info2 objectForKey:@"options"];
            option21=[options2 objectAtIndex:0];
            option22=[options2 objectAtIndex:1];
            option23=[options2 objectAtIndex:2];
            option24=[options2 objectAtIndex:3];
            imageid2=[info2 objectForKey:@"id"];

            
            
            
            
            
            NSDictionary *info3 = [json objectForKey:@"third_celeb"];
            audioc=[info3 objectForKey:@"audio"];
            
            namec=[info3 objectForKey:@"name"];
            
            pixelated_imagec=[info3 objectForKey:@"pixelated_image"];
             original_image3=[info3 objectForKey:@"original_image"];
            NSArray *options3=[info3 objectForKey:@"options"];
            option21c=[options3 objectAtIndex:0];
            option22c=[options3 objectAtIndex:1];
            option23c=[options3 objectAtIndex:2];
            option24c=[options3 objectAtIndex:3];
            
            imageid3=[info3 objectForKey:@"id"];

            
            
            
            NSDictionary *info4 = [json objectForKey:@"fourth_celeb"];
            audio4=[info4 objectForKey:@"audio"];
            
            name4=[info4 objectForKey:@"name"];
            
            pixelated_image4=[info4 objectForKey:@"pixelated_image"];
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
            
            pixelated_image5=[info5 objectForKey:@"pixelated_image"];
             original_image5=[info5 objectForKey:@"original_image"];
            NSArray *options5=[info5 objectForKey:@"options"];
            option51=[options5 objectAtIndex:0];
            option52=[options5 objectAtIndex:1];
            option53=[options5 objectAtIndex:2];
            option54=[options5 objectAtIndex:3];
            
            imageid5=[info5 objectForKey:@"id"];

            
            game_id=[json valueForKey:@"game_id"];
        
            
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
            
            
            
            [self SaveData];
            
            [self performSelector:@selector(callSegue) withObject:nil afterDelay:3.0];

           // [self performSegueWithIdentifier:@"fbGame" sender:nil]; 
            
            
    
        }
    }
    else {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"" message:@"no internet connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [a show];
    }
}




-(void)callSegue
{
    
    [self performSegueWithIdentifier:@"fbGame" sender:nil];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self hideActivityIndicater];
    if([[segue identifier] isEqualToString:@"fbGame"]) {
        [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"count"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        NewGameUserNameViewController  *vc= (NewGameUserNameViewController *)[segue destinationViewController];
        vc.audio=audio;
        
        vc.pixelated_image=pixelated_image;
        vc.namecel=namecel;
        vc.option1=option1;
        vc.option2=option2;
        vc.option3=option3;
        vc.option4=option4;
        vc.name2=name2;
        vc.pixelated_image2=pixelated_image2;
        vc.audio2=audio2;
        vc.option21=option21;
        vc.option22=option22;
        vc.option23=option23;
        vc.option24=option24;
        
        vc.namec=namec;
        vc.pixelated_imagec=pixelated_imagec;
        vc.audioc=audioc;
        vc.option21c=option21c;
        vc.option22c=option22c;
        vc.option23c=option23c;
        vc.option24c=option24c;
        
        
        
        vc.name4=name4;
        vc.pixelated_image4=pixelated_image4;
        vc.audio4=audio4;
        vc.option41=option41;
        vc.option42=option42;
        vc.option43=option43;
        vc.option44=option44;
        
        
        vc.name5=name5;
        vc.pixelated_image5=pixelated_image5;
        vc.audio5=audio5;
        vc.option51=option51;
        vc.option52=option52;
        vc.option53=option53;
        vc.option54=option54;
        vc.access_token=access_token;
        vc.opponent_name=opponent_name;
        vc.opponent_image=opponent_image;
        vc.us_image=us1_image;
        vc.game_id=game_id;
        
        vc.imageid1=imageid1;
        vc.imageid2=imageid2;
        vc.imageid3=imageid3;
        vc.imageid4=imageid4;
        vc.imageid5=imageid5;
        vc.original_image1=original_image1;
        vc.original_image2=original_image2;
        vc.original_image3=original_image3;
        vc.original_image4=original_image4;
        vc.original_image5=original_image5;
        
       }
}

- (void)okClicked:(id)sender
{
    if([@"ON" isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"sound"]]) {
      //  [theAudio play];
    }
    UIButton *button = (UIButton *)sender;
    if(button.tag==3002) {
        [unableToCreate removeFromSuperview];
    }
    
    
    [self performSegueWithIdentifier:@"Game1" sender:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    [self viewDidUnload];
    // Release any cached data, images, etc that aren't in use.
}
@end
