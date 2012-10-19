//
//  LoginViewController.m
//  GC
//
//  Created by Samar Singla on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "CreateViewController.h"
#import "ASIFormDataRequest.h"
#import <AVFoundation/AVFoundation.h>


#define kOFFSET_FOR_KEYBOARD 57.0
//#define myData [NSURL URLWithString:@"http://theroboticshomepage.com/GTC/login.php"]

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userName,password,loginButton,lbl,regisButton,indicator,access,days_left,hours_left,minutes_left,seconds_left;
NSMutableArray *arr;
NSMutableArray *arr1;
NSMutableArray *names;
NSMutableArray *images;
NSMutableArray *ocoins;
NSMutableArray *ucoins;
NSMutableArray *gameidarray;
NSString *gameid;
NSMutableArray *user_accept_status;
NSMutableArray *user_score_array;
NSMutableArray *opponent_score_array;
NSMutableArray *game_nudge_status_array;

NSString *opp;
NSString *ucoin;
NSString *ocoin;
NSString *ourl;
UIImageView *meImage;


-(void)POST{
    
    
    NSString *username = userName.text;
    NSString *passwrd = password.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:username forKey:@"user_name"];
    [defaults setObject:passwrd forKey:@"passWord"];
    [defaults synchronize];
    
   // NSString *post =[[NSString alloc] initWithFormat:@"email=%@&pass=%@",username,passwrd];
     NSString *post =[[NSString alloc] initWithFormat:@"email=%@&pass=%@&device_token=%@",username,passwrd,[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/login1.php"];
    
    
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
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error1];
    if (data) 
    {
      //  NSLog(@"\ndata: %@ \nstring: %@", data, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
        NSLog(@"%@",json);
        NSDictionary *personalData=[json objectForKey:@"personal_data"];
        NSLog(@"personalData=%@",personalData);
            NSString *info = [personalData objectForKey:@"access_token"];
            opp  = [personalData objectForKey:@"opponent_name"];
            ucoin=[personalData objectForKey:@"user_coins"];
            ocoin=[personalData objectForKey:@"opponent_coins"];
            ourl=[personalData objectForKey:@"opponent_image"];
            gameid= [personalData objectForKey:@"game_id"] ;
        NSString *coins=[personalData objectForKey:@"coins"];
        days_left=[personalData objectForKey:@"days_left"];
        hours_left=[personalData objectForKey:@"hours_left"];
      minutes_left= [personalData objectForKey:@"minuts_left"];
        seconds_left=[personalData objectForKey:@"seconds_left"];
             //  NSLog(@"%@",data);
        if(!days_left)
            days_left=0;
        if(!hours_left)
            hours_left=0;
        if(!minutes_left)
            minutes_left=0;
        if(!seconds_left) 
            seconds_left=0;   
        
        NSString *bombs=[personalData objectForKey:@"bombs"];
        NSString *hints=[personalData objectForKey:@"hints"];
        NSString *error=[personalData valueForKey:@"error"];
            NSLog(@"value is %@", info);
            NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
            
            [defaults1 setObject:info forKey:@"access_token"];
       
        [defaults1 setObject:coins forKey:@"coins"];
        [defaults1 setObject:bombs forKey:@"bombs"];
        [defaults1 setObject:hints forKey:@"hints"];
        [[NSUserDefaults standardUserDefaults] synchronize];
         
            NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]);
        
         NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]);
            
         /*   //NSDictionary *name = [info objectAtIndex:0];
            userName.text = [NSString stringWithFormat:@"%@",info];
            access= [NSString stringWithFormat:@"%@",info];
            password.text=[NSString stringWithFormat:@"%@",opp];
            */
            
           // int i;
            
            
            arr=[[NSMutableArray alloc]init];
            arr1=[[NSMutableArray alloc]init];
            names=[[NSMutableArray alloc]init];
            images=[[NSMutableArray alloc]init];
            ocoins=[[NSMutableArray alloc]init];
            ucoins=[[NSMutableArray alloc]init];
            gameidarray=[[NSMutableArray alloc]init];
        user_accept_status=[[NSMutableArray alloc]init];
 user_score_array=[[NSMutableArray alloc]init];
         opponent_score_array=[[NSMutableArray alloc]init];
        game_nudge_status_array=[[NSMutableArray alloc]init];
        
            
        //    NSString *j=[personalData objectForKey:@"no of games"];
        NSDictionary *games1;    
      //  int v=[j intValue];
        //    for (i=1; i<=v;i++) {
                
          //      NSLog(@"game %d", i);
//                if(i<10)
//                  games1=[json valueForKey:[NSString stringWithFormat: @"game0%d",i]];
//                else
//                     games1=[json valueForKey:[NSString stringWithFormat: @"game%d",i]];
        NSString *status=[json objectForKey:@"log"];
        if(!status.intValue==0)
        {  
        
            games1=[json objectForKey:@"maindata"];
               arr=[games1 valueForKey:@"user_status"];
                names=[games1 valueForKey:@"opponent_name"];
                images=[games1 valueForKey:@"opponent_image"];
               user_accept_status=[games1 valueForKey:@"user_accept_status"];
                ocoins=[games1 valueForKey:@"opponent_coins"];
                ucoins=[games1 valueForKey:@"user_coins"];
                gameidarray=[games1 valueForKey:@"game_id"] ;
                  user_score_array=[games1 valueForKey:@"user_score"];
                  opponent_score_array=[games1 valueForKey:@"opponent_score"];
               game_nudge_status_array=[games1 valueForKey:@"game_nudge_status"];
        }   //     NSString *a=@"1";
                
                //  [oppimages addObject:ourl];
