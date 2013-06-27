//
//  ZPieChart.m
//  Charts
//
//  Created by Nicolas Purita on 3/1/13.
//  Copyright (c) 2013 Zauber S.A. All rights reserved.
//

#define RADIANS_TO_DEGREES(angle) angle * (180.0 / M_PI)

#import "ZPieChart.h"

@interface ZPieChart ()

@property (strong, nonatomic) NSMutableArray *angleValues;
@property (strong, nonatomic) NSMutableArray *percentValues;
@property (strong, nonatomic) NSMutableArray *colors;
@property (copy, nonatomic) valueBlock getValueBlock;

@property (assign, nonatomic) float totalValueSum;
@property (assign, nonatomic) float initialAngle;
@property (assign, nonatomic) float radius;
@property (assign, nonatomic) CGPoint centerPoint;

@end

@implementation ZPieChart

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializer];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initializer];
    }
    return self;
}

- (void) initializer {
    self.initialAngle = -M_PI_2;
    self.contentMode = UIViewContentModeRedraw;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if (self.angleValues.count != (self.colors.count+1) || self.angleValues.count == 0) {
        return;
    }
    
    self.centerPoint = CGPointMake((int)CGRectGetMidX(rect), (int)CGRectGetMidY(rect));
    self.radius = CGRectGetHeight(rect) * .4;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineJoin(context, kCGLineJoinRound);

    if (self.drawCenterClipCircle){
        [self drawCenterClipCircleInContext:context];
    }
    
    for (int i = 0 ; i < self.angleValues.count - 1; ++i) {
        NSLog(@"Start Angle: %f - End Andgle: %f", [self.angleValues[i] floatValue], [self.angleValues[i+1] floatValue]);
        [self drawPieSection:context startAngle:[self.angleValues[i] floatValue] endAngle:[self.angleValues[i+1] floatValue] withColor:self.colors[i]];
    }

}

- (void)drawCenterClipCircleInContext:(CGContextRef)context {
    
    CGContextMoveToPoint(context, self.centerPoint.x, self.centerPoint.y);
    CGContextAddArc(context, self.centerPoint.x, self.centerPoint.y, self.radius/2, 0, 2 * M_PI, NO);
    CGContextClosePath(context);
    CGContextAddRect(context, CGContextGetClipBoundingBox(context));
    CGContextEOClip(context);

}

- (void)drawPieSection:(CGContextRef)context startAngle:(float)startAngle endAngle:(float)endAngle withColor:(UIColor *)color{
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, self.centerPoint.x, self.centerPoint.y);
    CGPathAddArc(path, NULL, self.centerPoint.x, self.centerPoint.y, self.radius, (self.initialAngle + startAngle), (self.initialAngle + endAngle), NO);
    CGPathCloseSubpath(path);
    CGContextAddPath(context, path);

    CGPathRelease(path);

    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
}


- (void)setValues:(NSArray *)values getValueBlock:(valueBlock)valueBlock withColor:(NSArray *)color{
    if (valueBlock == nil) {
        // TODO: Will show and invalid message.
        return;
    }
    
    self.colors = [NSMutableArray arrayWithArray:color];

    self.angleValues = [NSMutableArray arrayWithCapacity:values.count];
    self.percentValues = [NSMutableArray arrayWithCapacity:values.count];
    self.totalValueSum = 0;
    
    self.getValueBlock = valueBlock;
    
    [self calculateAnglesAndPercentages:values];
}

- (void)calculateAnglesAndPercentages:(NSArray *)values {
    for (id obj in values) {
        self.totalValueSum += self.getValueBlock(obj);
    }

    [self.angleValues addObject:@(0)];
    float acumPerc = 0;
    for (id obj in values) {
        float percent = self.getValueBlock(obj) / self.totalValueSum;
        [self.percentValues addObject:@(percent)];
        acumPerc += percent;
        [self.angleValues addObject:@(acumPerc * 2 * M_PI)];
    }
    
    [self setNeedsDisplay];
}

@end
