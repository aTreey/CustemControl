//
//  LTCustom.m
//  HaierProduct
//
//  Created by LaoTao on 14-5-5.
//  Copyright (c) 2014年 CaiGaoBaDou. All rights reserved.
//

#import "LTCustom.h"
#import <QuartzCore/QuartzCore.h>

@implementation LTCustom

//创建label
+ (UILabel *)creatLabelWithFrame:(CGRect)frame
                            text:(NSString *)text
                       alignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = textAlignment;
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

+ (UILabel *)creatLabelWithFrame:(CGRect)frame
                            text:(NSString *)text
                            font:(UIFont *)font
                       textColor:(UIColor *)color
                       alignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textAlignment = textAlignment;
    label.backgroundColor = [UIColor clearColor];
    if (color) {
        label.textColor = color;
    }
    
    return label;
}


//创建带标题的button
+ (UIButton *)creatButtonFrame:(CGRect)frame
                         title:(NSString *)string
                        target:(id)target
                        action:(SEL)sel
                           tag:(NSInteger)tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:string forState:UIControlStateNormal];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    
    return button;
}

//创建图片类型的button
+ (UIButton *)creatButtonFrame:(CGRect)frame
                     imageName:(NSString *)imageName
               selectImageNmae:(NSString *)selectImageName
                        target:(id)target
                        action:(SEL)sel
                           tag:(NSInteger)tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (imageName.length > 1) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (selectImageName.length > 1) {
        [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    }
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    
    return button;
}

+ (UIButton *)creatButtonFrame:(CGRect)frame
                   bgImageName:(NSString *)imageName
             bgSelectImageNmae:(NSString *)selectImageName
                        target:(id)target
                        action:(SEL)sel
                           tag:(NSInteger)tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (imageName.length > 1) {
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (selectImageName.length > 1) {
        [button setBackgroundImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    }
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    
    return button;
}


//创建textField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                                  secure:(BOOL)isSecure
                                   place:(NSString *)string
                                     tag:(NSInteger)tag
                                delegate:(id<UITextFieldDelegate>)delegate {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    if (isSecure) {
        textField.secureTextEntry = YES;
    }
    
    textField.placeholder = string;
    textField.tag = tag;
    textField.delegate = delegate;
    
    return textField;
}

//创建textView
+ (UITextView *)creatTextViewWithFrame:(CGRect)frame
                                   tag:(NSInteger)tag
                              delegate:(id<UITextViewDelegate>)delegate {
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.delegate = delegate;
    textView.tag = tag;
    return textView;
}

//创建一个ImageView
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame
                               imageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    
    return imageView;
}

#pragma mark - 添加层
+ (void)addViewLayeView:(UIView *)view
                 border:(CGFloat)border
                 corner:(NSInteger)corner{
    view.layer.borderColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1].CGColor;
    view.layer.borderWidth = border;
    view.layer.cornerRadius = corner;
    view.layer.masksToBounds = YES;
}

+ (void)addViewLayeView:(UIView *)view
                  color:(UIColor *)color
                 border:(CGFloat)border
                 corner:(CGFloat)corner {
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = border;
    view.layer.cornerRadius = corner;
    view.layer.masksToBounds = YES;
}

+ (void)addViewCustomLayer:(UIView *)view {
    view.layer.cornerRadius = 4;
    view.layer.masksToBounds = YES;
}

//旋转动画
+ (UIImageView *)rotate360DegreeWithImageView:(UIImageView *)imageView {
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:
                         CATransform3DMakeRotation(M_PI / 2, 0.0, 0.0, 1.0) ];
    animation.duration = 2;
    animation.cumulative = YES;
    animation.repeatCount = HUGE_VALF;
    
    //在图片边缘添加一个像素的透明区域，去图片锯齿
    CGRect imageRrect = CGRectMake(0, 0,imageView.frame.size.width, imageView.frame.size.height);
    UIGraphicsBeginImageContext(imageRrect.size);
    [imageView.image drawInRect:CGRectMake(1,1,imageView.frame.size.width-2,imageView.frame.size.height-2)];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [imageView.layer addAnimation:animation forKey:nil];
    return imageView;
}

