//
//  LLInterestTabBarController.m
//  LLInterestDemo
//
//  Created by liushaohua on 16/11/21.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLInterestTabBarController.h"

@interface LLInterestTabBarController ()

@end

@implementation LLInterestTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建消息
    UIViewController *v1 = [self loadClassName:@"LLPayViewController" andTitle:@"支付宝" andImageName:@"TabBar_HomeBar_Spring"];
    UIViewController *v2 = [self loadClassName:@"LLShopViewController" andTitle:@"购物车" andImageName:@"TabBar_buy"];
    UIViewController *v3 = [self loadClassName:@"LLMapViewController"  andTitle:@"地图" andImageName:@"TabBar_Friends_Spring"];
    UIViewController *v4 = [self loadClassName:@"LLMineViewController" andTitle:@"我的" andImageName:@"TabBar_Assets_Spring"];
    
    self.viewControllers = @[v1,v2,v3,v4];

    [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blueColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabBarBg"];
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (UIViewController *)loadClassName:(NSString *)clsName andTitle:(NSString *)title andImageName:(NSString *)imgName
{
    Class cls = NSClassFromString(clsName);
    
    UIViewController *vc = [[cls alloc]init];
    
    //断言
    NSAssert([vc isKindOfClass:[UIViewController class]],@"%@控制器类名写错了",clsName);
    
    //设置标题
    vc.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[imgName stringByAppendingString:@"_Sel"]];
    
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.navigationBar.barTintColor = [UIColor greenColor];
    
    [nav.navigationBar setBarStyle:UIBarStyleBlack];
    
    return nav;
    
}





@end