//                [arr addObject:userstatus];
//                [names addObject:opponent_name];
//                [images addObject:opponent_image];
//                [ocoins addObject:ocoin];
//                [ucoins addObject:ucoin];
//                [gameidarray addObject:gameid];
//                [user_accept_status addObject:useracceptstatusvalue];
//                [user_score_array addObject:user_score];
//                [opponent_score_array addObject:opponent_score];
//                [game_nudge_status_array addObject:game_nudge_status];
                       
          //  }
            
            
       if(info)
       {
          //[self hideActivityIndicater];
           
           [self performSegueWithIdentifier:@"createGame" sender:nil];
       }
       else if(error) {
           UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"error!" message:error delegate:@"nil" cancelButtonTitle:@"OK" otherButtonTitles: nil]; 
           [Alert show];
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
-(void)Post_Before_Reg
{
   // [self hideActivityIndicater];
    NSString *username = userName.text;
    NSString *passwrd = password.text;
 
    NSString *emailid = userName.text;
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL myStringMatchesRegEx=[emailTest evaluateWithObject:emailid];
    if(!myStringMatchesRegEx)
    {
        UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"Invalid email format" message:@""  delegate:self cancelButtonTitle:@"   Cancel   " otherButtonTitles:nil, nil ];
        [alertView1 show];
        [self hideActivityIndicater];
    }
    else{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:username forKey:@"user_name"];
    [defaults setObject:passwrd forKey:@"passWord"];

    
    
     
    [defaults synchronize];
    
    NSString *post =[[NSString alloc] initWithFormat:@"email=%@&username=%@&device_token=%@",username,passwrd,[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]];
        NSLog(@"Before Device Token=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]);   
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/login1.php"];
    
    
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
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error1];
   NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
 NSLog(@"%@",json);
    NSString *newreg;
        if (data)
    {
      //  NSLog(@"\ndata: %@ \nstring: %@", data, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        
        jsonNew = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
        NSDictionary *personalData=[jsonNew objectForKey:@"personal_data"];
        NSLog(@"%@",jsonNew);
        
        
        newreg =[personalData valueForKey:@"new_reg"];

        if(newreg)
        {
          //  [self hideActivityIndicater];
            [imageAlert show];
        }
               
    
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Enter your Password" message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",@"Forgot", nil];
         [alert setAlertViewStyle:UIAlertViewStyleSecureTextInput];
       // UITextField *txtField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
       // [alert addSubview:txtField];
        [alert setTag:2];
        [alert show];
      //          [self emailLogin];
         //[self hideActivityIndicater];
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
}

-(void)uploadData
{
    NSDictionary *personalData=[jsonNew objectForKey:@"personal_data"];
    NSLog(@"personalData=%@",personalData);
    NSString *info = [personalData objectForKey:@"access_token"];
    access=info;
   // opp  = [personalData objectForKey:@"opponent_name"];
  //  NSLog(@"opp=%@",opp);
  //  ucoin=[personalData objectForKey:@"user_coins"];
  //  ocoin=[personalData objectForKey:@"opponent_coins"];
    //ourl=[personalData objectForKey:@"opponent_image"];
    gameid= [personalData valueForKey:@"game_id"] ;
    NSString *coins=[personalData valueForKey:@"coins"];
    days_left=[personalData valueForKey:@"days_left"];
    hours_left=[personalData valueForKey:@"hours_left"];
    minutes_left= [personalData valueForKey:@"minuts_left"];
    seconds_left=[personalData valueForKey:@"seconds_left"];
 //   NSLog(@"%@",data);
    if(!days_left)
        days_left=0;
    if(!hours_left)
        hours_left=0;
    if(!minutes_left)
        minutes_left=0;
    if(!seconds_left) 
        seconds_left=0;     
    
    NSString *bombs=[personalData valueForKey:@"bombs"];
    
    
    NSString *hints=[personalData valueForKey:@"hints"];
    
    
    NSString *error=[personalData valueForKey:@"error"];
    NSLog(@"value is %@", info);
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    
    [defaults1 setObject:info forKey:@"access_token"];
    
    [defaults1 setObject:coins forKey:@"coins"];
    [defaults1 setObject:bombs forKey:@"bombs"];
    [defaults1 setObject:hints forKey:@"hints"];
    
    
    
    [[NSUserDefaults standardUserDefaults]setInteger:3 forKey:@"count"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    [defaults1 synchronize];
    
    
    NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]);
    
    NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]);
    
    
 //   int i;
    
    
//    arr=[[NSMutableArray alloc]init];
//    arr1=[[NSMutableArray alloc]init];
//    names=[[NSMutableArray alloc]init];
//    images=[[NSMutableArray alloc]init];
//    ocoins=[[NSMutableArray alloc]init];
//    ucoins=[[NSMutableArray alloc]init];
//    gameidarray=[[NSMutableArray alloc]init];
//    user_accept_status=[[NSMutableArray alloc]init];
//    user_score_array=[[NSMutableArray alloc]init];
//    opponent_score_array=[[NSMutableArray alloc]init];
//    game_nudge_status_array=[[NSMutableArray alloc]init];
 //   NSString *j=[personalData objectForKey:@"no of games"];
  //  int v=[j intValue];
    NSDictionary *games1;
  //  for (i=1; i<=v;i++) {
      //  NSLog(@"game %d", i);
