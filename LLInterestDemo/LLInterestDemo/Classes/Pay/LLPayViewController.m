//
//  LLPayViewController.m
//  LLInterestDemo
//
//  Created by liushaohua on 16/11/21.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLPayViewController.h"

#import "Masonry.h"


static NSString *tvCategoryID = @"tvCategory";

static NSString *tvFoodID = @"tvFood";

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
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    // MARK: - 1.两个列表视图
    // 分类列表
    UITableView *tvCategory = [[UITableView alloc] init];
    
    [self.view addSubview:tvCategory];
    
    [tvCategory mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(86);
        make.left.top.equalTo(self.view);
        
        // 一定要是 -46!
        make.bottom.equalTo(self.view).offset(-46);
        
    }];
    
    // 菜品列表
    UITableView *tvFood = [[UITableView alloc] init];
    
    [self.view addSubview:tvFood];
    
    [tvFood mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(tvCategory);
        make.left.equalTo(tvCategory.mas_right);
        make.right.equalTo(self.view);
        
    }];
    
    // MARK: - 1.2 统一设置列表对应的属性!
    tvCategory.dataSource = self;
    tvCategory.delegate = self;
    
    tvFood.dataSource = self;
    tvFood.delegate = self;
    
    
    // 注册 cell
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









@end
