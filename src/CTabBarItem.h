//
//  CTabBarItem.h
//  CTabBarControllerDemo
//
//  Created by Ogan Topkaya on 09/11/14.
//  Copyright (c) 2014 Ogan Topkaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CTabBarItemView.h"

@interface CTabBarItem : NSObject

@property(nonatomic,strong)UIView<CTabBarItemView> *cTabBarItemView;
@property(nonatomic,copy)NSString *badge;

@end
