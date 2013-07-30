//
//  NPSection.m
//  EmptySectionTableView
//
//  Created by Nicolas Purita on 7/23/13.
//  Copyright (c) 2013 Nicolas Purita. All rights reserved.
//

#import "ZCSection.h"

@interface ZCSection ()

@property (strong, nonatomic) NSString *cellIdentifier;
@property (copy, nonatomic) elementsGetter elementsGetterBlock;
@property (copy, nonatomic) viewForSection sectionViewBuilder;

@end

@implementation ZCSection

+ (instancetype)sectionWithCellIdentifier:(NSString *)theCellIdentifier elementsWithBlock:(elementsGetter)elementsGetter {

    if (!elementsGetter) {
        [NSException raise:@"Invalid block to get elements" format:@"The block to get elements musn't be nil"];
    }
    
    ZCSection *section = [[[self class] alloc] init];
    section.cellIdentifier = theCellIdentifier;
    section.elementsGetterBlock = elementsGetter;
    
    return section;
}

+ (instancetype)sectionWithCellIdentifier:(NSString *)theCellIdentifier elements:(NSArray *)elements {
    return [self sectionWithCellIdentifier:theCellIdentifier elementsWithBlock:^NSArray *{
        return elements;
    }];
}

- (void)setViewForHeader:(viewForSection)block {
    self.sectionViewBuilder = block;
}

- (UIView *)viewForHeader {
    if (!self.sectionViewBuilder) {
        return nil;
    }
    return self.sectionViewBuilder();
}

- (NSArray *)elements {
    return self.elementsGetterBlock();
}

@end
