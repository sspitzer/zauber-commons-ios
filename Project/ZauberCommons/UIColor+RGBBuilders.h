//
//  UIColor+RGBBuilders.h
//  ZauberCommons
//
//  Created by Hernan Zalazar on 11/3/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RGBBuilders)

+ (UIColor*) colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue;

+ (UIColor*) colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue alpha:(CGFloat)alpha;

@end
