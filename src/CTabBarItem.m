//
//  CTabBarItem.m
//  CTabBarControllerDemo
//
//  Created by Ogan Topkaya on 09/11/14.
//  Copyright (c) 2014 Ogan Topkaya. All rights reserved.
//

#import "CTabBarItem.h"

@implementation CTabBarItem

- (void)setBadge:(NSString *)badge{
    _badge = [badge copy];
    [self.cTabBarItemView setBadge:badge];
}


@end