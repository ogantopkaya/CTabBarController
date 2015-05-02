//
//  CTabBarController.h
//  CTabBarController
//
//  Created by Ogan Topkaya on 02/05/15.
//  Copyright (c) 2015 Ogan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTabBar.h"
#import "UIViewController+CTabBarController.h"

@interface CTabBarController : UIViewController

- (instancetype)initWithTabBar:(UIView <CTabBar>*)cTabBar;

@property(nonatomic,strong)NSArray *viewControllers;
@property(nonatomic,strong)UIViewController *selectedViewController;
@property(nonatomic)NSInteger selectedIndex;

@end