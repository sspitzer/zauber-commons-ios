//
//  NPTableDataSource.m
//  EmptySectionTableView
//
//  Created by Nicolas Purita on 7/23/13.
//  Copyright (c) 2013 Nicolas Purita. All rights reserved.
//

#import "ZCTableDataSource.h"
#import "ZCSection.h"

@interface ZCTableDataSource ()

@property (strong, nonatomic) NSArray *sections;
@property (strong, nonatomic) NSArray *sectionsNotEmpty;
@property (weak, nonatomic) UITableView *tableView;

@end

@implementation ZCTableDataSource

+ (instancetype)dataSourceForTable:(UITableView *)aTableView sections:(NSArray *)sections {
    ZCTableDataSource *dataSource = [[[self class] alloc] init];
    dataSource.sections = sections;
    dataSource.sectionsNotEmpty = [dataSource filterEmptySections:sections];
    dataSource.tableView = aTableView;
    
    return dataSource;
}

- (NSArray *)filterEmptySections:(NSArray *)sections {
    
    NSMutableArray *notEmpty = [@[] mutableCopy];
    
    for (ZCSection *section in sections) {
        if (section.elements.count > 0) {
            [notEmpty addObject:section];
        }
    }
    
    return [NSArray arrayWithArray:notEmpty];
}

- (NSInteger) numberOfSections {
    return self.sectionsNotEmpty.count;
}

- (NSInteger) numberOfRowsForSection:(NSInteger)section {
    return [[self.sectionsNotEmpty[section] elements] count];
}

- (UIView *) viewForHeaderSection:(NSInteger)section {
    ZCSection *theSection = self.sectionsNotEmpty[section];
    return [theSection viewForHeader];
}

- (id) objectForIndexPath:(NSIndexPath *)indexPath {
    ZCSection *section = self.sectionsNotEmpty[indexPath.section];
    NSArray *elements = [section elements];
    return elements[indexPath.row];
}

- (ZCSection *)sectionAtIndex:(NSInteger)index {
    return self.sections[index];
}

- (void)reloadSections {
    self.sectionsNotEmpty = [self filterEmptySections:self.sections];
}

- (UITableViewCell<ZCCustomizableCellProtocol> *)createCellForIndexPath:(NSIndexPath*)indexPath {
    ZCSection *section = self.sectionsNotEmpty[indexPath.section];
    
    UITableViewCell<ZCCustomizableCellProtocol> * cell = [self.tableView dequeueReusableCellWithIdentifier:section.cellIdentifier forIndexPath:indexPath];
    
    if ([cell conformsToProtocol:@protocol(ZCCustomizableCellProtocol)]) {
        [cell customizeCellWithObject:[self objectForIndexPath:indexPath]];
    }else{
        NSLog(@"The cell doesn't conform with the protocol ZCustomizableCellProtocol");
    }
    
    return cell;
}

@end
