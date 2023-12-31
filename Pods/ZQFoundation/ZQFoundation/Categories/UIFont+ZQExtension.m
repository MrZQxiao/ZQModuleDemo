//
//  UIFont+MSExtension.m
//  MIS
//
//  Created by LIUZHEN on 2016/12/19.
//  Copyright © 2016年 58. All rights reserved.
//

#import "UIFont+ZQExtension.h"
#import "UIDevice+ZQExtension.h"


@implementation UIFont (MSExtension)

+ (UIFont *)ms_lantingFontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"FZLanTingHei-EL-GBK" size:fontSize];
}

+ (UIFont *)ms_helveticaFontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Helvetica Neue" size:fontSize];
}

+ (UIFont *)ms_numberFontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"AvenirNext-Bold" size:fontSize];
}

+ (UIFont *)ms_normalFontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:UIDevice.systemVersionNumber >= 9 ? @"Helvetica Neue" : @"Heiti SC" size:fontSize];
}

+ (UIFont *)ms_boldFontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:UIDevice.systemVersionNumber >= 9 ? @"HelveticaNeue-Bold":@"STHeitiSC-Medium" size:fontSize];
}

+ (UIFont *)ms_extraSmallFont {
    return [UIFont systemFontOfSize:12];
}

+ (UIFont *)ms_extraSmallBoldFont {
    return [UIFont boldSystemFontOfSize:12];
}

+ (UIFont *)ms_smallFont {
    return [UIFont systemFontOfSize:14];
}

+ (UIFont *)ms_smallBoldFont {
    return [UIFont boldSystemFontOfSize:14];
}

+ (UIFont *)ms_normalFont {
    return [UIFont systemFontOfSize:16];
}

+ (UIFont *)ms_normalBoldFont {
    return [UIFont boldSystemFontOfSize:16];
}

+ (UIFont *)ms_largeFont {
    return [UIFont systemFontOfSize:18];
}

+ (UIFont *)ms_largeBoldFont {
    return [UIFont boldSystemFontOfSize:18];
}

+ (UIFont *)ms_extraLargeFont {
    return [UIFont systemFontOfSize:20];
}

+ (UIFont *)ms_extraLargeBoldFont {
    return [UIFont systemFontOfSize:20];
}

@end
