//
//  ViewController.m
//  HWNumberTextField
//
//  Created by Lucy_Lee on 16/9/21.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import "ViewController.h"
#import "HWNumberTextField.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //以下代码只是为了演示使用
    //以下代码只是为了演示使用
    //以下代码只是为了演示使用
    
    
    //下面代码其实已经有了不好的“代码味道”（在创建两个textField的时候有重复代码...），此时有必要进行代码的重构。请感兴趣的小伙伴不妨试着改动一下。
    
    HWNumberTextField * textField = [HWNumberTextField textFieldWithType:HWNumberTextFieldDecimal];
    textField.frame = CGRectMake(10, 100, self.view.frame.size.width - 20, 50);
    textField.layer.borderWidth = 1.0f;
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textField.placeholder = @"可以输入小数点的输入框/类似金额的验证";
    textField.delegate = self;
    textField.keyboardType = UIKeyboardTypeDecimalPad;
    [self.view addSubview:textField];
    
    HWNumberTextField * numTextField = [HWNumberTextField textFieldWithType:HWNumberTextFieldPureNumber];
    numTextField.frame = CGRectMake(10, 200, self.view.frame.size.width - 20, 50);
    numTextField.layer.borderWidth = 1.0f;
    numTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    numTextField.placeholder = @"只能输入纯数字的输入框/类似手机号码的验证";
    numTextField.delegate = self;
    numTextField.keyboardType = UIKeyboardTypeDecimalPad;
    [self.view addSubview:numTextField];
   
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return [HWNumberTextField textField:textField shouldChangeCharactersInRange:range replacementString:string];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
