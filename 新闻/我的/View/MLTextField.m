//
//  CPTextField.m
//  
//
//  Created by cocoaML on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MLTextField.h"

@implementation MLTextField

- (void)setClsBtnWithPlaceholderStr:(NSString *)placeholderStr andLeftViewImageStr:(NSString *)imageStr{
    self.backgroundColor = [UIColor whiteColor];  //[UIColor colorWithHex:@"#000000" alpha:0.16];
    self.textColor = [UIColor colorWithHex:@"#414141"];     //[UIColor whiteColor];
    self.placeholder = placeholderStr;
    [self setValue:[UIColor colorWithHex:@"#999999" alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    self.tintColor = [UIColor colorWithHex:@"#999999" alpha:1];
//    self.layer.cornerRadius = CPTextFieldHight/2;
    self.clearButtonMode = UITextFieldViewModeAlways;
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    view.image = [UIImage imageNamed:imageStr];
    self.leftView = view;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.font = [UIFont systemFontOfSize:16];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(25,self.frame.size.height-2, self.frame.size.width, 1)];
    line.backgroundColor = [UIColor colorWithHex:@"#999999" alpha:1];
    [self addSubview:line];
    
    [self addTarget:self action:@selector(changeTF) forControlEvents:UIControlEventEditingChanged];
    
//        self.delegate = vc;
    
    // 设置textField添加键盘退出按钮
    
    //手势键盘退出
//    [vc.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardBack)]];
}

//- (void)keyboardBack{
//    [self.vc.view endEditing:YES];
//}

// 设置textfield的clearBtn
- (void)changeTF {
    UIButton *clearButton = [self valueForKey:@"_clearButton"];
    [clearButton setImage:[UIImage imageNamed:@"删除按钮图片"] forState:UIControlStateNormal];
}

////控制左视图位置
//- (CGRect)leftViewRectForBounds:(CGRect)bounds {
//    NSLog(@"NSStringFromCGRect--%@", NSStringFromCGRect(bounds));
//    return CGRectMake(bounds.origin.x + 5, bounds.origin.y, bounds.size.width, bounds.size.height);
//}
//控制placeHolder的位置
- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 25, bounds.origin.y, bounds.size.width -10, bounds.size.height);
}
//控制显示文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 25, bounds.origin.y, bounds.size.width -10, bounds.size.height);
}
//控制编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 25, bounds.origin.y, bounds.size.width -10, bounds.size.height);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