//        if(i<10)
//            games1=[jsonNew valueForKey:[NSString stringWithFormat: @"game0%d",i]];
//        else
//            games1=[jsonNew valueForKey:[NSString stringWithFormat: @"game%d",i]]; 
//        games1=[jsonNew objectForKey:@"maindata"];
//        arr=[games1 valueForKey:@"user_status"];
//        names=[games1 valueForKey:@"opponent_name"];
//        images=[games1 valueForKey:@"opponent_image"];
//        user_accept_status=[games1 valueForKey:@"user_accept_status"];
//        ocoins=[games1 valueForKey:@"opponent_coins"];
//        ucoins=[games1 valueForKey:@"user_coins"];
//        gameidarray=[games1 valueForKey:@"game_id"] ;
//        user_score_array=[games1 valueForKey:@"user_score"];
//        opponent_score_array=[games1 valueForKey:@"opponent_score"];
//        game_nudge_status_array=[games1 valueForKey:@"game_nudge_status"];
//        [arr addObject:userstatus];
//        [names addObject:opponent_name];
//        [images addObject:opponent_image];
//        [ocoins addObject:ocoin];
//        [ucoins addObject:ucoin];
//        [gameidarray addObject:gameid];
//        [user_accept_status addObject:useracceptstatusvalue];
//        [user_score_array addObject:user_score];
//        [opponent_score_array addObject:opponent_score];
//        [game_nudge_status_array addObject:game_nudge_status];
  //  }
    
    
    if(info)
    {
      //  [self hideActivityIndicater];
        NSLog(@"arr=%@",[arr objectAtIndex:0]);
        
        
        [self performSegueWithIdentifier:@"createGame" sender:nil];
    }
    else if(error) {
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"error!" message:error delegate:@"nil" cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [Alert show];
    }
}
-(void)uploadImage
{
    NSDictionary *personalData=[jsonNew objectForKey:@"personal_data"];
    NSLog(@"personalData=%@",personalData);
    NSString *info = [personalData objectForKey:@"access_token"];
    NSString *error=[personalData valueForKey:@"error"];
  //  NSLog(@"access_token=%@,imagedata=%@",info,imageData);
 /*   NSString *post =[[NSString alloc] initWithFormat:@"file=%@&access_token=%@",imageData,info];
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/uploadimage.php"];
    
    
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
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error1];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
    NSString *imagePath=[json objectForKey:@"path"];
    NSLog(@"Path=%@",imagePath);
    NSLog(@"json=%@",json);*/
    
    NSString *strURL = @"http://guessthatcelebrity.com/uploadimage.php";
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:strURL]]; 
    [request setData:imageData withFileName:@"MyImage.jpeg" andContentType:@"image/jpeg" forKey:@"file"];
    [request setPostValue:info forKey:@"access_token"];
    [request setRequestMethod:@"POST"];
    //[request appendPostData:body]; 
    [request setDelegate:self]; 
    [request setTimeOutSeconds:10.0]; 
    request.shouldAttemptPersistentConnection = NO;
    [request setDidFinishSelector:@selector(uploadRequestFinished:)]; 
    [request setDidFailSelector:@selector(uploadRequestFailed:)]; 
    [request startAsynchronous];
    

    
    
    
    if(!oldUser)
        [self uploadData];
    else {
        if(info)
        {
            //  [self hideActivityIndicater];
            [self performSegueWithIdentifier:@"createGame" sender:nil];
        }
        else if(error) {
            UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"error!" message:error delegate:@"nil" cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [Alert show];
        }

    }
    
}

- (void)uploadRequestFinished:(ASIHTTPRequest *)request
{
    NSLog(@" Upload Response: \"%@\"",[request responseString]); 
}

- (void)uploadRequestFailed:(ASIHTTPRequest *)request{ 
    NSLog(@" Error - Statistics file upload failed: \"%@\"",[[request error] localizedDescription]); 
    
}

