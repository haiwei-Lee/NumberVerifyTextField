//
//  HWNumberTextField.m
//  skill_demo
//
//  Created by Lucy_Lee on 16/8/26.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import "HWNumberTextField.h"
#import "HWPureNumberTextField.h"
#import "HWDecimalTextField.h"

@implementation HWNumberTextField

+(HWNumberTextField *)textFieldWithType:(HWNumberTextFieldType)textFieldType{

    UITextField * textField = nil;
    
    switch (textFieldType) {
        case HWNumberTextFieldPureNumber:
            textField = (UITextField *)[[HWPureNumberTextField alloc]init];
            break;
            
        case HWNumberTextFieldDecimal:
            textField = (UITextField *)[[HWDecimalTextField alloc]init];
            break;
    }
    
    return (HWNumberTextField *)textField;

}

+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if ([textField isKindOfClass:[HWPureNumberTextField class]]) {
        return [HWPureNumberTextField textField:textField shouldChangeCharactersInNumberRange:range replacementString:string];
    }else if ([textField isKindOfClass:[HWDecimalTextField class]]){
    
        return [HWDecimalTextField textField:textField shouldChangeCharactersInDecimalRange:range replacementString:string];
    }
    
    return YES;
}


@end
