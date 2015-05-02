//
//  CImageTabBarItem.m
//  CTabBarControllerDemo
//
//  Created by Ogan Topkaya on 09/11/14.
//  Copyright (c) 2014 Ogan Topkaya. All rights reserved.
//

#import "CImageTabBarItem.h"

@interface CImageTabBarItemView()

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)NSMutableDictionary *titleForState;
@property(nonatomic,strong)NSMutableDictionary *imageForState;
@property(nonatomic,strong)NSMutableDictionary *colorForState;

@property(nonatomic,strong)UILabel *badgeLabel;
@end


@implementation CImageTabBarItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectZero];
    [self configure];
    return self;
}

- (instancetype)init{
    self = [super init];
    [self configure];
    return self;
}

- (void)configure{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:10.0f];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeCenter;
    [self addSubview:self.imageView];
    
    self.badgeLabel = [[UILabel alloc] init];
    self.badgeLabel.backgroundColor = [UIColor redColor];
    self.badgeLabel.textColor = [UIColor whiteColor];
    self.badgeLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    self.badgeLabel.layer.borderWidth = 2.0f;
    self.badgeLabel.layer.cornerRadius = 10.0f;
    self.badgeLabel.layer.masksToBounds = YES;
    self.badgeLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeLabel.adjustsFontSizeToFitWidth = YES;
    self.badgeLabel.minimumScaleFactor = 0.3f;
    self.badgeLabel.font = [UIFont boldSystemFontOfSize:10];
    self.badgeLabel.hidden = YES;
    self.badgeLabel.layer.anchorPoint = CGPointMake(0.5f, 0.5f);
    [self addSubview:self.badgeLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    BOOL titleExists = (self.titleLabel.text && ![self.titleLabel.text isEqualToString:@""]);
    CGFloat yInset = titleExists ? 10.0f : 0.0f;
    CGFloat imageRatio = titleExists ? 0.5f : 1.0f;
    
    [self.imageView setFrame:CGRectMake(0, yInset, self.bounds.size.width, self.bounds.size.height * imageRatio)];
    
    if (titleExists) {
        [self.titleLabel setFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.bounds.size.width, self.bounds.size.height - CGRectGetMaxY(self.imageView.frame))];
    }
    else{
        [self.titleLabel setFrame:CGRectZero];
    }
    
    self.badgeLabel.frame = CGRectMake(0, 0, 20, 20);
    self.badgeLabel.center = CGPointMake(self.imageView.center.x + self.imageView.image.size.width / 2,self.imageView.center.y -self.imageView.image.size.height / 2);
}

- (void)setTitle:(NSString *)title image:(UIImage*)image titleColor:(UIColor *)titleColor forState:(CTabBarItemState)state{
    self.titleForState[@(state)] = title;
    self.imageForState[@(state)] = image;
    self.colorForState[@(state)] = titleColor;
}


- (UIView<CTabBarItemView> *)cTabBarItemViewForState:(CTabBarItemState)state{
    self.titleLabel.textColor = self.colorForState[@(state)];
    self.titleLabel.text = self.titleForState[@(state)];
    self.imageView.image = self.imageForState[@(state)];
    return self;
}

- (void)setBadge:(NSString *)badge{
    self.badgeLabel.text = badge;
    self.badgeLabel.hidden = !badge || [badge isEqualToString:@""];
}

- (NSMutableDictionary *)titleForState{
    if(!_titleForState){
        _titleForState = [NSMutableDictionary dictionary];
    }
    return _titleForState;
}
- (NSMutableDictionary *)imageForState{
    if(!_imageForState){
        _imageForState = [NSMutableDictionary dictionary];
    }
    return _imageForState;
}
- (NSMutableDictionary *)colorForState{
    if(!_colorForState){
        _colorForState = [NSMutableDictionary dictionary];
    }
    return _colorForState;
}

@end