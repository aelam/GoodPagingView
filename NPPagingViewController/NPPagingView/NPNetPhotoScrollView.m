//
//  NPNetPhotoScrollView.m
//  NPPagingViewController
//
//  Created by Ryan Wang on 10/24/12.
//  Copyright (c) 2012 Ryan Wang. All rights reserved.
//

#import "NPNetPhotoScrollView.h"
#import "SDWebImageManager.h"
#import "NIPhotoScrollView.h"

@interface NPNetPhotoScrollView ()<SDWebImageManagerDelegate>

@property (nonatomic,retain) NSURL *thumbnailImageURL;
@property (nonatomic,retain) NSURL *originImageURL;

@property (nonatomic,retain) UIImage *thumbnailImage;
@property (nonatomic,retain) UIImage *originImage;


@end

@implementation NPNetPhotoScrollView

@synthesize originImageURL = _originImageURL;
@synthesize thumbnailImageURL = _thumbnailImageURL;
@synthesize originImage = _originImage;
@synthesize thumbnailImage = _thumbnailImage;


-(void)setThumbnailImageURL:(NSURL*)url placeholder:(UIImage*)image {
    if([[self.thumbnailImageURL absoluteString] isEqualToString:[url absoluteString]]){
        if (self.thumbnailImage) {
            [self setImage:self.thumbnailImage photoSize:NIPhotoScrollViewPhotoSizeThumbnail];
        }
        return;
    }
    
    self.thumbnailImage = nil;
    self.thumbnailImageURL = url;
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadWithURL:self.thumbnailImageURL delegate:self];
    
}

-(void)setOriginalImageURL:(NSURL*)url placeholder:(UIImage*)image {
    if([[self.originImageURL absoluteString] isEqualToString:[url absoluteString]]) {
        if (self.originImage) {
            [self setImage:self.originImage photoSize:NIPhotoScrollViewPhotoSizeThumbnail];
        }

        return;
    }
 
    self.originImage = nil;
    self.originImageURL = url;
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadWithURL:self.originImageURL delegate:self];

}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image forURL:(NSURL *)url userInfo:(NSDictionary *)info;
{
    if([[self.originImageURL absoluteString] isEqualToString:[url absoluteString]]) {
        self.originImage = image;
        [self setImage:image photoSize:NIPhotoScrollViewPhotoSizeOriginal];
    } else if([[self.thumbnailImageURL absoluteString] isEqualToString:[url absoluteString]]){
        self.thumbnailImage = image;
        [self setImage:image photoSize:NIPhotoScrollViewPhotoSizeThumbnail];
    }
    
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFailWithError:(NSError *)error
{
    
}



- (void)dealloc {
    [_thumbnailImageURL release];
    [_originImageURL release];
    [_thumbnailImage release];
    [_originImage release];
    [super dealloc];
}


@end
