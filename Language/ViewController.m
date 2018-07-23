//
//  ViewController.m
//  Language
//
//  Created by appteam on 2017/3/21.
//  Copyright © 2017年 colin.liu. All rights reserved.
//

#import "ViewController.h"
#import "NSBundle+Language.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NSBundle setLangage:@"zh-Hant"];
    NSLog(@"%@",NSLocalizedString(@"love", nil));
    
    //切换示例https://www.jianshu.com/p/b4288e5e6e4c
//    UITabBarController *tbc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
//    //跳转到个人中心
//    tbc.selectedIndex = 4;
//    //创建设置页面
//    UWSettingViewController *vc1 = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([UWSettingViewController class])];
//    vc1.hidesBottomBarWhenPushed = YES;
//    //创建语言切换页
//    UWLanguageSettingsViewController *vc2 = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([UWLanguageSettingsViewController class])];
//    vc2.hidesBottomBarWhenPushed = YES;
//    UINavigationController *nvc = tbc.selectedViewController;
//    //备用
//    NSMutableArray *vcs = nvc.viewControllers.mutableCopy;
//    [vcs addObjectsFromArray:@[vc1, vc2]];
//    //解决奇怪的动画bug。异步执行
//    dispatch_async(dispatch_get_main_queue(), ^{
//        //注意刷新rootViewController的时机，在主线程异步执行
//        //先刷新rootViewController
//        [UIApplication sharedApplication].keyWindow.rootViewController = tbc;
//        //然后再给个人中心的nvc设置viewControllers
//        nvc.viewControllers = vcs;
//        //一些UI提示，可以提供更友好的用户交互（也可以删掉）
//        [UWProgressHUD showLoadingWithMessage:NSLocalizedString(UWSettingMessage, nil)];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [UWProgressHUD dismiss];
//        });
//    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
