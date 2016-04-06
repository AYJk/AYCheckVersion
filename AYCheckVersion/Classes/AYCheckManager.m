//
//  AYCheckManager.m
//  AYCheckVersion
//
//  Created by Andy on 16/4/6.
//  Copyright © 2016年 AYJkdev. All rights reserved.
//

#import "AYCheckManager.h"
#define RequestSucceed 200
#define CurrentVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define BundleIdentifier [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define APPLastVersion @"APPLastVersion"
#define APPReleaseNotes @"APPReleaseNotes"
#define SpecicalModeCheckURL @"https://itunes.apple.com/lookup?country=%@&bundleId=%@"
#define NormalModeCheckURL @"https://itunes.apple.com/lookup?bundleId=%@"
@implementation AYCheckManager

static AYCheckManager *checkManager = nil;
+ (instancetype)shareCheckManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        checkManager = [[AYCheckManager alloc] init];
    });
    return checkManager;
}

- (void)checkVersion {

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if (![[userDefault objectForKey:APPLastVersion] isEqualToString:CurrentVersion]) {
        [checkManager getInfoFromAppStore];
    }
}

- (void)getInfoFromAppStore {
    
    NSURL *requestURL;
    if (self.countryAbbreviation == nil) {
        requestURL = [NSURL URLWithString:[NSString stringWithFormat:NormalModeCheckURL,BundleIdentifier]];
    } else {
        requestURL = [NSURL URLWithString:[NSString stringWithFormat:SpecicalModeCheckURL,self.countryAbbreviation,BundleIdentifier]];
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        
        if (urlResponse.statusCode == RequestSucceed) {
            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([responseDic[@"resultCount"] intValue] == 1) {
                NSArray *results = responseDic[@"results"];
                NSDictionary *resultDic = [results firstObject];
                [[NSUserDefaults standardUserDefaults] setObject:resultDic[@"version"] forKey:APPLastVersion];
                [[NSUserDefaults standardUserDefaults] setObject:resultDic[@"releaseNotes"] forKey:APPReleaseNotes];
            }
            NSLog(@"%@   %@",[[NSUserDefaults standardUserDefaults] objectForKey:APPLastVersion],[[NSUserDefaults standardUserDefaults] objectForKey:APPReleaseNotes]);
        }
    }];
    [dataTask resume];
}

@end
