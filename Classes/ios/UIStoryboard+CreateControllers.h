//
//  UIStoryboard+CreateControllers.h
//  ZauberCommons
//
//  Created by Hernan Zalazar on 11/3/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (CreateControllers)

+ (id) instantiateViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName;

+ (id) instantiateInitialViewControllerFromStoryboard:(NSString *)storyboardName;

@end
