//
//  UINavigationController+MultipleStoryboard.h
//  ZauberCommons
//
//  Created by Hernan Zalazar on 25/2/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (MultipleStoryboard)

- (void)pushInitialViewControllerFromStoryboard:(NSString *)storyboardName;
- (void)pushInitialViewControllerFromStoryboard:(NSString *)storyboardName initialization:(void (^)(id controller)) initialization;

- (void)pushViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName;
- (void)pushViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName initialization:(void (^)(id controller)) initialization;

@end
