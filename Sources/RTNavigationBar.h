//
//  RTNavigationBar.h
//  
//
//  Created by iWw on 2021/1/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RTNavigationBar : UINavigationBar

@property (nonatomic, retain) UIView *titleView;

- (void)removeBottomLine;

@end

NS_ASSUME_NONNULL_END
