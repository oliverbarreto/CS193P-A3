//
//  GraphView.m
//  GraphingCalculator
//
//  Created by David Oliver Barreto Rodríguez on 02/09/11.
//  Copyright 2011 BuildOneIdeas. All rights reserved.
//

#import "GraphView.h"

#pragma mark - Implementation & Synthesize header

@implementation GraphView

@synthesize delegate;

#pragma mark - Init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


#pragma mark - Utility Methods

- (void)drawCircleAtPoint:(CGPoint)p withRadius:(CGFloat)radius inContext:(CGContextRef)context
{
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
    CGContextSetLineWidth(context, 2.0);
    [[UIColor redColor] setStroke];
	CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
	CGContextStrokePath(context);
	UIGraphicsPopContext();
}


#pragma mark - DrawRect Method to override

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    //TEST GRAPHICS - Draws a red circle in view
    CGPoint centerPointOfGraphView;
    centerPointOfGraphView.x = self.bounds.origin.x + self.bounds.size.width/2;
    centerPointOfGraphView.y = self.bounds.origin.y + self.bounds.size.height/2;
    
    CGFloat sizeOfGraphView = self.bounds.size.width/2;     //prepare for rotation
    if (sizeOfGraphView > self.bounds.size.height/2) sizeOfGraphView = self.bounds.size.height/2;
    sizeOfGraphView *= 1.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawCircleAtPoint:centerPointOfGraphView withRadius:sizeOfGraphView inContext:context];
    
    CGFloat myScale = [self.delegate scaleForGraphView:self];
    //CGFloat myScale = 14.0;
    [AxesDrawer drawAxesInRect:rect originAtPoint:centerPointOfGraphView scale:myScale];
    
}



@end
