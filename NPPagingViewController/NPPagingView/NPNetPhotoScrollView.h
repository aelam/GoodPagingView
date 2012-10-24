//
//  NPNetPhotoScrollView.h
//  NPPagingViewController
//
//  Created by Ryan Wang on 10/24/12.
//  Copyright (c) 2012 Ryan Wang. All rights reserved.
//

#import "NIPhotoScrollView.h"


@interface NPNetPhotoScrollView : NIPhotoScrollView {

}

-(void)setThumbnailImageURL:(NSURL*)url placeholder:(UIImage*)image;
-(void)setOriginalImageURL:(NSURL*)url placeholder:(UIImage*)image;

@end
