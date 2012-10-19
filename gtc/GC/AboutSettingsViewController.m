//
//  AboutSettingsViewController.m
//  GTC
//
//  Created by Mac 23 on 06/09/12.
//
//

#import "AboutSettingsViewController.h"

@interface AboutSettingsViewController ()

@end
UIView *tnsView;
@implementation AboutSettingsViewController
@synthesize aboutusimgview;
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
    [self setAboutusimgview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)Back:(id)sender {
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
    
}

- (IBAction)terms:(id)sender 
{
    [tnsView removeFromSuperview];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    UIImageView *tnsimgview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,306,325)];
    tnsimgview.image=[UIImage imageNamed:@"terms-n-services.png"];
    
    tnsView = [[UIView alloc] initWithFrame:CGRectMake(8,55,306,325)];
    [tnsView addSubview:tnsimgview];
    UIButton *cancel= [UIButton buttonWithType:UIButtonTypeCustom] ;
    cancel.frame = CGRectMake(280,4,20,23);
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1@2x.png"]  forState:UIControlStateNormal];
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn1_active@2x.png"]  forState:UIControlStateHighlighted];
    [tnsView addSubview:cancel];
    [cancel addTarget:self
               action:@selector(canceltermsnservicesclicked)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    
    [self attachPopUpAnimationToView:tnsView];
    [self.view addSubview:tnsView];
    
}
-(void)canceltermsnservicesclicked
{
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
       // [audioPlayer play];
    }
    
    
    [tnsView removeFromSuperview];
}
- (IBAction)policy_btn:(id)sender 
{
    [tnsView removeFromSuperview];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    UIImageView *tnsimgview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,306,325)];
    tnsimgview.image=[UIImage imageNamed:@"policy-1.png"];
    
    tnsView = [[UIView alloc] initWithFrame:CGRectMake(8,55,306,325)];
    [tnsView addSubview:tnsimgview];
    UIButton *cancel= [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    cancel.frame = CGRectMake(280,4,20,23);
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn.png"]  forState:UIControlStateNormal];
    [cancel setBackgroundImage:[UIImage imageNamed:@"close_btn_active.png"]  forState:UIControlStateHighlighted];
    [tnsView addSubview:cancel];
    [cancel addTarget:self
               action:@selector(canceltermsnservicesclicked)
     forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    
    [self attachPopUpAnimationToView:tnsView];
    [self.view addSubview:tnsView];
    

}

- (IBAction)close_btn:(id)sender {
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
    [sender removeFromSuperview];
    [aboutusimgview removeFromSuperview];
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



- (void)dealloc {
    [aboutusimgview release];
   // [super dealloc];
}
- (IBAction)backbtn:(id)sender {
   // [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    
  [self.navigationController popViewControllerAnimated:YES];   

}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    [self viewDidUnload];
    // Release any cached data, images, etc that aren't in use.
}
@end
