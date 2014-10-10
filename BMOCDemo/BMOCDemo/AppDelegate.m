//
//  AppDelegate.m
//  BMFrameworkDemo
//
//  Created by fx on 14-8-21.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import "AppDelegate.h"
#import "ExampleViewController.h"
#import "MainViewController.h"
@implementation AppDelegate

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    AppManager *appM = [AppManager new];
//    self.window.rootViewController = [[ExampleViewController alloc]initWithCityCode:@"101200101"];
////    BMActionManager *bmactionmanager = [BMActionManager new];
////    [bmactionmanager registerAllAction];
//    
// 
//    
//    [self.window makeKeyAndVisible];
//    return YES;
//}

- (void)load
{
//    self.window.rootViewController = [[ExampleViewController alloc]initWithCityCode:@"101200101"];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[MainViewController new]];
    self.window.rootViewController = nav;

	
}
@end
