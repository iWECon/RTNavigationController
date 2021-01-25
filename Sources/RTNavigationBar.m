//
//  RTNavigationBar.m
//  
//
//  Created by iWw on 2021/1/25.
//

#import "RTNavigationBar.h"

@interface RTNavigationBar ()

@property (nonatomic, retain) UIColor *rt_barTintColor;

@end

@implementation RTNavigationBar

- (void)setBarTintColor:(UIColor *)barTintColor {
    if (self.rt_barTintColor != barTintColor) {
        self.rt_barTintColor = barTintColor;
    }
    [super setBarTintColor:barTintColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // reload bar tint color
    if (self.rt_barTintColor) {
        [self setBarTintColor:self.rt_barTintColor];
    }
}

@end
