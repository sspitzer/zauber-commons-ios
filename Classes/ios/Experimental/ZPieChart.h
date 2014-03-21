//
//  ZPieChart.h
//  Charts
//
//  Created by Nicolas Purita on 3/1/13.
//  Copyright (c) 2013 Zauber S.A. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef float(^valueBlock)(id obj);
typedef NSString(^stringLegendBlock)(id obj);

@interface ZPieChart : UIView

@property (copy, nonatomic) stringLegendBlock getValueLegend;
@property (assign, nonatomic) BOOL drawLegend;
@property (assign, nonatomic) BOOL drawCenterClipCircle;
@property (strong, nonatomic) UIColor *centerCircle;

// The value getter is mandatory. It musn't be nil
- (void) setValues:(NSArray *)values getValueBlock:(valueBlock)valueBlock withColor:(NSArray *)color;

@end
