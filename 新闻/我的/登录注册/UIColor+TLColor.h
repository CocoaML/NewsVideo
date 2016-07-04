//
//  UIColor+TLColor.h
//  ReadyGo
//
//  Created by GCZ on 15/6/2.
//  Copyright (c) 2015年 GCZ. All rights reserved.
//  十六进制字符串显示颜色

#import <UIKit/UIKit.h>

@interface UIColor (TLColor)
+ (UIColor *)colorWithHex:(NSString *)hex;
+ (UIColor *)colorWithHex:(NSString *)hex alpha:(float)alpha;
@end
