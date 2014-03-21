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
@property (copy, nonatomic) ElementsForSection elementsGetterBlock;
@property (copy, nonatomic) ViewForSection sectionViewBuilder;

@end

@implementation ZCSection

+ (instancetype)sectionWithCellIdentifier:(NSString *)theCellIdentifier withBlock:(ElementsForSection)elementsGetter {

    if (!elementsGetter) {
#ifdef DEBUG
        [NSException raise:@"Invalid block to get elements" format:@"The block to get elements musn't be nil"];
#else
        NSLog(@"Block should not be nil");
#endif
    }
    
    ZCSection *section = [[[self class] alloc] init];
    section.cellIdentifier = theCellIdentifier;
    section.elementsGetterBlock = elementsGetter;
    
    return section;
}

+ (instancetype)sectionWithCellIdentifier:(NSString *)theCellIdentifier elements:(NSArray *)elements {
    return [self sectionWithCellIdentifier:theCellIdentifier withBlock:^NSArray *{
        return elements;
    }];
}

- (void)setViewForHeader:(ViewForSection)block {
    self.sectionViewBuilder = block;
}

- (UIView *)headerViewForSection:(NSInteger)section {
    UIView *view = nil;
    if (self.sectionViewBuilder) {
        view = self.sectionViewBuilder(section);
    }
    return view;
}

- (NSArray *)elements {
    return self.elementsGetterBlock();
}

@end
