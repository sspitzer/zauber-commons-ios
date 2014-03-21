//
//  UIViewController+MultipleStoryboard.m
//  ZauberCommons
//
//  Created by Hernan Zalazar on 25/2/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import "UIViewController+MultipleStoryboard.h"

@implementation UIViewController (MultipleStoryboard)

- (void)presentInitialViewControllerFromStoryboard:(NSString *)storyboardName {
    [self presentInitialViewControllerFromStoryboard:storyboardName initialization:nil];
}

- (void)presentInitialViewControllerFromStoryboard:(NSString *)storyboardName initialization:(void (^)(id))initialization {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *controller = [storyboard instantiateInitialViewController];
    if (initialization) {
        initialization(controller);
    }
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)presentViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName {
    [self presentViewControllerWithIdentifier:identifier fromStoryboard:storyboardName initialization:nil];
}

- (void)presentViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName initialization:(void (^)(id))initialization {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:identifier];
    if (initialization) {
        initialization(controller);
    }
    [self presentViewController:controller animated:YES completion:nil];
}
@end
