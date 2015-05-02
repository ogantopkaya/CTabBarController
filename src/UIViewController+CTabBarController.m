//
//  UIViewController+CTabBarController.m
//  CTabBarController
//
//  Created by Ogan Topkaya on 02/05/15.
//  Copyright (c) 2015 Ogan. All rights reserved.
//

#import "UIViewController+CTabBarController.h"
#import "CTabBarController.h"
#import <objc/runtime.h>

@implementation UIViewController (CTabBarController)

- (void)setCTabBarItem:(CTabBarItem *)cTabBarItem{
    objc_setAssociatedObject(self, @selector(cTabBarItem), cTabBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CTabBarItem *) cTabBarItem {
    id nextResponder= self;
    
    do {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            id tabBarItem = objc_getAssociatedObject(nextResponder, @selector(cTabBarItem));
            if (tabBarItem) {
                return tabBarItem;
            }
        }
        nextResponder = [nextResponder nextResponder];
    } while (nextResponder);
    
    return nil;
}

- (CTabBarController *)cTabBarController{
    id nextResponder= self;

    do {
        if ([nextResponder isKindOfClass:[CTabBarController class]]) {
            return nextResponder;
        }
        nextResponder = [nextResponder nextResponder];
    } while (nextResponder);
    
    return nil;
}

@end


@implementation UIViewController(CNavigationController)

-(void)setHidesCTabBarWhenPushed:(BOOL)hidesCTabBarWhenPushed{
    objc_setAssociatedObject(self, @selector(hidesCTabBarWhenPushed), @(hidesCTabBarWhenPushed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hidesCTabBarWhenPushed{
    return [objc_getAssociatedObject(self, @selector(hidesCTabBarWhenPushed)) boolValue];
}


@end