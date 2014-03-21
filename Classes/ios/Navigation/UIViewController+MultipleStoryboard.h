//
//  UIViewController+MultipleStoryboard.h
//  ZauberCommons
//
//  Created by Hernan Zalazar on 25/2/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MultipleStoryboard)

- (void)presentInitialViewControllerFromStoryboard:(NSString *)storyboardName;
- (void)presentInitialViewControllerFromStoryboard:(NSString *)storyboardName initialization:(void (^)(id))initialization;

- (void)presentViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName;
- (void)presentViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName initialization:(void (^)(id))initialization;

@end
