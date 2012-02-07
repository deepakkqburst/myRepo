//
//  AnimationViewController.m
//  Animation
//
//  Created by Deepak k on 2/1/12.
//  Copyright (c) 2012 Qburst Technologies. All rights reserved.
//

#import "AnimationViewController.h"

#define animateTo 180;


@implementation AnimationViewController

@synthesize bug1;
@synthesize bug2;
@synthesize bug3;
@synthesize bug4;
@synthesize bug5;
@synthesize bug6;
@synthesize bug7;

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
-(IBAction)frameAnimation:(id)sender
{
    NSLog(@"Frame animation triggered!");
    CGRect bug1Frame = bug1.frame;
    bug1Frame.origin.x = bug1Frame.origin.x + animateTo;
    [UIView animateWithDuration:1
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         bug1.frame = bug1Frame;
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Frame Animation Done!");
                     }];
}
-(IBAction)boundsAnimation:(id)sender
{   NSLog(@"Bounds animation triggered!");
    CGRect bug2Bounds = bug2.bounds;
    bug2Bounds.size.width = bug2Bounds.size.width + animateTo;
    [UIView animateWithDuration:1
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         bug2.bounds = bug2Bounds;
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Bounds Animation Done!");
                     }];
}
-(IBAction)centerAnimation:(id)sender
{
    NSLog(@"Center animation triggered!");
    CGPoint bug3Center = bug3.center;
    bug3Center = bug2.center;
    [UIView animateWithDuration:1
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         bug3.center = bug3Center;
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Center Animation Done!");
                     }];
}
-(IBAction)transformAnimation:(id)sender
{
    NSLog(@"Transform animation triggered!");
    [UIView animateWithDuration:1
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         bug4.transform = CGAffineTransformMakeTranslation(self.view.frame.size.height * 0.3f, 0 );
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Transform Animation Done!");
                     }];  
}
-(IBAction)alphaAnimation:(id)sender
{
    NSLog(@"Alpha animation triggered!");
    [UIView animateWithDuration:1
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         bug5.alpha = 0.5;
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Alpha Animation Done!");
                     }];  
}
-(IBAction)backgroundColourAnimation:(id)sender
{
    NSLog(@"BG Colour animation triggered!");
    [UIView animateWithDuration:1
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         bug6.backgroundColor = [UIColor blueColor];
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"BG Colour Animation Done!");
                     }]; 
}
-(IBAction)contentStretch:(id)sender
{
    NSLog(@"Content stretch animation triggered!");
    [UIView animateWithDuration:1
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         bug7.contentStretch = CGRectMake(1./27., 1./27., 1./27., 1./27.);
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Content stretch Colour Animation Done!");
                     }]; 
}
@end
