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

@interface AppDelegate () <CTabBarControllerDelegate>

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
    self.cTabBarController.delegate = self;
    [self.cTabBarController setViewControllers:viewControllers];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.cTabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)cTabBarController:(CTabBarController *)tabBarController didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"Selected index: %zd",index);
}

@end
