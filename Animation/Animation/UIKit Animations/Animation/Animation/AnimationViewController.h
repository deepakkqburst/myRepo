//
//  AnimationViewController.h
//  Animation
//
//  Created by Deepak k on 2/1/12.
//  Copyright (c) 2012 Qburst Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationViewController : UIViewController
{
    NSTimeInterval *interval;
}

@property (assign)IBOutlet UIImageView *bug1;
@property (assign)IBOutlet UIImageView *bug2;
@property (assign)IBOutlet UIImageView *bug3;
@property (assign)IBOutlet UIImageView *bug4;
@property (assign)IBOutlet UIImageView *bug5;
@property (assign)IBOutlet UIImageView *bug6;
@property (assign)IBOutlet UIImageView *bug7;
-(IBAction)frameAnimation:(id)sender;
-(IBAction)boundsAnimation:(id)sender;
-(IBAction)centerAnimation:(id)sender;
-(IBAction)transformAnimation:(id)sender;
-(IBAction)alphaAnimation:(id)sender;
-(IBAction)backgroundColourAnimation:(id)sender;
-(IBAction)contentStretch:(id)sender;
@end
