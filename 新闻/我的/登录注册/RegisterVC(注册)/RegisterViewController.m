//
//  RegisterViewController.m
//  
//
//  Created by cocoaML on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//
// 注册控制器
#import "RegisterViewController.h"
#import "MLTextField.h"

#define PATH  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"Login.plist"]

@interface RegisterViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *registerScrollView;

@property (weak, nonatomic) IBOutlet MLTextField *phoneTF;
@property (weak, nonatomic) IBOutlet MLTextField *verificationTF;   // 输入密码
@property (weak, nonatomic) IBOutlet MLTextField *pawdTF;           // 再次输入密码

@property (weak, nonatomic) IBOutlet UIButton *finishBtn;
@property (weak, nonatomic) IBOutlet UIButton *agreeOrNotBtn;


@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.registerScrollView.backgroundColor = [UIColor whiteColor];
    
    // 设置 BarButtonItem
    [self setBarButtonItem];
    
    // 设置 TextField
    [self setTextField];

    [self setFinishAndAgreeBtnStyle];

//    UITapGestureRecognizer *tableViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commentTableViewTouchInSide)];
//    tableViewGesture.numberOfTapsRequired = 1;
//    tableViewGesture.cancelsTouchesInView = NO;
//    [_registerTableView addGestureRecognizer:tableViewGesture];

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
    [_verificationTF setClsBtnWithPlaceholderStr:@"请输入密码" andLeftViewImageStr:@"密码.png"];
    [_pawdTF setClsBtnWithPlaceholderStr:@"请再次输入密码" andLeftViewImageStr:@"密码.png"];
    
}

- (void)setFinishAndAgreeBtnStyle {
    [_finishBtn addTarget:self action:@selector(clickFinishBtn) forControlEvents:UIControlEventTouchUpInside];
    [_agreeOrNotBtn addTarget:self action:@selector(clickAgreeOrNotBtn) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickFinishBtn {
//    ALERT(@"完成注册啦");
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"LoginAndRegister" ofType:@"plist"];
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:PATH];
    NSLog(@" 注册 dic --- %@", dict);

    // 登录成功
    if([_pawdTF.text isEqualToString:_verificationTF.text]){
//        [dic setObject:_pawdTF.text forKey:_phoneTF.text];  // 手机号作为key
        
        
        NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
        [mDict setValue:_pawdTF.text forKey:self.phoneTF.text];
        
        BOOL isSave = [mDict writeToFile:PATH atomically:YES];
        //    NSLog(@"%zd", isSave);
        //    NSLog(@"path -- %@", PATH);
        //    NSLog(@"%@", mDict);
        
        if (isSave) {
//            [MBProgressHUD showError:@"注册成功！"];
            [MBProgressHUD showSuccess:@"注册成功！"];
            
            [self.navigationController popViewControllerAnimated:YES];

        }
//        NSLog(@"---%@", dic);
//        [self.navigationController popViewControllerAnimated:YES];
    } else {
        
    }
}
- (void)clickAgreeOrNotBtn {
//    ALERT(@"同意？不同意");
}

- (IBAction)clickUserAgreeBtn:(id)sender {
//    ALERT(@"用户协议啦");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
