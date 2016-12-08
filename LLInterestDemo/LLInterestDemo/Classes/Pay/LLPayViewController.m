//
//  LLPayViewController.m
//  LLInterestDemo
//
//  Created by liushaohua on 16/11/21.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLPayViewController.h"
#import "LLCateoryCell.h"
#import "Masonry.h"
#import "LLFoodCell.h"
#import "LLFoodHeaderView.h"


#define LLSection 17

static NSString *cellID = @"cellID";
static NSString *headerID =  @"headerID";

@interface LLPayViewController ()<UITableViewDelegate,UITableViewDataSource>
// 分类列表
@property (nonatomic, weak) UITableView *tvCategory;

// 菜品列表
@property (nonatomic, weak) UITableView *tvFood;


@end

@implementation LLPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    
}
#pragma mark - 搭建界面
- (void)setupUI
{
    self.view.backgroundColor = [UIColor orangeColor];
    // MARK: - 1.两个列表视图
    // 分类列表
    UITableView *tvCategory = [[UITableView alloc] init];
    [self.view addSubview:tvCategory];
    [tvCategory mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(86);
        make.left.top.equalTo(self.view);
        // 一定要是 -46!
        make.bottom.equalTo(self.view);
        
    }];
    
    // 菜品列表
    UITableView *tvFood = [[UITableView alloc] init];
    
    [self.view addSubview:tvFood];
    
    [tvFood mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(tvCategory);
        make.left.equalTo(tvCategory.mas_right).offset(8);
        make.right.equalTo(self.view);
        
    }];
    
    // MARK: - 1.2 统一设置列表对应的属性!
    tvCategory.dataSource = self;
    tvCategory.delegate = self;
    
    tvFood.dataSource = self;
    tvFood.delegate = self;
    // 记录成员变量
    _tvCategory = tvCategory;
    _tvFood = tvFood;
    tvCategory.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 注册 cell
    [tvCategory registerClass:[LLCateoryCell class] forCellReuseIdentifier:cellID];
    [tvFood registerClass:[LLFoodCell class] forCellReuseIdentifier:cellID];
    [tvFood registerClass:[LLFoodHeaderView class] forHeaderFooterViewReuseIdentifier:headerID];
    
    // 一定要设置组头高度
    
#warning - newMethod 如果不设置组头的高度,不会调用返回组头视图的代理方法!
    tvFood.sectionHeaderHeight = 23;
    
}
#pragma mark - 代理方法
    // 方法调用:当用户滚动列表的时候,在将要显示新的cell的时候调用!
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    NSLog(@"xincell 出来了");
    if (tableView == _tvCategory) {
        return;
    }
    
    // 如果不是用户拖动的,直接忽略!
    if (!(tableView.dragging || tableView.decelerating || tableView.tracking)) {
        return;
    }
    // 菜品
    NSIndexPath *newPath = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
    // 让分类选中另外的行
    [_tvCategory selectRowAtIndexPath:newPath animated:NO scrollPosition:UITableViewScrollPositionTop];
    
}

// 选中行的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 分类的选中
    if (tableView == _tvCategory) {
        
        // 1.让菜品滚动!
        // 1.1 创建索引
        NSIndexPath *newPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        
#warning - newMethod 让列表视图进行滚动的方法
        /**
         参数1 要滚动到的行的索引信息!
         参数2 停留的位置
         */
        [_tvFood scrollToRowAtIndexPath:newPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        // 2.返回,防止往下走!
    }
    
    // 菜品的选中!
    
}

#pragma makr - 设置组头
// 组头部视图!
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    // 分类,直接忽略
    if (tableView == _tvCategory ) {
        return nil;
    }
    // 菜品!
    // 1.创建视图
    LLFoodHeaderView *headerV = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    // 2.设置数据!
    headerV.section = section;

    NSLog(@"-------%zd",section);
    
    // 3.返回
    return headerV;
    
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (tableView == _tvCategory) {
        return  1;
    }
    return LLSection;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == self.tvCategory) {
        return LLSection;
    }
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 1.创建cell 多态!
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (tableView == _tvCategory) {
        ((LLCateoryCell *)cell).indexP = indexPath;
        return cell;
    }
    ((LLFoodCell *)cell).indexP = indexPath;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









@end
