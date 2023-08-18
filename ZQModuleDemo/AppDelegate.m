//
//  AppDelegate.m
//  ZQModuleDemo
//
//  Created by LY on 2023/8/16.
//

#import "AppDelegate.h"
#import <ZQRouter/ZQRouter+Home.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] init];
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ZQRouter Home_main]];
    [tabbar addChildViewController:nav];
    self.window.rootViewController = tabbar;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}






@end
