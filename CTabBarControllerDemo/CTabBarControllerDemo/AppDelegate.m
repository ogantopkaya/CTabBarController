//
//  AppDelegate.m
//  CTabBarController
//
//  Created by Ogan Topkaya on 02/05/15.
//  Copyright (c) 2015 Ogan. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

#import "CNavigationController.h"
#import "CTabBarController.h"
#import "BottomTabBar.h"
#import "CImageTabBarItem.h"

@interface AppDelegate ()

@property(nonatomic,strong)CTabBarController *cTabBarController;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    {
        CTabBarItem *tabBarItem = [[CTabBarItem alloc] init];
        CImageTabBarItemView *imageTabBarItemView = [[CImageTabBarItemView alloc] init];
        [imageTabBarItemView setTitle:@"Profile" image:[UIImage imageNamed:@"tab1"] titleColor:[UIColor blackColor] forState:CTabBarItemStateNormal];
        [imageTabBarItemView setTitle:@"Profile" image:[UIImage imageNamed:@"tab1H"] titleColor:[UIColor blackColor] forState:CTabBarItemStateSelected];
        tabBarItem.cTabBarItemView = imageTabBarItemView;
        
        FirstViewController *firstViewController = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
        CNavigationController *navigationController = [[CNavigationController alloc] initWithRootViewController:firstViewController];
        navigationController.cTabBarItem = tabBarItem;
        
        [viewControllers addObject:navigationController];
    }

    {
        CTabBarItem *tabBarItem = [[CTabBarItem alloc] init];
        CImageTabBarItemView *imageTabBarItemView = [[CImageTabBarItemView alloc] init];
        [imageTabBarItemView setTitle:@"Places" image:[UIImage imageNamed:@"tab2"] titleColor:[UIColor blackColor] forState:CTabBarItemStateNormal];
        [imageTabBarItemView setTitle:@"Places" image:[UIImage imageNamed:@"tab2H"] titleColor:[UIColor blackColor] forState:CTabBarItemStateSelected];
        tabBarItem.cTabBarItemView = imageTabBarItemView;
        
        SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
        secondViewController.cTabBarItem = tabBarItem;
        
        [viewControllers addObject:secondViewController];
    }
    
    BottomTabBar *bottomTabbar = [[BottomTabBar alloc] init];
    bottomTabbar.tabBarHeight = 60.0f;
    self.cTabBarController = [[CTabBarController alloc] initWithTabBar:bottomTabbar];
    [self.cTabBarController setViewControllers:viewControllers];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.cTabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
