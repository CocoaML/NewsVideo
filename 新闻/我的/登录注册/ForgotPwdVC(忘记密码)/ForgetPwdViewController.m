//
//  CPForgetPwdViewController.m
//  
//
//  Created by cocoaML on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//
// 忘记密码
#import "ForgetPwdViewController.h"
#import "MLTextField.h"

@interface ForgetPwdViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *forgetScrollView;
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;

@property (weak, nonatomic) IBOutlet MLTextField *phoneTF;
@property (weak, nonatomic) IBOutlet MLTextField *verificationTF;
@property (weak, nonatomic) IBOutlet MLTextField *setNewPawdTF;
@property (weak, nonatomic) IBOutlet MLTextField *confirmPawdTF;

@end

@implementation ForgetPwdViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.forgetScrollView.backgroundColor = [UIColor whiteColor];
    
    // 设置 BarButtonItem
    [self setBarButtonItem];
    
    // 设置 TextField
    [self setTextField];
    
    [self setFinishBtnStyle];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setBarButtonItem {
//    UIBarButtonItem *leftBBI = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickBackBtn)];
//    leftBBI.tintColor = TL_COLOR(redColor);
//    self.navigationItem.leftBarButtonItem = leftBBI;
}

- (void)setTextField {
    [_phoneTF setClsBtnWithPlaceholderStr:@"请输入手机号" andLeftViewImageStr:@"用户名.png"];
    [_verificationTF setClsBtnWithPlaceholderStr:@"请输入验证码" andLeftViewImageStr:@"验证码.png"];
    [_setNewPawdTF setClsBtnWithPlaceholderStr:@"请输入新密码" andLeftViewImageStr:@"密码.png"];
    [_confirmPawdTF setClsBtnWithPlaceholderStr:@"确认新密码" andLeftViewImageStr:@"密码.png"];
}

- (void)setFinishBtnStyle {
    [_finishBtn addTarget:self action:@selector(clickFinishBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickFinishBtn {
    ALERT(@"找回密码啦");
}
#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    

}

- (void)textFieldDidEndEditing:(UITextField *)textField {

}

// 限制 UITextField输入位数
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//
//    if (_identifyingTF.text.length > 0) {
//        self.identifyingTF.rightViewMode = UITextFieldViewModeAlways;
//    } else {
//        self.identifyingTF.rightViewMode = UITextFieldViewModeNever;
//    }
//
//    if (textField == _phoneNumTF)
//        if (range.location >= 11)   // 手机号大于11位时，输入无效
//            return NO;
//
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
