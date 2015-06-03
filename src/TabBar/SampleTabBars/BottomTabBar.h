//
//  BottomTabBar.h
//  CTabBarController
//
//  Created by Ogan Topkaya on 02/05/15.
//  Copyright (c) 2015 Ogan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTabBarController.h"

@interface BottomTabBar : UIView<CTabBar>

@property(nonatomic)CGFloat tabBarHeight;
@property(nonatomic,strong)UIColor *tabBarBackgroundColor;
@property(nonatomic,strong)UIColor *tabBarSeperatorColor;

@end
