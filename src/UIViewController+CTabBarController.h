//
//  UIViewController+CTabBarController.h
//  CTabBarController
//
//  Created by Ogan Topkaya on 02/05/15.
//  Copyright (c) 2015 Ogan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTabBarItem.h"

@class CTabBarController;
@interface UIViewController (CTabBarController)

@property(nonatomic,strong)CTabBarItem *cTabBarItem;
- (CTabBarController *) cTabBarController;

@end


@interface UIViewController (CNavigationController)
@property(nonatomic)BOOL hidesCTabBarWhenPushed;
@end