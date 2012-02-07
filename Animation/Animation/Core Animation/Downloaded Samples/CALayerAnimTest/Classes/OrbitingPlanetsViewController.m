//
//  OrbitingPlanetsViewController.m
//  CALayerAnimTest
//
//  Created by Michael Nachbaur on 10-11-28.
//  Copyright 2010 Decaf Ninja Software. All rights reserved.
//

#import "OrbitingPlanetsViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation OrbitingPlanetsViewController

- (void)loadView {
	[super loadView];
	self.view.backgroundColor = [UIColor blackColor];

	// Orbit #1
	CALayer *orbit1 = [CALayer layer];
	orbit1.bounds = CGRectMake(0, 0, 200, 200);
	orbit1.position = self.view.center;
	orbit1.cornerRadius = 100;
	orbit1.borderColor = [UIColor redColor].CGColor;
	orbit1.borderWidth = 1.5;
	
	CALayer *planet1 = [CALayer layer];
	planet1.bounds = CGRectMake(0, 0, 20, 20);
	planet1.position = CGPointMake(100, 0);
	planet1.cornerRadius = 10;
	planet1.backgroundColor = [UIColor redColor].CGColor;
	[orbit1 addSublayer:planet1];
	
	CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	anim1.fromValue = [NSNumber numberWithFloat:0];
	anim1.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
	anim1.repeatCount = HUGE_VALF;
	anim1.duration = 8.0;
	[orbit1 addAnimation:anim1 forKey:@"transform"];

	[self.view.layer addSublayer:orbit1];
	
	// Orbit #2
	CALayer *orbit2 = [CALayer layer];
	orbit2.bounds = CGRectMake(0, 0, 120, 120);
	orbit2.position = planet1.position;
	orbit2.cornerRadius = 60;
	orbit2.borderColor = [UIColor blueColor].CGColor;
	orbit2.borderWidth = 1.5;
	
	CALayer *planet2 = [CALayer layer];
	planet2.bounds = CGRectMake(0, 0, 16, 16);
	planet2.position = CGPointMake(60, 0);
	planet2.cornerRadius = 8;
	planet2.backgroundColor = [UIColor blueColor].CGColor;
	[orbit2 addSublayer:planet2];
	
	CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	anim2.fromValue = [NSNumber numberWithFloat:0];
	anim2.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
	anim2.repeatCount = HUGE_VALF;
	anim2.duration = 4.0;
	[orbit2 addAnimation:anim2 forKey:@"transform"];

	[orbit1 addSublayer:orbit2];
	
	// Orbit #3
	CALayer *orbit3 = [CALayer layer];
	orbit3.bounds = CGRectMake(0, 0, 72, 72);
	orbit3.position = planet2.position;
	orbit3.cornerRadius = 36;
	orbit3.borderColor = [UIColor grayColor].CGColor;
	orbit3.borderWidth = 1.5;
	
	CALayer *planet3 = [CALayer layer];
	planet3.bounds = CGRectMake(0, 0, 12, 12);
	planet3.position = CGPointMake(36, 0);
	planet3.cornerRadius = 6;
	planet3.backgroundColor = [UIColor grayColor].CGColor;
	[orbit3 addSublayer:planet3];
	
	CABasicAnimation *anim3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	anim3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	anim3.fromValue = [NSNumber numberWithFloat:0];
	anim3.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
	anim3.repeatCount = HUGE_VALF;
	anim3.duration = 2.0;
	[orbit3 addAnimation:anim3 forKey:@"transform"];
	
	[orbit2 addSublayer:orbit3];
}

@end
