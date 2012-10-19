//
//  AccountSettingsViewController.m
//  GTC
//
//  Created by Mac 23 on 06/09/12.
//
//

#import "AccountSettingsViewController.h"
#import "FBFriendsViewController.h"
#define kOFFSET_FOR_KEYBOARD 101.0

@interface AccountSettingsViewController ()

@end

@implementation AccountSettingsViewController
@synthesize username;
@synthesize password;
@synthesize newpassword;
@synthesize retypepassword;
@synthesize logout,user;
AVAudioPlayer *audioPlayer;
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
    status=[[NSUserDefaults standardUserDefaults]valueForKey:@"login"];
    if([status isEqualToString:@"fb"])
    {
        
        username.enabled=NO;
        saveButton.enabled=NO;
        password.enabled=NO;
        
    }
    else if([status isEqualToString:@"email"])
    {
        username.text=user;
        password.enabled=YES;
    
    }
        
        newpassword.enabled=NO;
        retypepassword.enabled=NO;
        password.secureTextEntry=YES;
    newpassword.secureTextEntry=YES;
    retypepassword.secureTextEntry=YES;
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

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [logout release];
    [username release];
    [password release];
    [newpassword release];
    [retypepassword release];

    [self setLogout:nil];
    [self setUsername:nil];
    [self setPassword:nil];
    [self setNewpassword:nil];
    [self setRetypepassword:nil];
    saveButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)backbutton:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    
   // [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    
 [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)saveandclose:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    if([newpassword.text isEqualToString:retypepassword.text])
    {
    NSString*  post =[NSString stringWithFormat:@"access_token=%@&username=%@&pass=%@&newpass=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ],username.text,password.text,newpassword.text];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    
    [request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/reset_password.php"]];
    
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
     
        NSLog(@"Pass response =%@",json1);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Password Updated" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];

        
    }
    else {
        NSString *output = [error description];
        NSLog(@"\n\n Error to get json=%@",output);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Unable to connect to server" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
    }

  else
  {
      UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Passwords are not matching. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
      [alert show];
      newpassword.text=@"";
      retypepassword.text=@"";
  }
    
}
- (void)dealloc {
    
       
}
- (IBAction)logout:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
   
    
   [[FacebookManager facebookConnect]FB_LogOut];

   [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"access_token"];
[[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"fbid"];
[[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"fbuname"];
    //[[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"device_token"]; 
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"FBAccessTokenKey"];
   [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:0] animated:YES];
    
   
    
    
}

-(IBAction)hideKeyboard:(id)sender
{
    NSLog(@"hello");
    if(![username.text isEqualToString:@""])
    {
        password.enabled=YES;
        if(![password.text isEqualToString:@""])
        {
            newpassword.enabled=YES;
            retypepassword.enabled=YES;
        }
        else
        {
            newpassword.enabled=NO;
            retypepassword.enabled=NO;
        }
    }
    else {
        password.enabled=NO;
    }
    
    [username resignFirstResponder];
    [password resignFirstResponder];
    [newpassword resignFirstResponder];
    [retypepassword resignFirstResponder];
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
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    [self viewDidUnload];
    // Release any cached data, images, etc that aren't in use.
}

@end