#pragma mark ====旋转动画======
+ (CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount
{
    CATransform3D rotationTransform = CATransform3DMakeRotation(degree, 0, 0, direction);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration  =  dur;
    animation.autoreverses = NO;
    animation.cumulative = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = repeatCount;
    animation.delegate = self;
    
    return animation;
}

//停止旋转
+ (void)imageStopTransform:(UIImageView *)imageView {
    [imageView.layer removeAllAnimations];
}

//创建一个警告框AlertView
+ (UIAlertView *)showAlertViewTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate {
    
    //iOS8 及以下版本
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    //显示警告框
    [alertView show];
    return alertView;
}

#pragma mark - 错误提示
+ (void)showAlertViewWithErrCode:(NSInteger)err_Code {
    /*
     let ERR_EMPTY_ALL : NSInteger = 1000;	//请输入用户名和密码
     let ERR_EMPTY_PHONE : NSInteger = 1001;	//请输入手机号
     let ERR_EMPTY_PASS : NSInteger = 1002;	//请输入密码
     let ERR_EMPTY_UserName : NSInteger = 1003;	//请输入用户名
     let ERR_EMPTY_MemberName : NSInteger = 1004;	//请输入成员用户名
     let ERR_EMPTY_AccountError : NSInteger = 1005;	//账号无法识别
     let ERR_EMPTY_NickName : NSInteger = 1006;	//请添加昵称
     let ERR_EMPTY_Gender : NSInteger = 1007;	//请选择性别
     let ERR_EMPTY_Birthday : NSInteger = 1008;	//请添加出生日期
     let ERR_EMPTY_Height : NSInteger = 1009;	//请输入身高
     let ERR_EMPTY_Weight : NSInteger = 1010;	//请输入体重
     let ERR_EMPTY_Code : NSInteger = 1011;	//请输入验证码
     
     let ERR_Register_Not : NSInteger = 2001;	//账号未注册
     let ERR_Has_User : NSInteger = 2003;	//账号已存在
     let ERR_Has_Member : NSInteger = 2004;	//成员账号已存在
     
     let ERR_Wrong_Token : NSInteger = 3001;	//账号识别错误
     let ERR_Wrong_User : NSInteger = 3002;	///用户名或者密码错误
     let ERR_Wrong_Code : NSInteger = 3003;	//短信验证码错误
     let ERR_Wrong_Code_Type : NSInteger = 3004;	//请填写正确的验证码
     let ERR_Wrong_Same_Pass : NSInteger = 3005;	//输入密码不一致
     let ERR_Wrong_Pass : NSInteger = 3006;	//原密码错误
     
     let Err_Msg_Send : NSInteger = 4002;	//验证码发送失败
     let Err_Msg_Too_Mush : NSInteger = 4003;	//操作过于频繁
     let ERR_Msg_Type : NSInteger = 4004;	//消息类型不正确
     let ERR_Msg_No_Send : NSInteger = 4005;	//验证码未发送
     let ERR_DB : NSInteger = 5001;	//系统错误
     */
    NSDictionary *errDic = @{@"1000" : @"请输入手机号和密码", @"1001" : @"请输入手机号", @"1002" : @"请输入密码", @"1003" : @"请输入用户名", @"1004" : @"请输入成员用户名", @"1005" : @"账号无法识别", @"1006" : @"请添加昵称", @"1007" : @"请选择性别", @"1008" : @"请添加出生日期", @"1009" : @"请输入身高", @"1010" : @"请输入体重", @"1011" : @"请输入验证码",
                             //
                             @"2001" : @"账号未注册", @"2003" : @"账号已存在", @"2004" : @"成员账号已存在",
                             //
                             @"3001" : @"账号识别错误", @"3002" : @"用户名或者密码错误", @"3003" : @"短信验证码错误", @"3004" : @"请填写正确的验证码", @"3005" : @"输入密码不一致", @"3006" : @"原密码错误",
                             @"3010" : @"对方没有设备标识",
                             //
                             @"4002" : @"验证码发送失败", @"4003" : @"操作过于频繁", @"4004" : @"消息类型不正确", @"4005" : @"验证码未发送",
                             @"5000" : @"蓝牙地址没有",
                             @"5001" : @"系统错误",
                             @"0" : @"服务器开小差了"};
    NSString *message = errDic[[NSString stringWithFormat:@"%ld",(long)err_Code]];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

@end