//-(void)emailLogin
//{
//    
//        NSString *username = userName.text;
////        NSString *passwrd = password.text;
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:username forKey:@"user_name"];
//  //      [defaults setObject:passwrd forKey:@"passWord"];
//        [defaults synchronize];
//        
//     //   NSString *post =[[NSString alloc] initWithFormat:@"email=%@&pass=%@",username,[alertView textFieldAtIndex:0].text];
//         NSString *post =[[NSString alloc] initWithFormat:@"email=%@&device_token=%@",username,[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]];
//        
//        NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/login1.php"];
//        
//        
//        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
//        [request setURL:url];
//        [request setHTTPMethod:@"POST"];
//        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//        [request setHTTPBody:postData];
//        NSError *error1 = nil;
//        NSURLResponse *response = nil;
//        
//        NSData *data = [NSURLConnection sendSynchronousRequest:request
//                                             returningResponse:&response
//                                                         error:&error1];
//        if (data)
//        {
//            NSLog(@"\ndata: %@ \nstring: %@", data, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
//            NSLog(@"%@",json);
//            
//            NSString *info = [json objectForKey:@"access_token"];
//            opp  = [json objectForKey:@"opponent_name"];
//            ucoin=[json objectForKey:@"user_coins"];
//            ocoin=[json objectForKey:@"opponent_coins"];
//            ourl=[json objectForKey:@"opponent_image"];
//            gameid= [json objectForKey:@"game_id"] ;
//            NSString *coins=[json objectForKey:@"coins"];
//            days_left=[json objectForKey:@"days_left"];
//            hours_left=[json objectForKey:@"hours_left"];
//            minutes_left= [json objectForKey:@"minuts_left"];
//            seconds_left=[json objectForKey:@"seconds_left"];
//            NSLog(@"%@",data);
//            if(!days_left)
//                days_left=0;
//            if(!hours_left)
//                hours_left=0;
//            if(!minutes_left)
//                minutes_left=0;
//            if(!seconds_left)
//                seconds_left=0;   
//            NSString *bombs=[json objectForKey:@"bombs"];
//            
//            
//            NSString *hints=[json objectForKey:@"hints"];
//            
//            
//            NSString *error=[json valueForKey:@"error"];
//            NSLog(@"value is %@", info);
//            NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
//            
//            [defaults1 setObject:info forKey:@"access_token"];
//            
//            [defaults1 setObject:coins forKey:@"coins"];
//            [defaults1 setObject:bombs forKey:@"bombs"];
//            [defaults1 setObject:hints forKey:@"hints"];
//            
//            
//            [[NSUserDefaults standardUserDefaults]setInteger:3 forKey:@"count"];
//            [[NSUserDefaults standardUserDefaults]synchronize];
//            
//            
//            
//            [defaults1 synchronize];
//            
//            
//            NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]);
//            
//            NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]);
//            
//            /*   //NSDictionary *name = [info objectAtIndex:0];
//             userName.text = [NSString stringWithFormat:@"%@",info];
//             access= [NSString stringWithFormat:@"%@",info];
//             password.text=[NSString stringWithFormat:@"%@",opp];
//             */
//            
//            int i;
//            
//            
//            arr=[[NSMutableArray alloc]init];
//            arr1=[[NSMutableArray alloc]init];
//            names=[[NSMutableArray alloc]init];
//            images=[[NSMutableArray alloc]init];
//            ocoins=[[NSMutableArray alloc]init];
//            ucoins=[[NSMutableArray alloc]init];
//            gameidarray=[[NSMutableArray alloc]init];
//            user_accept_status=[[NSMutableArray alloc]init];
//            user_score_array=[[NSMutableArray alloc]init];
//            opponent_score_array=[[NSMutableArray alloc]init];
//            game_nudge_status_array=[[NSMutableArray alloc]init];
//            
//            NSString *j=[json objectForKey:@"no of games"];
//            int v=[j intValue];
//            for (i=1; i<=v;i++) {
//                NSLog(@"game %d", i);
//                NSDictionary *games1=[json valueForKey:[NSString stringWithFormat: @"game%d",i]];
//                
//                NSString  *userstatus=[games1 valueForKey:@"user_status"];
//                NSString *opponent_name=[games1 valueForKey:@"opponent_name"];
//                NSString  *opponent_image=[games1 valueForKey:@"opponent_image"];
//                NSString *useracceptstatusvalue=[games1 valueForKey:@"user_accept_status"];
//                ocoin=[games1 valueForKey:@"opponent_coins"];
//                ucoin=[games1 valueForKey:@"user_coins"];
//                gameid=[games1 valueForKey:@"game_id"] ;
//                NSString *user_score=[games1 valueForKey:@"user_score"];
//                NSString *opponent_score=[games1 valueForKey:@"opponent_score"];
//                NSString *game_nudge_status=[games1 valueForKey:@"game_nudge_status"];
//                //     NSString *a=@"1";
//                
//                //  [oppimages addObject:ourl];
//                [arr addObject:userstatus];
//                [names addObject:opponent_name];
//                [images addObject:opponent_image];
//                [ocoins addObject:ocoin];
//                [ucoins addObject:ucoin];
//                [gameidarray addObject:gameid];
//                [user_accept_status addObject:useracceptstatusvalue];
//                [user_score_array addObject:user_score];
//                [opponent_score_array addObject:opponent_score];
//                [game_nudge_status_array addObject:game_nudge_status];
//                
//            }
//            
//            
//            if(info)
//            {
//                [self hideActivityIndicater];
//                
//                [self performSegueWithIdentifier:@"createGame" sender:nil];
//            }
//            else if(error) {
//                UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"error!" message:error delegate:@"nil" cancelButtonTitle:@"OK" otherButtonTitles: nil];
//                [Alert show];
//            }
//            
//            
//        }
//        
//        
//        else
//        {
//            NSString *output = [error1 description];
//            NSLog(@"\n\n Error to get json=%@",output);
//            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Could not connect to the server, please check your internet connection !" delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
//            [alert show]; 
//        }  
//
//    
//}
    
