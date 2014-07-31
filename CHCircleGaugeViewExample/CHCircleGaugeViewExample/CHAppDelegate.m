//
//  CHAppDelegate.m
//  CHCircleGaugeViewExample
//
//  Created by Matthew Morey on 7/25/14.
//  Copyright (c) 2014 ChaiOne. All rights reserved.
//

#import "CHAppDelegate.h"
#import "CHViewController.h"

@implementation CHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CHViewController *rootViewController = [[CHViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
