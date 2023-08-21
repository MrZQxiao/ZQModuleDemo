//
//  AppDelegate.m
//  ZQModuleDemo
//
//  Created by LY on 2023/8/16.
//

#import "AppDelegate.h"
#import <ZQRouter/ZQRouter+Home.h>
#import <ZQRouter/ZQRouter+Mine.h>
#import <ZQRouter/ZQModule.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[ModuleManage shareInstance] triggerEvent:kModInstallEvent];

    self.window = [[UIWindow alloc] init];
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ZQRouter Home_main]];
    [tabbar addChildViewController:nav];

    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[ZQRouter Mine_main]];
    [tabbar addChildViewController:nav1];

    self.window.rootViewController = tabbar;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    ModuleStudio.shareInstance.context.launchOptions = launchOptions;

    [[ModuleManage shareInstance] triggerEvent:kModDidFinishLaunchingEvent];
    return YES;
}






@end
