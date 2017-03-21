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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
