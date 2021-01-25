//
//  RTNavigationBar.m
//  
//
//  Created by iWw on 2021/1/25.
//

#import "RTNavigationBar.h"

@implementation RTNavigationBar

- (void)removeBottomLine {
    self.shadowImage = [UIImage new];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 11) {
        @try {
            for (UIView *view in self.subviews) {
                Class clazz = NSClassFromString(@"_UIBarBackground");
                if (clazz && [view isKindOfClass:clazz]) {
                    for (UIView *obj in view.subviews) {
                        if ([obj isKindOfClass:[UIImageView class]]) {
                            [obj setHidden:YES];
                        }
                    }
                }
            }
        } @catch (NSException *exception) {
            NSLog(@"catch error: \(%@)", exception);
        } @finally {
            
        }
    }
}

- (void)setTitleView:(UIView *)titleView {
    _titleView = titleView;
    if ([self.nextResponder isKindOfClass:[UIViewController class]]) {
        [[(UIViewController *)self.nextResponder navigationItem] setTitleView:titleView];
    }
}

@end
