//
//  CNavigationController.m
//  CTabBarControllerDemo
//
//  Created by Ogan Topkaya on 09/11/14.
//  Copyright (c) 2014 Ogan Topkaya. All rights reserved.
//

#import "CNavigationController.h"
#import "CTabBarController.h"

@interface CTabBarController ()

@property(nonatomic,strong)UIViewController *containerViewController;
@property(nonatomic,strong)UIView <CTabBar> *cTabBar;
- (void)moveCTabBarToViewController:(UIViewController *)viewController;
- (void)moveCTabBarToContainerViewController;

@end

@interface CNavigationController ()<UINavigationControllerDelegate>

@end

@implementation CNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isTabBarInNavigationView{
    __block BOOL hasTabBar = NO;
    [[self.cTabBarController.containerViewController.view subviews] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if (view == self.cTabBarController.cTabBar) {
            hasTabBar =  YES;
        }
    }];
    return hasTabBar;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    id cTabBarController = self.cTabBarController;
    
    if (cTabBarController) {
        if (viewController.hidesCTabBarWhenPushed && [self isTabBarInNavigationView]) {
            [cTabBarController moveCTabBarToViewController:self.topViewController];
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

- (BOOL)shouldShowTabBar:(UIViewController *)viewController{
    NSInteger indexOfViewController = [self.viewControllers indexOfObjectIdenticalTo:viewController];
    for (NSInteger i = indexOfViewController; i>=0; i--) {
        BOOL hides = [self.viewControllers[i] hidesCTabBarWhenPushed];
        if (hides) {
            return NO;
        }
    }
    return YES;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self shouldShowTabBar:viewController]) {
        [self.cTabBarController moveCTabBarToContainerViewController];
    }
}

@end