-(void)POST_FB{
    
    NSString *deviceToken=[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"];
    NSLog(@"device Token Facebook=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]);
   // if(deviceToken)
   // {
    NSString *fbid =[[NSUserDefaults standardUserDefaults]valueForKey:@"fbid"];
    NSString *fbuname = [ [NSUserDefaults standardUserDefaults]valueForKey:@"fbuname"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fbuname forKey:@"user_name"];
  //[defaults setObject:passwrd forKey:@"passWord"];
    [defaults synchronize];
    [[NSUserDefaults standardUserDefaults]setInteger:3 forKey:@"count"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSString *post =[[NSString alloc] initWithFormat:@"fbid=%@&fb_uname=%@&device_token=%@",fbid,fbuname,[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]];
    /*
     [[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]]
     
     &device_token=%@
     */
    NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/fblogin.php"];
    
    
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
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error1];
    if (data) 
    {
     //    NSLog(@"\ndata: %@ \nstring: %@", data, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
         NSLog(@"json is %@", json);
        NSDictionary *personalData=[json objectForKey:@"personal_data"];
        NSLog(@"personalData=%@",personalData);
        NSString *accessToken = [personalData objectForKey:@"access_token"];
        opp  = [personalData objectForKey:@"opponent_name"];
        ucoin=[personalData objectForKey:@"user_coins"];
        ocoin=[personalData objectForKey:@"opponent_coins"];
        ourl=[personalData objectForKey:@"opponent_image"];
        gameid= [personalData objectForKey:@"game_id"] ;
        NSString *coins=[personalData objectForKey:@"coins"];
        
        
        days_left=[personalData objectForKey:@"days_left"];
        hours_left=[personalData objectForKey:@"hours_left"];
        minutes_left= [personalData objectForKey:@"minuts_left"];
        seconds_left=[personalData objectForKey:@"seconds_left"];
        if(!days_left)
            days_left=0;
        if(!hours_left)
            hours_left=0;
        if(!minutes_left)
            minutes_left=0;
        if(!seconds_left) 
            seconds_left=0;   
        
        //NSString *useracceptstatusvalue=[json valueForKey:@"user_accept_status"];
        NSLog(@"Login coins=%@",[personalData objectForKey:@"user_coins"]);
        NSString *error=[json valueForKey:@"error"];
        NSLog(@"value is %@", accessToken);
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        [defaults1 setObject:accessToken forKey:@"access_token"];
        [defaults1 setObject:coins forKey:@"coins"];
        [defaults1 synchronize];
         NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]);
        
        /*   //NSDictionary *name = [info objectAtIndex:0];
         userName.text = [NSString stringWithFormat:@"%@",info];
         access= [NSString stringWithFormat:@"%@",info];
         password.text=[NSString stringWithFormat:@"%@",opp];
         */
        
       // int i;
        
        user_accept_status=[[NSMutableArray alloc]init];
        arr=[[NSMutableArray alloc]init];
        arr1=[[NSMutableArray alloc]init];
        names=[[NSMutableArray alloc]init];
        images=[[NSMutableArray alloc]init];
        ocoins=[[NSMutableArray alloc]init];
        ucoins=[[NSMutableArray alloc]init];
        gameidarray=[[NSMutableArray alloc]init];
        user_score_array=[[NSMutableArray alloc]init];
        opponent_score_array=[[NSMutableArray alloc]init];
        game_nudge_status_array=[[NSMutableArray alloc]init];
//        NSString *j=[personalData objectForKey:@"no of games"];
//        int v=[j intValue];
//        for (i=1; i<=v;i++) 
//        {
            NSDictionary *games1;
//            NSLog(@"game %d", i);
//            if(i<10)
//                games1=[json valueForKey:[NSString stringWithFormat: @"game0%d",i]];
//           else
//                games1=[json valueForKey:[NSString stringWithFormat: @"game%d",i]];
        NSString *status=[json objectForKey:@"log"];
        if(!status.intValue==0)
        {    
        games1=[json objectForKey:@"maindata"];
            arr=[games1 valueForKey:@"user_status"];
           names=[games1 valueForKey:@"opponent_name"];
            images=[games1 valueForKey:@"opponent_image"];
            ocoins=[games1 valueForKey:@"opponent_coins"];
            ucoins=[games1 valueForKey:@"user_coins"];
            gameidarray=[games1 valueForKey:@"game_id"] ;
           user_accept_status=[games1 valueForKey:@"user_accept_status"];
            //[user_accept_status addObject:useracceptstatusvalue];
                            user_score_array=[games1 valueForKey:@"user_score"];
                        opponent_score_array=[games1 valueForKey:@"opponent_score"];
            game_nudge_status_array=[games1 valueForKey:@"game_nudge_status"];
        }  //     NSString *a=@"1";
            //  [oppimages addObject:ourl];
//            [arr addObject:userstatus];
//            [names addObject:opponent_name];
//            [images addObject:opponent_image];
//            [ocoins addObject:ocoin];
//            [ucoins addObject:ucoin];
//            [gameidarray addObject:gameid];
//            [user_score_array addObject:user_score];
//            [opponent_score_array addObject:opponent_score];
//            [game_nudge_status_array addObject:game_nudge_status];
//            
            // [arr addObject:userstatus];
            /*   if([userstatus isEqual:a])
             {
             [arr addObject:userstatus];
             [names addObject:opponent_name];
             [images addObject:opponent_image];
             }
             else
             {
             [arr1 addObject:userstatus];
             [names addObject:opponent_name];
             [images addObject:opponent_image];
             
             }
             
             */        
        //}
        
        /*   NSLog(@"value is %@", arr);
         NSLog(@"value is %@", arr1);
         NSLog(@"value is %@", names);
         NSLog(@"value is %@", images);
         NSLog(@"value is %@", gameidarray);*/
        if(accessToken)[self performSegueWithIdentifier:@"createGame" sender:nil];
        else if(error) {
            UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"error!" message:error delegate:@"nil" cancelButtonTitle:@"OK" otherButtonTitles: nil]; 
            [Alert show];
        }
    }
    
    
    else 
    { 
        NSString *output = [error1 description];
        NSLog(@"\n\n Error to get json=%@",output);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Could not connect to the server, please check your internet connection !" delegate:self cancelButtonTitle:@"  OK  " otherButtonTitles: nil];
        [alert show]; 
    }
        
   // }
   // else {
   //     UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Your Device is not recognized. So your account can't be created" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
     //   [alert show];
       // [alert release];
   // }
        
}



