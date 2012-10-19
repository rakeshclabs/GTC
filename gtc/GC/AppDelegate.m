//
//  AppDelegate.m
//  GC
//
//  Created by Samar Singla on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "FacebookManager.h"
#import "InAppManager.h"
#import "UIDevice+IdentifierAddition.h"
@implementation AppDelegate

@synthesize window = _window;

//- (void)dealloc
//{
//    [_window release];
//    [super dealloc];
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[SKPaymentQueue defaultQueue] addTransactionObserver:[InAppManager sharedHelper]];
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    return YES;
}


 
 - (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
 {
 NSLog(@"My token is: %@", deviceToken);
 NSString* newToken = [deviceToken description];
 newToken = [newToken stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
 newToken = [newToken stringByReplacingOccurrencesOfString:@" " withString:@""];
 NSLog(@"My new token is: %@", newToken);
 if(![[NSUserDefaults standardUserDefaults] objectForKey:@"device_token"]) {
 [[NSUserDefaults standardUserDefaults] setValue:newToken forKey:@"device_token"];
 [[NSUserDefaults standardUserDefaults] synchronize];
 }
 }
 
/*
-(void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
    
    NSLog(@"My token is: %@", deviceToken);
   
    //  NSString* newStr = [[NSString alloc] initWithData:deviceToken encoding:NSUTF8StringEncoding];
    NSString* newToken = [deviceToken description];
    newToken = [newToken stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    newToken = [newToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"My new token is: %@", newToken);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:newToken forKey:@"device_token"];
    
    
    
    
    [defaults synchronize];
    
    //  NSLog(@"the string is %@",newStr);
    NSString *myudid=[NSString stringWithFormat:@"%@",
                      [[UIDevice currentDevice] uniqueDeviceIdentifier]];
    NSLog(@"the udid is %@",myudid);
    NSString *myguid=[NSString stringWithFormat:@"%@",
                      [[UIDevice currentDevice] uniqueGlobalDeviceIdentifier]];
    NSLog(@"the guid is %@",myguid);
    +
    
    // NSLog(@" numverdjfn %@",deviceToken3);
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"])
    {
        NSLog(@"app launched already");
        // app already launched
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // This is the first launch ever
       // if(![newToken isEqualToString:[[DatabaseHandler sharedInstance]DB_Get_DeviceToken] ]  )
          //  [[DatabaseHandler sharedInstance]DB_Insert_UDID:myudid adnToken:newToken];
        
        
        
    //}
    
    
    
    
    
    }}
*/
- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
     // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [ [FacebookManager facebookConnect].facebook handleOpenURL:url]; 
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FacebookManager facebookConnect].facebook handleOpenURL:url]; 
}



@end
