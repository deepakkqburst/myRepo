//
//  FRTViewController.m
//  FirstResponderTest
//
//  Created by Deepak k on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FRTViewController.h"

@implementation FRTViewController

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
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView1 loadRequest:requestObj];
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
-(IBAction)change:(id)sender
{   
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView   *firstResponder = [keyWindow performSelector:@selector(firstResponder)];
    NSString *string = [NSString stringWithFormat:@"%@",firstResponder];
    NSLog(@"%@",string);
}
-(IBAction)resign:(id)sender
{
    [text1 resignFirstResponder];
}
-(IBAction)responderChain:(id)sender
{
    [self.view addSubview:ResponseChainView];   
}
-(IBAction)resignResponderChain:(id)sender
{
    [ResponseChainView removeFromSuperview];
}
-(IBAction)subview:(id)sender
{
    NSLog(@"Tapped on subview in responder chain");
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Tapped on superview in responder chain");
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView   *firstResponder = [keyWindow performSelector:@selector(firstResponder)];
    NSString *string = [NSString stringWithFormat:@"%@",firstResponder];
    NSLog(@"%@",string);
}
@end
