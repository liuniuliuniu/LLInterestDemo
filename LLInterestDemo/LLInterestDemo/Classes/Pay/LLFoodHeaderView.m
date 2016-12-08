//
//  LLFoodHeaderView.m
//  LLInterestDemo
//
//  Created by liushaohua on 16/11/21.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLFoodHeaderView.h"
#import "Masonry.h"

@interface LLFoodHeaderView ()

/**
 设置组标题的控件
 */
@property (nonatomic, weak) UILabel *lab;

@end

@implementation LLFoodHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
    
}

#pragma mark - 搭建界面
- (void)setupUI
{
    
    UILabel *lab = [[UILabel alloc]init];
    [self.contentView addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.top.bottom.right.equalTo(self.contentView);
    }];
    self.lab = lab;
}

- (void)setSection:(NSInteger)section{
    _section = section;
    self.lab.text = [NSString stringWithFormat:@"---我是%zd组---",section];

}


@end
