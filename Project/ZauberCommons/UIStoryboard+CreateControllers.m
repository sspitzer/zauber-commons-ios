//
//  UIStoryboard+CreateControllers.m
//  ZauberCommons
//
//  Created by Hernan Zalazar on 11/3/13.
//  Copyright (c) 2013 Zauber. All rights reserved.
//

#import "UIStoryboard+CreateControllers.h"

@implementation UIStoryboard (CreateControllers)

+ (id)instantiateViewControllerWithIdentifier:(NSString *)identifier fromStoryboard:(NSString *)storyboardName {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:identifier];
}

+ (id)instantiateInitialViewControllerFromStoryboard:(NSString *)storyboardName {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateInitialViewController];
}

@end
