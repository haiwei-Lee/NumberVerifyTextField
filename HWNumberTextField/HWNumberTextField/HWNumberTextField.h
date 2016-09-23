//
//  HWNumberTextField.h
//  skill_demo
//
//  Created by Lucy_Lee on 16/8/26.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HWNumberTextFieldType){
    HWNumberTextFieldPureNumber ,//纯数字的类型
    HWNumberTextFieldDecimal//数字与小数的类型
};

@interface HWNumberTextField : UITextField

+ (HWNumberTextField *)textFieldWithType:(HWNumberTextFieldType)textFieldType;

+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end
