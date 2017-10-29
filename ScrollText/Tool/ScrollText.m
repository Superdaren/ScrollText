//
//  SYCleanStatusView.m
//  Clean
//
//  Created by yg lin on 2017/10/17.
//  Copyright © 2017年 syteam.com. All rights reserved.
//

#import "ScrollText.h"

#define width self.bounds.size.width
#define height (self.bounds.size.height / 2)

@interface ScrollText()
{
    NSInteger       _index;
    NSTimeInterval  _interval;
}

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;

@property (nonatomic, strong) NSMutableArray *labels;

@property (nonatomic, assign) ScrollDirectType direction;

@end

@implementation ScrollText


- (instancetype)initWithTextsArr:(NSArray *)textsArr {
    if (self = [super init]) {
        [self initWithTexts:textsArr];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame texts:(NSArray *)textsArr direction:(ScrollDirectType)direction
{
    if (self = [super initWithFrame:frame]) {
        self.direction = direction;
        [self initWithTexts:textsArr];
    }
    return self;
}

- (void)initWithTexts:(NSArray *)textsArr
{
    _textsArr = textsArr;
    self.clipsToBounds = true;
    if (self.direction == ScrollDirectDownType) {
        self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, -height, width, height)];
        self.label1.backgroundColor = [UIColor clearColor];
        
        self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 2 * height, width, height)];
        self.label2.backgroundColor = [UIColor clearColor];
        
        self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, height, width, height)];
        self.label3.backgroundColor = [UIColor clearColor];
        
        self.label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.label4.backgroundColor = [UIColor clearColor];
    } else {
        self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 2 * height, width, height)];
        self.label1.backgroundColor = [UIColor clearColor];
        
        self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, -height, width, height)];
        self.label2.backgroundColor = [UIColor clearColor];
        
        self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.label3.backgroundColor = [UIColor clearColor];
        
        self.label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, height, width, height)];
        self.label4.backgroundColor = [UIColor clearColor];
    }
    
    
    [self addSubview:self.label1];
    [self addSubview:self.label2];
    [self addSubview:self.label3];
    [self addSubview:self.label4];
    
    self.labels = [NSMutableArray arrayWithObjects:self.label1,self.label2, self.label3, self.label4, nil];
    
    if (self.direction == ScrollDirectDownType) {
        _index = 0;
    } else {
        _index = 0;
    }
    
    
    self.label1.text = _textsArr[0];
    self.font = [UIFont systemFontOfSize:height];
    self.textColor = [UIColor blackColor];
    self.textAlignment = NSTextAlignmentCenter;
    self.textsArr = textsArr;
    self.timeInterval = 6;
    self.alpha = 0.3;
}

- (void)startCycling
{
    if (self.repeat) {
        if (_index == _textsArr.count && !self.repeat) {
            return;
        }
        if (_index == _textsArr.count) {
            _index = 0;
        }
    } else {
        if (_index > _textsArr.count && !self.repeat) {
            return;
        }
        if (_index > _textsArr.count) {
            _index = 0;
        }
    }
    
    
    UILabel *label = self.labels[0];
    [self.labels removeObjectAtIndex:0];
    [self.labels addObject:label];
    
    [UIView animateWithDuration:0.5 animations:^{
        UILabel *label2 = self.labels[1];
        UILabel *label3 = self.labels[2];
        UILabel *label4 = self.labels[3];
        if (self.direction == ScrollDirectDownType) {
            label2.frame = CGRectMake(0, 2 * height, width, height);
            label2.alpha = 1;
            label3.frame = CGRectMake(0, height, width, height);
            label3.alpha = 1;
        } else {
            label2.frame = CGRectMake(0, -height, width, height);
            label2.alpha = 1;
            label3.frame = CGRectMake(0, 0, width, height);
            label3.alpha = 1;
        }
        
        label4.alpha = self.alpha;
        
        if (!self.repeat && _index >= _textsArr.count) {
            return;
        }
        
        if (self.direction == ScrollDirectDownType) {
            label4.frame = CGRectMake(0, 0, width, height);
        } else {
            label4.frame = CGRectMake(0, height, width, height);
        }
    } completion:^(BOOL finished) {
        UILabel *label1 = self.labels[0];
        if (self.direction == ScrollDirectDownType) {
            label1.frame = CGRectMake(0, -height, width, height);
        } else {
            label1.frame = CGRectMake(0, 2 * height, width, height);
        }
        
        if (_index < _textsArr.count) {
            label1.text = _textsArr[_index];
            label1.alpha = self.alpha;
        } else {
            label1.text = _textsArr[0];
            label1.alpha = self.alpha;
        }
    }];
    _index += 1;
    [self performSelector:@selector(startCycling) withObject:nil afterDelay:self.timeInterval];
}


#pragma mark - setter
- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.label1.textColor = _textColor;
    self.label2.textColor = _textColor;
    self.label3.textColor = _textColor;
    self.label4.textColor = _textColor;
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _textAlignment = textAlignment;
    self.label1.textAlignment = _textAlignment;
    self.label2.textAlignment = _textAlignment;
    self.label3.textAlignment = _textAlignment;
    self.label4.textAlignment = _textAlignment;
}
- (void)setFont:(UIFont *)font {
    _font = font;
    self.label1.font = _font;
    self.label2.font = _font;
    self.label3.font = _font;
    self.label4.font = _font;
}

- (NSMutableArray *)labels {
    if (!_labels) {
        _labels = [NSMutableArray array];
    }
    
    return _labels;
}

@end
