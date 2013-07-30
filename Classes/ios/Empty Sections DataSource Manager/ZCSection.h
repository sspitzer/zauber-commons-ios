//
//  NPSection.h
//  EmptySectionTableView
//
//  Created by Nicolas Purita on 7/23/13.
//  Copyright (c) 2013 Nicolas Purita. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef UIView*(^ViewForSection)();
typedef NSArray*(^ElementsGetter)();

@interface ZCSection : NSObject

- (NSString *)cellIdentifier;
- (NSArray *)elements;

- (void)setViewForHeader:(ViewForSection)block;
- (UIView *)viewForHeader;

+ (instancetype)sectionWithCellIdentifier:(NSString *)theCellIdentifier elementsWithBlock:(ElementsGetter)elementsGetter;
+ (instancetype)sectionWithCellIdentifier:(NSString *)theCellIdentifier elements:(NSArray *)elements;

@end
