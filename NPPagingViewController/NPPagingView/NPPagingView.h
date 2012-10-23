//
//  NPPagingView.h
//  niupai
//
//  Created by Ryan Wang on 12-10-24.
//
//

#import <UIKit/UIKit.h>

@class NPPagingView;

@protocol NPPagingViewDelegate <NSObject>

@required

- (NSUInteger)numberOfPagesInPagingView:(NPPagingView *)pagingView;
- (UIView*)pagingView:(NPPagingView *)pagingView pageForRowAtIndex:(NSInteger)index;

@end

@interface NPPagingView : UIView

@property (nonatomic,assign) id <NPPagingViewDelegate>delegate;

- (UIView *)dequeueRecycledPage;

// Reloads the photo browser and refetches data
- (void)reloadData;

// Set page that photo browser starts on
- (void)setInitialPageIndex:(NSUInteger)index;

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation;


@end
