//
//  NPPagingViewController.h
//  niupai
//
//  Created by Ryan Wang on 12-10-24.
//
//

#import <UIKit/UIKit.h>

@class NPPagingView;

@interface NPPagingViewController :
#ifdef __NIUPAI__
NPBaseController
#else
UIViewController
#endif
{
@protected
    NPPagingView *_pagingView;
}


@end
