//
//  CoreAnimationViewController.m
//  CoreAnimation
//
//  Created by Deepak k on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoreAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>
#define P(x,y) CGPointMake(x, y)

@implementation CoreAnimationViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self rotate];
    [self position];
    [self track];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(void)rotate
{
    NSLog(@"Rotate Animation Triggered");
    
    //basic layer
    basic = [CALayer layer];
    basic.position = self.view.center;
    basic.bounds = self.view.bounds;
    basic.backgroundColor = [UIColor blackColor].CGColor;
  
    
    //sun
    UIImage *sun = [UIImage imageNamed:@"sun.png"];
	CALayer *star = [CALayer layer];
	star.contents = (id)sun.CGImage;
    star.position = self.view.center;
    star.bounds = CGRectMake(0, 0, 100, 100);
    [basic addSublayer:star];
    
    //orbit
    CALayer *orbit1 = [CALayer layer];
	orbit1.bounds = CGRectMake(0, 0, 200, 200);
	orbit1.position = self.view.center;
	orbit1.cornerRadius = 100;
	orbit1.borderColor = [UIColor clearColor].CGColor;
	orbit1.borderWidth = 1.5;
    [basic addSublayer:orbit1];
    
    //earth
    UIImage *earth = [UIImage imageNamed:@"earth.png"];
    CALayer *planet = [CALayer layer];
    planet.bounds = CGRectMake(0, 0, 50, 50);
	planet.position = CGPointMake(100, 0);
    planet.contents = (id)earth.CGImage;
    [orbit1 addSublayer:planet];
    //animation
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	anim1.fromValue = [NSNumber numberWithFloat:0];
	anim1.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
	anim1.repeatCount = HUGE_VALF;
	anim1.duration = 4.0;
    [planet addAnimation:anim1 forKey:@"transform"];
	[orbit1 addAnimation:anim1 forKey:@"transform"];
    [star addAnimation:anim1 forKey:@"transform"];
    
    //adding basic layer
	[self.view.layer addSublayer:basic];
    
}
-(void)position
{
    UIImage *swift = [UIImage imageNamed:@"comet.png"];
    CALayer *comet = [CALayer layer];
    comet.contents = (id)swift.CGImage;
    comet.bounds = CGRectMake(0, 0, 20, 20);
    CGPoint startPt = CGPointMake(self.view.bounds.size.width + comet.bounds.size.width / 2,
								 self.view.bounds.size.height / 3);
	CGPoint endPt = CGPointMake(comet.bounds.size.width / -2,
								self.view.bounds.size.height);
    UIBezierPath *trackPath = [UIBezierPath bezierPath];
	[trackPath moveToPoint:P(160, 25)];
	[trackPath addCurveToPoint:P(300, 120)
				 controlPoint1:P(320, 0)
				 controlPoint2:P(300, 80)];
	CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
	anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	anim.fromValue = [NSValue valueWithCGPoint:startPt];
	anim.toValue = [NSValue valueWithCGPoint:endPt];
	anim.repeatCount = HUGE_VALF;
	anim.duration = 2.0;
    [basic addSublayer:comet];
	[comet addAnimation:anim forKey:@"position"]; 
}
-(void)track
{
 	UIBezierPath *trackPath = [UIBezierPath bezierPath];
	[trackPath moveToPoint:P(90, 20)];
	[trackPath addCurveToPoint:P(300, 120)
				 controlPoint1:P(320,0)
				 controlPoint2:P(300, 80)];
	[trackPath addCurveToPoint:P(80, 380)
				 controlPoint1:P(300, 200)
				 controlPoint2:P(200, 480)];
	[trackPath addCurveToPoint:P(140, 300)
				 controlPoint1:P(0, 300)
				 controlPoint2:P(200, 220)];
	[trackPath addCurveToPoint:P(210, 200)
				 controlPoint1:P(30, 420)
				 controlPoint2:P(280, 300)];
	[trackPath addCurveToPoint:P(70, 110)
				 controlPoint1:P(110, 80)
				 controlPoint2:P(110, 80)];
	[trackPath addCurveToPoint:P(90, 20)
				 controlPoint1:P(0, 160)
				 controlPoint2:P(0, 40)];
    
    CALayer *spaceShip = [CALayer layer];
	spaceShip.bounds = CGRectMake(0, 0, 50.0, 50.0);
	spaceShip.position = P(160, 25);
	spaceShip.contents = (id)([UIImage imageNamed:@"spaceShip.png"].CGImage);
	[self.view.layer addSublayer:spaceShip];
	
	CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim.path = trackPath.CGPath;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	anim.rotationMode = kCAAnimationRotateAuto;
	anim.repeatCount = HUGE_VALF;
	anim.duration = 8.0;
	[spaceShip addAnimation:anim forKey:@"spaceShip"];
}
@end
