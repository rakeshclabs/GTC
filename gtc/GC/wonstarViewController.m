//
//  wonstarViewController.m
//  GTC
//
//  Created by Mac 23 on 18/09/12.
//
//

#import "wonstarViewController.h"

@interface wonstarViewController ()

@end

@implementation wonstarViewController
UIImageView *ImageView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
  //  [self slideView:ImageView withDuration:2 toX:65 andY:158];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
}





// Do any additional setup after loading the view.

-(void)doubleTap:(UIGestureRecognizer *)gesture {
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *gestureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    
    [self.view addGestureRecognizer:gestureTap];
    
    gestureTap.delegate = self;
    
    gestureTap.numberOfTapsRequired = 1;
    ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 320, 480)];
    
   // [ImageView setImage:[UIImage imageNamed:@"LargeSizeStarSmall.png"]];
    [self.view addSubview:ImageView];
    
    NSURL *url20 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"fireworks_multiple_explosions_with_fizz_003"ofType:@"mp3"]];
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

    
    ImageView.animationImages = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"star15.png"],[UIImage imageNamed:@"star14.png"], [UIImage imageNamed:@"star13.png"], [UIImage imageNamed:@"star12.png"],[UIImage imageNamed:@"star11.png"],[UIImage imageNamed:@"star10.png"],[UIImage imageNamed:@"star9.png"],[UIImage imageNamed:@"star8.png"],[UIImage imageNamed:@"star7.png"],[UIImage imageNamed:@"star6.png"],[UIImage imageNamed:@"star5.png"],[UIImage imageNamed:@"star4.png"],[UIImage imageNamed:@"star3.png"],[UIImage imageNamed:@"star2.png"],[UIImage imageNamed:@"star1.png"],nil];
    // [self.view addSubview:meImage];
    //[self attachPopUpAnimationToView:imageView];
    
    
    if(![ImageView isAnimating]) {
        NSLog(@"no");
       ImageView.animationDuration=3;
        [ImageView startAnimating];
    }
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [self performSelector:@selector(stopAnimation) withObject:nil afterDelay:3]; 

    
    // Do any additional setup after loading the view from its nib.
}
-(void)stopAnimation
{
    [ImageView stopAnimating];
   // NSString *score=[[NSUserDefaults standardUserDefaults]valueForKey:@"newCoins"];
   // finalScore.text=[NSString stringWithFormat:@"You Won %@",score];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
