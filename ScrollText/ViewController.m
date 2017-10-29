//
//  ViewController.m
//  ScrollText
//
//  Created by super on 2017/10/28.
//  Copyright © 2017年 super. All rights reserved.
//

#import "ViewController.h"
#import "ScrollText.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ScrollText *label = [[ScrollText alloc] initWithFrame:CGRectMake(0, 255, kScreenWidth, 40) texts:[self getScanningString] direction:ScrollDirectDownType];
    label.timeInterval = 1;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor blackColor];
    label.repeat = YES;
    [label startCycling];
    
    [self.view addSubview:label];
}

- (NSArray *)getScanningString {
    return @[@"我叶良辰你惹不起",
             @"出来混的都知道我的规矩",
             @"不听我劝 我行我素 莫得关系",
             @"不过你将来 日子绝对不会再过得舒心 舒心",
             @"我是本地人?名字叫做叶良辰",
             @"地盘敢抢到天安门",
             @"中南海去砍过人 我就是叶良辰",
             @"良辰?良辰",
             @"良辰不是你能惹起的人"];
}

@end
