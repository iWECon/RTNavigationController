// Copyright (c) 2016 rickytan <ricky.tan.xin@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <objc/runtime.h>

#import "UIViewController+RTRootNavigationController.h"
#import "RTRootNavigationController.h"

@implementation UIViewController (RTRootNavigationController)
@dynamic rt_disableInteractivePop;

- (void)setRt_disableInteractivePop:(BOOL)rt_disableInteractivePop
{
    objc_setAssociatedObject(self, @selector(rt_disableInteractivePop), @(rt_disableInteractivePop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)rt_disableInteractivePop
{
    return [objc_getAssociatedObject(self, @selector(rt_disableInteractivePop)) boolValue];
}

- (Class)rt_navigationBarClass
{
    return nil;
}

- (RTRootNavigationController *)rt_navigationController
{
    UIViewController *vc = self;
    while (vc && ![vc isKindOfClass:[RTRootNavigationController class]]) {
        vc = vc.navigationController;
    }
    return (RTRootNavigationController *)vc;
}

- (void)dismiss {
    [self dismissWithCompletion:nil animated:YES];
}

- (void)dismissWithCompletion:(void (^)(void))completion animated:(BOOL)animated {
    UIViewController *target = self;
    while (target.parentViewController != nil &&
        ![target.parentViewController isKindOfClass:UINavigationController.class]) {
        target = target.parentViewController;
    }
    if (target.rt_navigationController) {
        if (target.rt_navigationController.rt_viewControllers.count > 1) {
            if (target.rt_navigationController.rt_topViewController != target) {
                [target.rt_navigationController removeViewController:target animated:target.isViewLoaded && target.view.window != nil];
            } else {
                [target.navigationController popViewControllerAnimated:animated];
            }
            if (completion) {
                completion();
            }
        } else {
            [target.navigationController dismissViewControllerAnimated:animated completion:completion];
        }
    } else if ([target.navigationController isKindOfClass:[UINavigationController class]]) {
        if (target.navigationController.viewControllers.count > 1) {
            if (target.navigationController.viewControllers.lastObject != target) {
                NSMutableArray *controllers = [NSMutableArray array];
                for (UIViewController *vc in target.navigationController.viewControllers) {
                    if (vc != self) {
                        [controllers addObject:vc];
                    }
                }
                [target.navigationController setViewControllers:controllers animated:target.isViewLoaded && target.view.window != nil];
            } else {
                [target.navigationController popViewControllerAnimated:animated];
            }
            if (completion) {
                completion();
            }
        } else {
            [target.navigationController dismissViewControllerAnimated:animated completion:completion];
        }
    } else {
        [target dismissViewControllerAnimated:animated completion:completion];
    }
}

@end

@implementation UIPercentDrivenInteractiveTransition (Conditional)

- (BOOL)canBeInteractive {
    return [objc_getAssociatedObject(self, @selector(canBeInteractive)) boolValue];
}

- (void)setCanBeInteractive:(BOOL)canBeInteractive {
    objc_setAssociatedObject(self, @selector(canBeInteractive), @(canBeInteractive), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
