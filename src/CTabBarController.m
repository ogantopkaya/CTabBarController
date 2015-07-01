//
//  CTabBarController.m
//  CTabBarController
//
//  Created by Ogan Topkaya on 02/05/15.
//  Copyright (c) 2015 Ogan. All rights reserved.
//

#import "CTabBarController.h"
#import "UIViewController+CTabBarController.h"

@interface CTabBarController ()<CTabBarDelegate>
@property(nonatomic,strong)UIView <CTabBar> *cTabBar;
@property(nonatomic,strong)UIViewController *containerViewController;
@end

@implementation CTabBarController

- (instancetype)initWithTabBar:(UIView <CTabBar>*)cTabBar{
    self = [super init];
    if (self) {
        NSAssert(cTabBar, @"cTabBar cannot be nil");
        
        self.containerViewController = [[UIViewController alloc] init];
        [self.view addSubview:self.containerViewController.view];
        [self addChildViewController:self.containerViewController];
        
        self.cTabBar = cTabBar;
        self.cTabBar.delegate = self;
        [self.view addSubview:cTabBar];
    }
    return self;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.containerViewController.view.frame = self.view.bounds;
    self.cTabBar.frame = self.view.bounds;
    [self.view bringSubviewToFront:self.cTabBar];
}


#pragma mark - Setting Up Tabs

- (void)setViewControllers:(NSArray *)viewControllers{
    self.cTabBar.tabBarItems = [viewControllers valueForKey:@"cTabBarItem"];
    
    _viewControllers = viewControllers;
    
    if (!_selectedViewController) {
        [self setSelectedViewController:[_viewControllers firstObject]];
    }
}

#pragma mark - Selection


- (void)setSelectedViewController:(UIViewController *)selectedViewController{
    self.cTabBar.selectedIndex = [self.viewControllers indexOfObjectIdenticalTo:selectedViewController];
    if (_selectedViewController) {
        [_selectedViewController removeFromParentViewController];
        [_selectedViewController.view removeFromSuperview];
    }
    
    //TODO: Call Delegate
    _selectedViewController = selectedViewController;
    
    self.containerViewController.view.frame = self.view.bounds;
    _selectedViewController.view.frame = self.containerViewController.view.bounds;
    [self.containerViewController.view addSubview:_selectedViewController.view];
    [self.containerViewController addChildViewController:_selectedViewController];
    [self.containerViewController.view addSubview:self.cTabBar];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    [self setSelectedViewController:self.viewControllers[selectedIndex]];
}

- (void)cTabBar:(id<CTabBar>)cTabBar didSelectItemAtIndex:(NSInteger)index{
    [self setSelectedIndex:index];
    if ([self.delegate respondsToSelector:@selector(cTabBarController:didSelectItemAtIndex:)]) {
        [self.delegate cTabBarController:self didSelectItemAtIndex:index];
    }
}

#pragma mark - TabBar 

- (void)moveCTabBarToViewController:(UIViewController *)viewController{
    [self.cTabBar removeFromSuperview];
    id navigationController = self.selectedViewController;
    if ([navigationController isKindOfClass:[UINavigationController class]]) {
        [viewController.view addSubview:self.cTabBar];
    }
}

- (void)moveCTabBarToContainerViewController{
    [self.cTabBar removeFromSuperview];
    [self.containerViewController.view addSubview:self.cTabBar];
}



@end