-(IBAction)loginButton:(id)sender 
{
    [self showActivityIndicater];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    [[NSUserDefaults standardUserDefaults]setValue:@"email" forKey:@"login"];
   // [self showActivityIndicater];
    [self Post_Before_Reg];
    
    
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
    [self hideActivityIndicater];
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}





-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"createGame"])
    {
        view = [segue destinationViewController ];
        // [view setName:userName.text];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *loadname = [defaults objectForKey:@"user_name"];
        NSLog(@"Name=%@",loadname);
        [view setValue:loadname];
        
        
        
        
        CreateViewController *vc= (CreateViewController *)[segue destinationViewController];
        NSLog(@"access=%@",access);
        vc.access_token=access;
        
        vc.oppenent_name=opp;
        NSLog(@"access=%@",opp);
        vc.arr=arr;
        NSLog(@"access=%@",arr);
        vc.arr1=arr1;
        NSLog(@"access=%@",arr1);
        vc.names=names;
        NSLog(@"access=%@",names);
        vc.images=images;
        NSLog(@"access=%@",images);
        vc.ourl=ourl;
        NSLog(@"access=%@",ourl);
        vc.ocoin=ocoin;
        NSLog(@"access=%@",ocoin);
        vc.ucoin=ucoin;
              NSLog(@"access=%@",ucoin);
        vc.coinarray=ocoins;
        NSLog(@"access=%@",ocoins);
        vc.gameidarray=gameidarray;
        NSLog(@"access=%@",gameidarray);
        vc.ucoinarray=ucoins;
        NSLog(@"access=%@",ucoins);
        vc.user_accept_status_array=user_accept_status;
        NSLog(@"access=%@",user_accept_status);
        vc.days_left=days_left;
        NSLog(@"access=%@",days_left);
        vc.hours_left=hours_left;
        NSLog(@"access=%@",hours_left);
        vc.minutes_left=minutes_left;
        NSLog(@"access=%@",minutes_left);
        vc.seconds_left=seconds_left;
        NSLog(@"access=%@",seconds_left);
        vc.user_score_arrray=user_score_array;
        NSLog(@"access=%@",user_score_array);
        vc.opponent_score_array=opponent_score_array;
        NSLog(@"access=%@",opponent_score_array);
        NSLog(@"days=%@",days_left);
        NSLog(@"days=%@",hours_left);
        NSLog(@"days=%@",minutes_left);
        NSLog(@"days=%@",seconds_left);
    } 
}


-(IBAction)hideKeyboard:(id)sender
{
    [userName resignFirstResponder];
    [password resignFirstResponder];
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

//method to move the view up/down whenever the keyboard is shown/dismissed


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
    
    imageAlert=[[UIAlertView alloc]initWithTitle:@"Upload Picture" message:@"Do you want to upload your picture?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    imageAlert.tag=3;
    
    [self.navigationController setNavigationBarHidden:YES];
    [FacebookManager facebookConnect].Delegate=self;
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"loginplay"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
     
    [[NSUserDefaults standardUserDefaults] setInteger:1  forKey:@"tim"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSUserDefaults standardUserDefaults] setInteger:1  forKey:@"rate"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"next"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0  forKey:@"ratecount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSUserDefaults standardUserDefaults] setInteger:0  forKey:@"ratecountyes"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"sound"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
  
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
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    meImage=nil;
    arr1=nil;
    arr=nil;
    names=nil;
    images=nil;
    ocoins=nil;
    ucoins=nil;
    gameidarray=nil;
    user_accept_status=nil;
    user_score_array=nil;
    opponent_score_array=nil;
    
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)FB_Login:(id)sender 
{
    count=[[NSUserDefaults standardUserDefaults]integerForKey:@"FBcount"];
    NSLog(@"Count=%d",count);
    count++;
    
    [[NSUserDefaults standardUserDefaults]setInteger:count forKey:@"FBcount"];
    NSLog(@"Count=%d",[[NSUserDefaults standardUserDefaults]integerForKey:@"FBcount"]);
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"sound"])
    {
        [audioPlayer play];
    }
    
    [[NSUserDefaults standardUserDefaults]setValue:@"fb" forKey:@"login"];
    [sender setBackgroundImage:[UIImage imageNamed:@"facebook_btn_h@2x.png"] forState:UIControlStateHighlighted];

    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"fbid"]&&[[NSUserDefaults standardUserDefaults]objectForKey:@"fbuname"]){
        [self POST_FB];
        
    }
        
    else  
    [[FacebookManager facebookConnect]Call_FB]; 
    
    /*[Timer invalidate]; Timer=nil;
     Timer=  [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(CallPost_FB) userInfo:nil repeats:YES];
    */
}

-(void)CallPost_FB{
    if(FBLogedIn){
        [self POST_FB];
        [Timer invalidate]; Timer=nil;
    
    }  
}

