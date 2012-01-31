//
//  FRTViewController.h
//  FirstResponderTest
//
//  Created by Deepak k on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRTViewController : UIViewController
{
    IBOutlet UITextField *text1;
    IBOutlet UITextField *text2;
    IBOutlet UIView *ResponseChainView;
    IBOutlet UIWebView *webView1;
    IBOutlet UIButton *subViewButton;
}


-(IBAction)change:(id)sender;
-(IBAction)resign:(id)sender;
-(IBAction)responderChain:(id)sender;
-(IBAction)resignResponderChain:(id)sender;
-(IBAction)subview:(id)sender;

@end
