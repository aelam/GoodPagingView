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
#import "CaptionedPhotoView.h"

@interface ViewController ()


@end

@implementation ViewController {
    NSArray *images;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    images = [[NSArray alloc] initWithObjects:
              @"http://farm4.static.flickr.com/3567/3523321514_371d9ac42f_b.jpg",
              @"http://farm4.static.flickr.com/3629/3339128908_7aecabc34b_b.jpg",
              @"http://farm4.static.flickr.com/3364/3338617424_7ff836d55f_b.jpg",
              @"http://farm4.static.flickr.com/3590/3329114220_5fbc5bc92b_b.jpg",
              @"http://farm4.static.flickr.com/3567/3523321514_371d9ac42f_b.jpg",
              @"http://farm4.static.flickr.com/3629/3339128908_7aecabc34b_b.jpg",
              @"http://farm4.static.flickr.com/3364/3338617424_7ff836d55f_b.jpg",
              @"http://farm4.static.flickr.com/3590/3329114220_5fbc5bc92b_b.jpg",
              @"http://farm4.static.flickr.com/3567/3523321514_371d9ac42f_b.jpg",
              @"http://farm4.static.flickr.com/3629/3339128908_7aecabc34b_b.jpg",
              @"http://farm4.static.flickr.com/3364/3338617424_7ff836d55f_b.jpg",
              @"http://farm4.static.flickr.com/3590/3329114220_5fbc5bc92b_b.jpg",
              nil];
    

	// Do any additional setup after loading the view, typically from a nib.
    _pagingView.delegate = self;
//    [_pagingView reloadData];
    [_pagingView setInitialPageIndex:2];
    
    
}


- (NSUInteger)numberOfPagesInPagingView:(NPPagingView *)pagingView {
    return 10;
}

- (UIView*)pagingView:(NPPagingView *)pagingView pageForRowAtIndex:(NSInteger)index {
    CaptionedPhotoView *view = (CaptionedPhotoView *)[pagingView dequeueRecycledPage];
    if (view == nil) {
        view = [[CaptionedPhotoView alloc] initWithFrame:self.view.bounds];
        view.backgroundColor = [UIColor colorWithRed:rand()%255/255.0 green:rand()%255/255.0 blue:rand()%255/255.0 alpha:1];
    }
    
    NSString *name = [NSString stringWithFormat:@"photo%dl.jpg",index+1];
    NSLog(@"request Image : %@",name);
//    UIImage *image = [UIImage imageNamed:name];
    NSString *url = [images objectAtIndex:index];
//    [view setImage:image photoSize:NIPhotoScrollViewPhotoSizeOriginal];
    [view setOriginalImageURL:[NSURL URLWithString:url] placeholder:nil];
    [view setCaption:[NSString stringWithFormat:@"--%d--",index]];
    return view;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