-(void)FB_Login_Request_Sent{
   // [SVProgressHUD showWithStatus:@"logging in..."];
    [self showActivityIndicater];
    NSLog(@"Login requesting");
}
-(void)FB_Logged_In_Successfully{
    
    [self POST_FB];
   // [SVProgressHUD dismiss];
    NSLog(@"Count=%d",count);
    if(count==0||count>=3)
    { 
    NSString *fbid =[[NSUserDefaults standardUserDefaults]valueForKey:@"fbid"];
    NSString *fbuname = [[NSUserDefaults standardUserDefaults]valueForKey:@"fbuname"];
    NSLog(@"fbid=%@",fbid);
    NSLog(@"fbname=%@",fbuname);
    [[FacebookManager facebookConnect]Post_To_Friend_Wall_WithMsg:[NSString stringWithFormat:@"%@ has just started playing Guess That Celebrity on the iPhone! Start playing now to test your celebrity knowledge",fbuname]Friend_FBID:fbid WithLink:nil];
        if(count>=3)
            [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"FBcount"]; 
    }
    
    NSLog(@"Loged In successful");
    [self hideActivityIndicater];
}
-(void)showActivityIndicater
{
    activityImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,10,320,480)];
    // meImage.image=[UIImage imageNamed:@"splashscreen_v2@2x.png"];
    
    //  NSData *meData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"splashscreen_v2@2x.png"]];
    
    // [meImage setImage:[UIImage imageWithData:meData]];
    
    
    // [self.view addSubview:meImage];
    
    
    
    
    activityImage.animationImages = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"img9.png"],[UIImage imageNamed:@"img8.png"], [UIImage imageNamed:@"img7.png"], [UIImage imageNamed:@"img6.png"],[UIImage imageNamed:@"img5.png"],[UIImage imageNamed:@"img4.png"],[UIImage imageNamed:@"img3.png"],[UIImage imageNamed:@"img11.png"],[UIImage imageNamed:@"img10.png"],nil];
    [self.view addSubview:activityImage];
    //[self attachPopUpAnimationToView:imageView];
    
    
    if(![activityImage isAnimating]) {
        NSLog(@"no");
        activityImage.animationDuration=1;
        [activityImage startAnimating];
    }
    
}
-(void)hideActivityIndicater
{
    // [SVProgressHUD dismiss];
    [activityImage stopAnimating];
    [activityImage removeFromSuperview];
}



-(void)FB_Post_To_Friend_Wall_Successfully
{
    
}

