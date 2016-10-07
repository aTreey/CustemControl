//
//  LTCustom.h
//  HaierProduct
//
//  Created by LaoTao on 14-5-5.
//  Copyright (c) 2014年 CaiGaoBaDou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LTCustom : NSObject

//创建label
+ (UILabel *)creatLabelWithFrame:(CGRect)frame
                            text:(NSString *)text
                       alignment:(NSTextAlignment)textAlignment;

+ (UILabel *)creatLabelWithFrame:(CGRect)frame
                            text:(NSString *)text
                            font:(UIFont *)font
                       textColor:(UIColor *)color
                       alignment:(NSTextAlignment)textAlignment;

//创建带标题的button
+ (UIButton *)creatButtonFrame:(CGRect)frame
                         title:(NSString *)string
                        target:(id)target
                        action:(SEL)sel
                           tag:(NSInteger)tag;

//创建图片类型的button
+ (UIButton *)creatButtonFrame:(CGRect)frame
                     imageName:(NSString *)imageName
               selectImageNmae:(NSString *)selectImageName
                        target:(id)target
                        action:(SEL)sel
                           tag:(NSInteger)tag;

+ (UIButton *)creatButtonFrame:(CGRect)frame
                     bgImageName:(NSString *)imageName
               bgSelectImageNmae:(NSString *)selectImageName
                        target:(id)target
                        action:(SEL)sel
                           tag:(NSInteger)tag;

//创建textField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                                  secure:(BOOL)isSecure
                                   place:(NSString *)string
                                     tag:(NSInteger)tag
                                delegate:(id<UITextFieldDelegate>)delegate;

//创建textView
+ (UITextView *)creatTextViewWithFrame:(CGRect)frame
                                   tag:(NSInteger)tag
                              delegate:(id<UITextViewDelegate>)delegate;

//创建一个ImageView
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame
                               imageName:(NSString *)imageName;

#pragma mark - 添加层
+ (void)addViewLayeView:(UIView *)view
                 border:(CGFloat)border
                 corner:(NSInteger)corner;

+ (void)addViewLayeView:(UIView *)view
                  color:(UIColor *)color
                 border:(CGFloat)border
                 corner:(CGFloat)corner;

+ (void)addViewCustomLayer:(UIView *)view;

#pragma mark - 旋转动画
+ (UIImageView *)rotate360DegreeWithImageView:(UIImageView *)imageView;

#pragma mark - 停止旋转
+ (void)imageStopTransform:(UIImageView *)imageView;

//创建一个警告框AlertView
+ (UIAlertView *)showAlertViewTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate;

#pragma mark - 错误提示
+ (void)showAlertViewWithErrCode:(NSInteger)err_Code;

@end
