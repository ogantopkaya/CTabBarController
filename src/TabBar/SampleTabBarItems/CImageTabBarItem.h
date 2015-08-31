//
//  CImageTabBarItem.h
//  CTabBarControllerDemo
//
//  Created by Ogan Topkaya on 09/11/14.
//  Copyright (c) 2014 Ogan Topkaya. All rights reserved.
//

#import "CTabBarItem.h"

@interface CImageTabBarItemView : UIView<CTabBarItemView>

@property(nonatomic,strong,readonly)UIImageView *imageView;
@property(nonatomic,strong,readonly)UILabel *titleLabel;
@property(nonatomic,strong,readonly)UILabel *badgeLabel;

- (void)setTitle:(NSString *)title image:(UIImage*)image titleColor:(UIColor *)titleColor forState:(CTabBarItemState)state;

@end