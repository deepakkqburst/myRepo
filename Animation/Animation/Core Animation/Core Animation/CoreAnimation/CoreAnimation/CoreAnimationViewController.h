//
//  CoreAnimationViewController.h
//  CoreAnimation
//
//  Created by Deepak k on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreAnimationViewController : UIViewController
{
    CALayer *basic;   
}

-(void)rotate;
-(void)position;
-(void)track;
@end
