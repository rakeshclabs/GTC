//
//  StatisticsViewController.m
//  GTC
//
//  Created by Mac 23 on 10/09/12.
//
//

#import "StatisticsViewController.h"

@interface StatisticsViewController ()

@end

@implementation StatisticsViewController
@synthesize totalgames;
@synthesize avgguesstime;
@synthesize quickestguesstime;
@synthesize coinsearned;
@synthesize starsearned;

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
    NSString*  post =[NSString stringWithFormat:@"access_token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"access_token" ]];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    
    [request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/statistics.php"]];
    
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
      
          NSString *totalgames1=[json1 valueForKey:@"no of games"];
          NSString *avgguesstime1=[json1 valueForKey:@"avg guess time"];
          NSString *quickestguesstime1=[json1 valueForKey:@"quikest guess time"];
          NSString *coinsearned1=[json1 valueForKey:@"coins earned"];
    
       // [totalgames setText:totalgames1];
      //  daysscndLabel.text=[NSString stringWithFormat:@"%@",[a substringToIndex:1 ]] ;
        if(totalgames1)
            totalgames.text=[NSString stringWithFormat:@"%@",totalgames1];
        else
            totalgames.text=@"0";
        
        if(avgguesstime1)
            avgguesstime.text=[NSString stringWithFormat:@"%@:%@",[avgguesstime1 substringToIndex:1],[avgguesstime1 substringFromIndex:2]];
        else
            avgguesstime.text=@"";
        
        if(quickestguesstime1)
            quickestguesstime.text=[NSString stringWithFormat:@"%@:%@",[quickestguesstime1 substringToIndex:1],[quickestguesstime1 substringFromIndex:2]];
        else
            quickestguesstime.text=@"";
        
        if(coinsearned1)
            coinsearned.text=[NSString stringWithFormat:@"%@",coinsearned1];
        else
            coinsearned.text=@"0";
        if([coinsearned.text intValue]>=2000)
        {
           starsearned.text=@"1";
        }
        if([coinsearned.text intValue]>=4000)
        {
            
            starsearned.text=@"2";
            
            
        }
        if([coinsearned.text intValue]>=8000)
        {
        
            
            starsearned.text=@"3";
            
        }
        if([coinsearned.text intValue]>=16000)
        {
         
            
            starsearned.text=@"4";
            
        }
        if(
           [coinsearned.text intValue]>=32000)
        {
           
            
            starsearned.text=@"5";
            
            
        }
        
if([coinsearned.text intValue]<2000)
{
    starsearned.text=@"0";
}

        
        
    }
    else {
        NSString *output = [error description];
        NSLog(@"\n\n Error to get json=%@",output);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Unable to connect to server" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}


    
    // Do any additional setup after loading the view from its nib.
- (IBAction)backbutton:(id)sender {
    
   // [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
    
   
    
}


- (void)viewDidUnload
{
    [self setTotalgames:nil];
    [self setAvgguesstime:nil];
    [self setQuickestguesstime:nil];
    [self setCoinsearned:nil];
    [self setStarsearned:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    [self viewDidUnload];
    // Release any cached data, images, etc that aren't in use.
}

//- (void)dealloc {
//    [totalgames release];
//    [avgguesstime release];
//    [quickestguesstime release];
//    [coinsearned release];
//    [starsearned release];
//    [super dealloc];
//}
@end
