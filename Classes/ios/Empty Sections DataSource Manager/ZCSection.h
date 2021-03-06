//
//  NPSection.h
//  EmptySectionTableView
//
//  Created by Nicolas Purita on 7/23/13.
//  Copyright (c) 2013 Nicolas Purita. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef UIView*(^ViewForSection)(NSInteger section);
typedef NSArray*(^ElementsForSection)();

@interface ZCSection : NSObject

- (NSString *)cellIdentifier;
- (NSArray *)elements;

- (void)setViewForHeader:(ViewForSection)block;
- (UIView *)headerViewForSection:(NSInteger)section;

+ (instancetype)sectionWithCellIdentifier:(NSString *)theCellIdentifier withBlock:(ElementsForSection)elementsBlock;
+ (instancetype)sectionWithCellIdentifier:(NSString *)theCellIdentifier elements:(NSArray *)elements;

@end
