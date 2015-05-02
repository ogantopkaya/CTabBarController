//
//  CTabBar.h
//  ParseDemo
//
//  Created by Ogan on 07/11/14.
//  Copyright (c) 2014 Peak Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CTabBarDelegate;
@protocol CTabBar <NSObject>

@required
@property(nonatomic,assign)id<CTabBarDelegate>delegate;
@property(strong,nonatomic) NSArray *tabBarItems;
@property(nonatomic)NSInteger selectedIndex;

@required
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;

@end


@protocol CTabBarDelegate <NSObject>

- (void)cTabBar:(id<CTabBar>)cTabBar didSelectItemAtIndex:(NSInteger)index;

@end
