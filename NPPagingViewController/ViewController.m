//
//  ViewController.m
//  NPPagingViewController
//
//  Created by Ryan Wang on 12-10-24.
//  Copyright (c) 2012年 Ryan Wang. All rights reserved.
//

#import "ViewController.h"
#import "NPPagingView.h"
#import "NIPhotoScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _pagingView.delegate = self;
    
    [_pagingView reloadData];
}


- (NSUInteger)numberOfPagesInPagingView:(NPPagingView *)pagingView {
    return 10;
}

- (UIView*)pagingView:(NPPagingView *)pagingView pageForRowAtIndex:(NSInteger)index {
    NIPhotoScrollView *view = (NIPhotoScrollView *)[pagingView dequeueRecycledPage];
    if (view == nil) {
        view = [[NIPhotoScrollView alloc] initWithFrame:self.view.bounds];
        view.backgroundColor = [UIColor colorWithRed:rand()%255/255.0 green:rand()%255/255.0 blue:rand()%255/255.0 alpha:1];
    }
    
    NSString *name = [NSString stringWithFormat:@"photo%dl.jpg",index+1];
    NSLog(@"request Image : %@",name);
    UIImage *image = [UIImage imageNamed:name];
    [view setImage:image photoSize:NIPhotoScrollViewPhotoSizeOriginal];
    
    return view;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
