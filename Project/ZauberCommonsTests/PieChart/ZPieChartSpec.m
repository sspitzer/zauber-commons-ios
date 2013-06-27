//
//  ZPieChartSpec.m
//  Charts
//
//  Created by Nicolas Purita on 3/1/13.
//  Copyright (c) 2013 Zauber S.A. All rights reserved.
//


#import <Kiwi/Kiwi.h>
#import "ZPieChart.h"

#define kDelta      0.01

@interface ZPieChart ()

- (void)calculateAnglesAndPercentages:(NSArray *)values;
- (float)totalValueSum;
- (NSArray *)angleValues;
- (NSArray *)percentValues;

@end

SPEC_BEGIN(ZPieChartSpec)

describe(NSStringFromClass([ZPieChart class]), ^{
    
    describe(NSStringFromSelector(@selector(calculateAnglesAndPercentage:)), ^{
       
        __block ZPieChart *pieChart = nil;
        __block NSArray *values = nil;
        
        beforeAll(^{
            pieChart = [[ZPieChart alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            
        });
        
        context(@"when sum all values", ^{

            beforeAll(^{
                values = @[@(15), @(20), @(30), @(20), @(15)];
                [pieChart setValues:values
                      getValueBlock:^float(id obj) {
                          return [(NSNumber *)obj floatValue];
                      } withColor:@[[UIColor redColor], [UIColor yellowColor], [UIColor blueColor], [UIColor greenColor], [UIColor orangeColor]]];
            });
            
            it(@"should be equal to 100", ^{
                [[theValue([pieChart totalValueSum]) should] equal:theValue(100)];
            });
        });
        
        context(@"when calculate percents", ^{
            
            beforeAll(^{
                values = @[@(15), @(20), @(30), @(20), @(15)];
                [pieChart setValues:values
                      getValueBlock:^float(id obj) {
                          return [(NSNumber *)obj floatValue];
                      } withColor:@[[UIColor redColor], [UIColor yellowColor], [UIColor blueColor], [UIColor greenColor], [UIColor orangeColor]]];
            });
            
            it(@"should have the same amount of objects as values", ^{
                [[[pieChart percentValues] should] haveCountOf:values.count];
            });
            
            it(@"should be equal to", ^{
                [[theValue([[pieChart percentValues][0] floatValue]) should] equal:0.15 withDelta:kDelta];
                [[theValue([[pieChart percentValues][1] floatValue]) should] equal:0.2 withDelta:kDelta];
                [[theValue([[pieChart percentValues][2] floatValue]) should] equal:0.3 withDelta:kDelta];
                [[theValue([[pieChart percentValues][3] floatValue]) should] equal:0.2 withDelta:kDelta];
                [[theValue([[pieChart percentValues][4] floatValue]) should] equal:0.15 withDelta:kDelta];
            });
        });
        
        context(@"when calculate angles", ^{
            beforeAll(^{
                values = @[@(60), @(60), @(180), @(60)];
                [pieChart setValues:values
                      getValueBlock:^float(id obj) {
                          return [(NSNumber *)obj floatValue];
                      } withColor:@[[UIColor redColor], [UIColor yellowColor], [UIColor blueColor], [UIColor greenColor]]];
            });
            
            it(@"should be equal to", ^{
                [[theValue([[pieChart angleValues][0] floatValue]) should] equal:0.0 withDelta:kDelta];
                [[theValue([[pieChart angleValues][1] floatValue]) should] equal:(M_PI/3) withDelta:kDelta];
                [[theValue([[pieChart angleValues][2] floatValue]) should] equal:(2 * M_PI/3) withDelta:kDelta];
                [[theValue([[pieChart angleValues][3] floatValue]) should] equal:(2 * M_PI/3 + M_PI) withDelta:kDelta];
                [[theValue([[pieChart angleValues][4] floatValue]) should] equal:(3 * M_PI/3 + M_PI) withDelta:kDelta];
            });
            
        });
        
    });

});

SPEC_END