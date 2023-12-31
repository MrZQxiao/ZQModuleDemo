//
//  UIView+MSExtension.m
//  MIS
//
//  Created by LIUZHEN on 2017/2/7.
//  Copyright © 2017年 58. All rights reserved.
//

#import "UIView+ZQExtension.h"
#import "objc/runtime.h"

@implementation UIView (ZQExtension)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(addSubview:)),
                                   class_getInstanceMethod([self class], @selector(ms_addSubview:)));
}

- (void)ms_addSubview:(UIView *)view {
    if ([view isEqual:self]) {
        return;
    }
    [self ms_addSubview:view];
}

- (CGFloat)ms_left {
    return self.frame.origin.x;
}

- (void)setMs_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)ms_top {
    return self.frame.origin.y;
}

- (void)setMs_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)ms_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMs_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)ms_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setMs_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)ms_width {
    return self.frame.size.width;
}

- (void)setMs_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)ms_height {
    return self.frame.size.height;
}

- (void)setMs_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)ms_centerX {
    return self.center.x;
}

- (void)setMs_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)ms_centerY {
    return self.center.y;
}

- (void)setMs_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)ms_origin {
    return self.frame.origin;
}

- (void)setMs_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)ms_size {
    return self.frame.size;
}

- (void)setMs_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (UIViewController *)viewController {
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}


- (void)ms_layerViewCornerRadii:(CGFloat)cornerRadii byRoundingCorners:(UIRectCorner)corners {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(cornerRadii, cornerRadii)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path  = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
@end
