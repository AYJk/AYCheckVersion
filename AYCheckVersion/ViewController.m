//
//  ViewController.m
//  AYCheckVersion
//
//  Created by Andy on 16/4/6.
//  Copyright © 2016年 AYJkdev. All rights reserved.
//

#import "ViewController.h"
#import "AYCheckManager.h"

//com.tencent.xin
//com.facebook.Facebook
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AYCheckManager *checkManger = [AYCheckManager sharedCheckManager];
    checkManger.countryAbbreviation = @"cn";
//    checkManger.openAPPStoreInsideAPP = YES;
//    [checkManger checkVersion];
    [checkManger checkVersionWithAlertTitle:@"发现新版本" nextTimeTitle:@"下次提示" confimTitle:@"前往更新" skipVersionTitle:@"跳过当前版本"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
