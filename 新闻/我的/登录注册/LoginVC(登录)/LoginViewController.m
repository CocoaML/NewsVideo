//
//  CPLoginViewController.m
//  
//
//  Created by cocoaML on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "MLTextField.h"
#import "RegisterViewController.h"    // 注册控制器
#import "ForgetPwdViewController.h"   // 忘记密码控制器

#define PATH  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"Login.plist"]

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollView;

@property (weak, nonatomic) IBOutlet MLTextField *phoneTF;
@property (weak, nonatomic) IBOutlet MLTextField *pawdTF;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;    // 登录按钮
@property (weak, nonatomic) IBOutlet UIButton *forgetPawdBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    self.loginScrollView.backgroundColor = [UIColor whiteColor];
    
    [self setBarButtonItem];
    
    // 设置 TextField
    [self setTextField];
    
    [self setLoginAndForgetBtnStyle];
    
    _forgetPawdBtn.hidden = YES;        // 隐藏忘记密码按钮
}

- (void)setBarButtonItem {
    UIBarButtonItem *rightBBI = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(clickrRegisterBtn)];
    self.navigationItem.rightBarButtonItem = rightBBI;
}

- (void)setTextField {
    [_phoneTF setClsBtnWithPlaceholderStr:@"请输入手机号" andLeftViewImageStr:@"用户名.png"];
    [_pawdTF setClsBtnWithPlaceholderStr:@"请输入密码" andLeftViewImageStr:@"密码.png"];

}

- (void)setLoginAndForgetBtnStyle {
    [self.loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.forgetPawdBtn addTarget:self action:@selector(clickForgetPawdBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickLoginBtn {
    // 登录代码
//    ALERT(@"登录成功！");
//    [[NSUserDefaults standardUserDefaults] setObject:@"isLogin" forKey:YES];    // 登录成功
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"LoginAndRegister" ofType:@"plist"];
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    

    //正确的情况
    // 登录成功
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:PATH];
    NSLog(@"登录：dic --- %@", dict);

    if([_pawdTF.text isEqualToString:[dict objectForKey:_phoneTF.text]]){
        [MBProgressHUD showSuccess:@"登录成功！"];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [MBProgressHUD showError:@"登录失败，请稍后重试！"];

    }
//    [self dismissViewControllerAnimated:YES completion:nil];

}

// 页面返回
- (IBAction)clickBackBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

// 跳转到注册页面
- (void)clickrRegisterBtn {
    //    ALERT(@"我去注册啊，稍等");
    RegisterViewController *registerVC = TL_INSTANT_VC_WITH_ID(@"Main", @"CPRegisterViewController");
    registerVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:registerVC animated:YES];
}

// 跳转到忘记密码页面
- (void)clickForgetPawdBtn {
    ForgetPwdViewController *forgetPawd = TL_INSTANT_VC_WITH_ID(@"Main", @"CPForgetPwdViewController");
    forgetPawd.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:forgetPawd animated:YES];

}

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
