//
//  UIColor+RGBBuilders.m
//  ZauberCommons
//
//  Created by Hernan Zalazar on 11/3/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import "UIColor+RGBBuilders.h"

@implementation UIColor (RGBBuilders)

+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue {
    return [UIColor colorWithR:red g:green b:blue alpha:1.0f];
}

+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0 alpha:alpha];
}
@end
