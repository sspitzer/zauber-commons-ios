//
//  NPCustomizableCellProtocol.h
//  EmptySectionTableView
//
//  Created by Nicolas Purita on 7/24/13.
//  Copyright (c) 2013 Nicolas Purita. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCCustomizableCellProtocol <NSObject>

@required
- (void)customizeCellWithObject:(id)obj;

@end
