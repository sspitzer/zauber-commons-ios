//
//  UIImage+ResizableImage.h
//  ZauberCommons
//
//  Created by Hernan Zalazar on 11/3/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ResizableImage)

+ (UIImage*)resizableImageNamed:(NSString *)imageName capInsets:(UIEdgeInsets)capInsets;

+ (UIImage*)resizableImageNamed:(NSString*)imageName capInsets:(UIEdgeInsets)capInsets resizeMode:(UIImageResizingMode)resizeMode;

@end
