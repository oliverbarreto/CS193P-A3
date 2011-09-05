//
//  GraphViewController.m
//  GraphingCalculator
//
//  Created by David Oliver Barreto Rodríguez on 04/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GraphViewController.h"


#pragma mark - Initialization & Property Methods

@implementation GraphViewController
@synthesize myScale, myOrigin;
@synthesize myGraphView;
@synthesize scaleLabel;
@synthesize myExpression;

- (void)setMyExpression:(id)newExpression {
    [myExpression release];
    myExpression = [newExpression copy];    
    
    if (myGraphView.window) [myGraphView setNeedsDisplay];
}

- (void)setup {
    self.myOrigin = CGPointMake(10,10);
    self.myScale = 14.0;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setup];
    }
    return self;
}


#pragma mark - GraphView Protocol Implementation

- (float)scaleForGraphView:(GraphView *)requestor {  
    
    //scale > 0
    return self.myScale; 
}


- (CGPoint)originForGraphView:(GraphView *)requestor {  
    
    //Sets the origin for the graph on screen, in GraphView bounds coordinates
    return self.myOrigin;
}

#pragma mark - IBAction Methods

- (void)zoomIn:(id)sender {
    self.myScale *= 0.8;
    [myGraphView setNeedsDisplay];
}

- (void)zoomOut:(id)sender {
    self.myScale /= 0.8;
    [myGraphView setNeedsDisplay];
}



#pragma mark - View Lifecycle & Memory Management

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    myGraphView.delegate = self;
    self.scaleLabel.text = [NSString stringWithFormat:@"Scale: %.2f", self.myScale];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)releaseNilsOfOutlets {
    self.scaleLabel = nil;
}

- (void)dealloc {

    [self releaseNilsOfOutlets];    
    [myExpression release];
    
    [super dealloc];
}

@end