-(void)FB_Post_To_Friend_Wall_Request_Sent
{
    
}
-(void)FB_Post_To_Wall_Request_Sent
{
    
}
-(void)FB_Post_To_Wall_Successfully
{
    
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
   // [self viewDidUnload];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex 
{
   // NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if(buttonIndex==0&&alertView.tag==2)
        
    {
        [self hideActivityIndicater]; 
        NSString *username = userName.text;
        
        NSString *passwrd = password.text;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:username forKey:@"user_name"];
        
        [defaults setObject:passwrd forKey:@"passWord"];
        
        [defaults synchronize];
        
        
        
        //   NSString *post =[[NSString alloc] initWithFormat:@"email=%@&pass=%@",username,[alertView textFieldAtIndex:0].text];
        
        NSString *post =[[NSString alloc] initWithFormat:@"email=%@&pass=%@&device_token=%@",username,[alertView textFieldAtIndex:0].text,[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]];
        NSURL *url=[NSURL URLWithString:@"http://guessthatcelebrity.com/login1.php"];
        
        
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
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error1];
        if (data)
        {
            NSLog(@"\ndata: %@ \nstring: %@", data, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            NSLog(@"%@",json);
            NSDictionary *personalData=[json objectForKey:@"personal_data"];
            NSLog(@"personalData=%@",personalData);
            
            NSString *info = [personalData objectForKey:@"access_token"];
            opp  = [personalData objectForKey:@"opponent_name"];
            ucoin=[personalData objectForKey:@"user_coins"];
            ocoin=[personalData objectForKey:@"opponent_coins"];
            ourl=[personalData objectForKey:@"opponent_image"];
            gameid= [personalData objectForKey:@"game_id"] ;
            NSString *coins=[personalData objectForKey:@"coins"];
            days_left=[personalData objectForKey:@"days_left"];
            hours_left=[personalData objectForKey:@"hours_left"];
            minutes_left= [personalData objectForKey:@"minuts_left"];
            seconds_left=[personalData objectForKey:@"seconds_left"];
        //    NSLog(@"%@",data);
            if(!days_left)
                days_left=0;
            if(!hours_left)
                hours_left=0;
            if(!minutes_left)
                minutes_left=0;
            if(!seconds_left)
                seconds_left=0;   
            NSString *bombs=[personalData objectForKey:@"bombs"];
            
            
            NSString *hints=[personalData objectForKey:@"hints"];
            
            
            NSString *error=[personalData valueForKey:@"error"];
            NSLog(@"value is %@", info);
            NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
            
            [defaults1 setObject:info forKey:@"access_token"];
            
            [defaults1 setObject:coins forKey:@"coins"];
            [defaults1 setObject:bombs forKey:@"bombs"];
            [defaults1 setObject:hints forKey:@"hints"];
            
            
            [[NSUserDefaults standardUserDefaults]setInteger:3 forKey:@"count"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            
            [defaults1 synchronize];
            
            
            NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]);
            
            NSLog(@"value is %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"coins"]);
            
            /*   //NSDictionary *name = [info objectAtIndex:0];
             userName.text = [NSString stringWithFormat:@"%@",info];
             access= [NSString stringWithFormat:@"%@",info];
             password.text=[NSString stringWithFormat:@"%@",opp];
             */
            
       //     int i;
             access= [NSString stringWithFormat:@"%@",info];
            
            arr=[[NSMutableArray alloc]init];
            arr1=[[NSMutableArray alloc]init];
            names=[[NSMutableArray alloc]init];
            images=[[NSMutableArray alloc]init];
            ocoins=[[NSMutableArray alloc]init];
            ucoins=[[NSMutableArray alloc]init];
            gameidarray=[[NSMutableArray alloc]init];
            user_accept_status=[[NSMutableArray alloc]init];
            user_score_array=[[NSMutableArray alloc]init];
            opponent_score_array=[[NSMutableArray alloc]init];
            game_nudge_status_array=[[NSMutableArray alloc]init];
            
        //    NSString *j=[personalData objectForKey:@"no of games"];
            NSDictionary *games1;
//            int v=[j intValue];
//            for (i=1; i<=v;i++) 
//            {
//                NSLog(@"v=%d",v);
//                NSLog(@"game %d", i);
////                if(i<10)
//                    games1=[json valueForKey:[NSString stringWithFormat: @"game0%d",i]];
//                else
//                    games1=[json valueForKey:[NSString stringWithFormat: @"game%d",i]];
            NSString *status=[json objectForKey:@"log"];
            if(!status.intValue==0)
            {
                games1=[json valueForKey:@"maindata"];
                NSLog(@"games1=%@",games1);
                arr=[games1 valueForKey:@"user_status"];
             //   NSLog(@"userstatus=%@",userstatus);
                names=[games1 valueForKey:@"opponent_name"];
                images=[games1 valueForKey:@"opponent_image"];
                user_accept_status=[games1 valueForKey:@"user_accept_status"];
                ocoins=[games1 valueForKey:@"opponent_coins"];
                ucoins=[games1 valueForKey:@"user_coins"];
                gameidarray=[games1 valueForKey:@"game_id"] ;
                user_score_array=[games1 valueForKey:@"user_score"];
                opponent_score_array=[games1 valueForKey:@"opponent_score"];
                game_nudge_status_array=[games1 valueForKey:@"game_nudge_status"];
            }  //     NSString *a=@"1";
                
                //  [oppimages addObject:ourl];
//                [arr addObject:userstatus];
//                [names addObject:opponent_name];
//                [images addObject:opponent_image];
//                [ocoins addObject:ocoin];
//                [ucoins addObject:ucoin];
//                [gameidarray addObject:gameid];
//                [user_accept_status addObject:useracceptstatusvalue];
//                [user_score_array addObject:user_score];
//                [opponent_score_array addObject:opponent_score];
//                [game_nudge_status_array addObject:game_nudge_status];
//                
//            }
            NSString *user_image = [personalData objectForKey:@"user_image"];
            if([user_image isEqualToString:@"no image found"])
            { 
                oldUser=TRUE;
               jsonNew=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
                [imageAlert show];
                
                                
            }
            else
            {
              if(info)
              {
              //  [self hideActivityIndicater];
                [self performSegueWithIdentifier:@"createGame" sender:nil];
              }
              else if(error) {
                UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"error!" message:error delegate:@"nil" cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [Alert show];
              }
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
    else if(buttonIndex==1&&alertView.tag==2)
    {
        [self hideActivityIndicater];
        NSLog(@"email=%@",userName.text);
        NSString*  post =[NSString stringWithFormat:@"email=%@",userName.text];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:@"http://guessthatcelebrity.com/forgotPassword.php"]];
        
        [request setHTTPMethod:@"POST"];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error = nil;
        
        NSURLResponse *response1 = nil;
        
        NSData *data1= [NSURLConnection sendSynchronousRequest:request
                        
                                             returningResponse:&response1
                        
                                                         error:&error];
        
        if (data1)
        {
            
            NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
            
            NSLog(@"Pass response =%@",json1);
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Password has been sent on your email Id." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            alert.tag=1;
            [alert show];
            
            
        }
        else 
        {
             [self hideActivityIndicater];
            NSString *output = [error description];
            NSLog(@"\n\n Error to get json=%@",output);
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Unable to connect to server" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        
    }
    else if(buttonIndex==0&&alertView.tag==3)
    {
        [self uploadData];
    }
    else if(buttonIndex==1&&alertView.tag==3)
    {
        if([UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary])
        {
            UIImagePickerController *picker= [[UIImagePickerController alloc]init];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentModalViewController:picker animated:YES];
        } 
       
        
    }
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage : (UIImage *)imageNew
                 editingInfo:(NSDictionary *)editingInfo
{
    UIGraphicsBeginImageContext(CGSizeMake(50.0,50.0));
    [imageNew drawInRect:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    UIImage *newImage  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageData = UIImagePNGRepresentation(newImage);
  //  imageData=UIImageJPEGRepresentation(newImage,0.9f);
    [picker dismissModalViewControllerAnimated:YES];
    [self performSelector:@selector(uploadImage) withObject:nil afterDelay:2.0];
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *) picker
{
    [self uploadData];
  	[picker dismissModalViewControllerAnimated:YES];
    
}
        
@end
