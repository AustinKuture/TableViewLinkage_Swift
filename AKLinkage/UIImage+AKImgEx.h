//
//  UIImage+AKImgEx.h
//  AKIRPManage
//
//  Created by 李亚坤 on 2017/3/2.
//  Copyright © 2017年 李亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (AKImgEx)

- (instancetype)resizeWithImageName:(NSString *)imgName;

- (UIImage*)createImageWithColor:(UIColor*)color RectSize:(CGSize)rectSize CornerRadius:(float)cornerRadius;

- (UIImage *)createImageWithColor:(UIColor *)color RectSize:(CGSize)rectSize Title:(NSString *)title TitleColor:(UIColor *)titleColor CornerRadius:(float) cornerRadius;

@end
