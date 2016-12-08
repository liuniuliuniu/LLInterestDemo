//
//  LLCateoryCell.m
//  LLInterestDemo
//
//  Created by liushaohua on 16/11/21.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLCateoryCell.h"
#import "Masonry.h"

@interface LLCateoryCell ()

@property (nonatomic, weak)UILabel *lab;

@end



@implementation LLCateoryCell

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
    lab.font = [UIFont systemFontOfSize:15];
    
    lab.textAlignment = NSTextAlignmentCenter;
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    self.lab = lab;
}

- (void)setIndexP:(NSIndexPath* )indexP{
    _indexP = indexP;
    
    self.lab.text = [NSString stringWithFormat:@"我是%zd组",indexP.row];


}



@end
