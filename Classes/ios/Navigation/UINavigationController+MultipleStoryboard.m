//
//  UINavigationController+MultipleStoryboard.m
//  ZauberCommons
//
//  Created by Hernan Zalazar on 25/2/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import "UINavigationController+MultipleStoryboard.h"

@implementation UINavigationController (MultipleStoryboard)

- (void)pushInitialViewControllerFromStoryboard:(NSString *)storyboardName {
    [self pushInitialViewControllerFromStoryboard:storyboardName initialization:nil];
}

- (void)pushInitialViewControllerFromStoryboard:(NSString *)storyboardName initialization:(void (^)(id))initialization {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *controller = [storyboard instantiateInitialViewController];
    if (initialization) {
        initialization(controller);
    }
    [self pushViewController:controller animated:YES];
}

- (void)pushViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName {
    [self pushViewControllerWithIdentifier:identifier fromStoryboard:storyboardName initialization:nil];
}

- (void)pushViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName initialization:(void (^)(id))initialization {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:identifier];
    if (initialization) {
        initialization(controller);
    }
    [self pushViewController:controller animated:YES];
}
@end
