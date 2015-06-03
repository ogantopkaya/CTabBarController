//
//  BottomTabBar.m
//  CTabBarController
//
//  Created by Ogan Topkaya on 02/05/15.
//  Copyright (c) 2015 Ogan. All rights reserved.
//

#import "BottomTabBar.h"


@interface BottomTabBar()

@property(nonatomic,strong)UIView *bottomBarContainer;
@property(nonatomic,strong)UIVisualEffectView *visualEffectView;
@property(nonatomic,strong)UIView *seperatorView;

@end

@implementation BottomTabBar

@synthesize delegate = _delegate;
@synthesize tabBarItems = _tabBarItems;
@synthesize selectedIndex = _selectedIndex;


-(void)awakeFromNib{
    [self configure];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self configure];
    return self;
}

-(void)configure{
    [self removeAllSubviews];

//    self.backgroundColor = [UIColor clearColor];
    
    self.bottomBarContainer = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomBarContainer.backgroundColor = [UIColor colorWithWhite:0.96 alpha:0.4];
    [self addSubview:self.bottomBarContainer];
    
    self.seperatorView = [[UIView alloc] initWithFrame:CGRectZero];
    self.seperatorView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1.0];
    [self.bottomBarContainer addSubview:self.seperatorView];
    
    if ([UIVisualEffect class]) {
        self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        [self.bottomBarContainer addSubview:self.visualEffectView];
    }
    
    [self.tabBarItems enumerateObjectsUsingBlock:^(CTabBarItem* tabItem, NSUInteger index, BOOL *stop) {
        UIView *tabItemView = [tabItem.cTabBarItemView cTabBarItemViewForState:(index == _selectedIndex ? CTabBarItemStateSelected : CTabBarItemStateNormal)];
        [self.bottomBarContainer addSubview:tabItemView];
    }];
}

- (void)setTabBarItems:(NSArray *)tabBarItems{
    _tabBarItems = tabBarItems;
    [self configure];
}

- (void)layoutSubviews{
    [super layoutSubviews];

    self.bottomBarContainer.frame = CGRectMake(0,
                                               self.bounds.size.height - self.tabBarHeight,
                                               self.bounds.size.width,
                                               self.tabBarHeight);
    self.seperatorView.frame = CGRectMake(0, 0, self.bottomBarContainer.bounds.size.width, 0.5);
    if ([UIVisualEffect class]) {
        self.visualEffectView.frame = self.bottomBarContainer.bounds;
    }
    [self layoutTabs];
}

- (void)layoutTabs{
    NSInteger count = self.tabBarItems.count;
    CGRect bounds = self.bottomBarContainer.bounds;
    CGFloat tabItemWidth = bounds.size.width / count;
    CGFloat tabItemHeight = bounds.size.height;
    [self.tabBarItems enumerateObjectsUsingBlock:^(CTabBarItem* tabItem, NSUInteger index, BOOL *stop) {
        UIView *tabItemView = [tabItem.cTabBarItemView cTabBarItemViewForState:(index == _selectedIndex ? CTabBarItemStateSelected : CTabBarItemStateNormal)];
        [tabItemView setFrame:CGRectMake(index * tabItemWidth, 0, tabItemWidth, tabItemHeight)];
    }];
}

- (void)setTabBarHeight:(CGFloat)tabBarHeight{
    _tabBarHeight = tabBarHeight;
    [self configure];
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    return CGRectContainsPoint(self.bottomBarContainer.frame, point);
}

-(void)removeAllSubviews{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    [self layoutTabs];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    NSInteger tabIndex = [self indexForTouchPosition:touchPoint];
    
    if (tabIndex != NSNotFound) {
        self.selectedIndex = tabIndex;
        [self.delegate cTabBar:self didSelectItemAtIndex:tabIndex];
    }
}

-(NSInteger)indexForTouchPosition:(CGPoint)touchPoint{
    NSInteger count = self.tabBarItems.count;
    CGRect bounds = self.bounds;
    CGFloat tabItemWidth = bounds.size.width / count;
    CGFloat tabItemHeight = bounds.size.height;
    
    for (int i = 0; i<count; i++) {
        CGRect itemTabFrame = CGRectMake(i * tabItemWidth, 0, tabItemWidth, tabItemHeight);
        if(CGRectContainsPoint(itemTabFrame, touchPoint)){
            return i;
        }
    }
    return NSNotFound;
}

@end
