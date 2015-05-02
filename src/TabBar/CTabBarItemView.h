//
//  CTabBarItemView.h
//  CTabBarController
//
//  Created by Ogan Topkaya on 02/05/15.
//  Copyright (c) 2015 Ogan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    CTabBarItemStateNormal,
    CTabBarItemStateHighlighted,
    CTabBarItemStateSelected,
    CTabBarItemStateDisabled,
} CTabBarItemState;


@protocol CTabBarItemView <NSObject>

@required
- (UIView <CTabBarItemView>*)cTabBarItemViewForState:(CTabBarItemState)state;
- (void)setBadge:(NSString *)badge;

@end

