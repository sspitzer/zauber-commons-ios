//
//  NPTableDataSource.h
//  EmptySectionTableView
//
//  Created by Nicolas Purita on 7/23/13.
//  Copyright (c) 2013 Nicolas Purita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCCustomizableCellProtocol.h"

@class ZCSection;

@interface ZCTableDataSource : NSObject

- (NSInteger)numberOfSections;
- (ZCSection *)sectionAtIndex:(NSInteger)index;
- (NSInteger)numberOfRowsForSection:(NSInteger)section;

- (UIView *)viewForHeaderSection:(NSInteger)section;

- (id)objectForIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell<ZCCustomizableCellProtocol> *)createCellForIndexPath:(NSIndexPath *)indexPath;

- (void)reloadSections;

+ (instancetype)dataSourceForTable:(UITableView *)tableView sections:(NSArray *)sections;

@end
