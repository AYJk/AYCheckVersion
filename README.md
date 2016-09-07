# AYCheckVersion

[![LICENSE](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/AYJk/AYPageControl/blob/master/License)&nbsp;
[![SUPPORT](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg)](https://en.wikipedia.org/wiki/IOS_7)&nbsp;
![CocoaPods Version](https://img.shields.io/badge/pod-v1.1.0-brightgreen.svg)
[![BLOG](https://img.shields.io/badge/blog-ayjkdev.top-orange.svg)](http://ayjkdev.top/)&nbsp;

我的博客中有详尽的实现过程和相关说明：
[iOS利用iTunesLookup检查更新](http://ayjkdev.top/2016/04/06/update-in-app-with-itunes-lookup/)

# 介绍

这是一个从AppStore检测最新版本的工具类。
*Debug环境下输出取回的应用更新信息，Release环境下不输出*
# 安装

推荐使用[CocoaPods](http://cocoapods.org/)进行安装。

```ruby
pod 'AYCheckVersion'
```

然后输入 `pod install` or `pod update`。将会安装最新版本的AYCheckVersion。

最后导入头文件\<AYCheckVersion/AYCheckVersion.h\>

# 用法

```objc
AYCheckManager *checkManger = [AYCheckManager sharedCheckManager];
[checkManger checkVersion];
```

使用默认属性进行版本的检测。

```objc
- (void)checkVersion;
```

自定义警示框的标题，下次提示的标题，立即更新的标题。

```objc
- (void)checkVersionWithAlertTitle:(NSString *)alertTitle nextTimeTitle:(NSString *)nextTimeTitle confimTitle:(NSString *)confimTitle;
```

自定义警示框的标题，下次提示的标题，立即更新的标题，跳过该版本的标题。

```objc
- (void)checkVersionWithAlertTitle:(NSString *)alertTitle nextTimeTitle:(NSString *)nextTimeTitle confimTitle:(NSString *)confimTitle skipVersionTitle:(NSString *)skipVersionTitle;
```

如果你想在当前应用中以模态视图的形式打开AppStore，请设置`openAPPStoreInsideAPP`，默认从应用跳转出去到AppStore。

```objc
checkManger.openAPPStoreInsideAPP = YES;
```

如果你无法检测到你的App的最新版。请设置你应用的销售地区，如：`countryAbbreviation = @"cn"`,`countryAbbreviation = @"us"`。通常情况下，你不需要设置这个属性。

```objc
checkManger.countryAbbreviation = @"cn";
```

# 版本更新

v 1.1.2 修复由于iTunes被墙使返回的data为nil所导致的异常 [issues3](https://github.com/AYJk/AYCheckVersion/issues/3)，去除debug开关，debug环境下默认输出更新内容

v 1.1.0 修复因项目个别version问题导致的bug

v 1.0.1 添加debug开关，输出当前更新信息

v 1.0.0 首次提交

# 许可证

AYCheckVersion 使用 MIT 许可证，详情见 LICENSE 文件。	


