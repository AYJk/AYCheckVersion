//
//  AYCheckManager.h
//  AYCheckVersion
//
//  Created by Andy on 16/4/6.
//  Copyright © 2016年 AYJkdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AYCheckManager : NSObject
/**
 *  open APPStore inside your APP, default is Yes.
 */
@property (nonatomic, assign) BOOL openAPPStoreInsideAPP;
//  if you can't get the update info of your APP. Set countryAbbreviation of the sale area. like `countryAbbreviation = @"cn"`,`countryAbbreviation = @"us"`.General, you don't need set this property.
@property (nonatomic, copy) NSString *countryAbbreviation;

+ (instancetype)shareCheckManager;
- (void)checkVersion;

@end
