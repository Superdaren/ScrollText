//
//  SYCleanStatusView.h
//  Clean
//
//  Created by yg lin on 2017/10/17.
//  Copyright © 2017年 syteam.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ScrollDirectType) {
    ScrollDirectUpType,
    ScrollDirectDownType
};

extern const  NSTimeInterval BeginTime;

@interface ScrollText : UIView

@property (nonatomic, copy) NSArray *textsArr;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) CGFloat timeInterval;
@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, assign) BOOL repeat;

- (instancetype)initWithFrame:(CGRect)frame texts:(NSArray *)textsArr direction:(ScrollDirectType) direction;

- (void)startCycling;

@end
