//
//  NPPagingViewController.m
//  niupai
//
//  Created by Ryan Wang on 12-10-24.
//
//

#import "NPPagingViewController.h"
#import "NPPagingView.h"
#import <QuartzCore/QuartzCore.h>

@interface NPPagingViewController ()<NPPagingViewDelegate>

@end

@implementation NPPagingViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _pagingView = [[NPPagingView alloc] initWithFrame:self.view.bounds];
    _pagingView.layer.borderColor = [UIColor greenColor].CGColor;
    _pagingView.layer.borderWidth = 3;
    _pagingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [self.view addSubview:_pagingView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [_pagingView release];_pagingView = nil;
}

- (void)dealloc {
    [super dealloc];
    [_pagingView release];_pagingView = nil;
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [_pagingView willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[_pagingView willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [_pagingView didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

@end
