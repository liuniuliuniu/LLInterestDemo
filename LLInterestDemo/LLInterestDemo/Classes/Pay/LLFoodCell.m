//
//  LLFoodCell.m
//  LLInterestDemo
//
//  Created by liushaohua on 16/11/21.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLFoodCell.h"
#import "Masonry.h"

@interface LLFoodCell ()

@property (nonatomic, weak)UILabel *lab;

@end



@implementation LLFoodCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
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
        make.edges.equalTo(self.contentView);
    }];
    
    self.lab = lab;
}


- (void)setIndexP:(NSIndexPath* )indexP{
    _indexP = indexP;
    
    self.lab.text = [NSString stringWithFormat:@"第%zd类",indexP.row];
    
}

@end
