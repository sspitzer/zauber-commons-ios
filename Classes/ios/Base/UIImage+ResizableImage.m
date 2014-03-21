//
//  UIImage+ResizableImage.m
//  ZauberCommons
//
//  Created by Hernan Zalazar on 11/3/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import "UIImage+ResizableImage.h"

@implementation UIImage (ResizableImage)

+ (UIImage*)resizableImageNamed:(NSString *)imageName capInsets:(UIEdgeInsets)capInsets {
    return [[UIImage imageNamed:imageName] resizableImageWithCapInsets:capInsets];
}

+ (UIImage*)resizableImageNamed:(NSString *) imageName capInsets:(UIEdgeInsets) capInsets resizeMode:(UIImageResizingMode) resizeMode {
    return [[UIImage imageNamed:imageName] resizableImageWithCapInsets:capInsets resizingMode:resizeMode];
}

@end
