//
//  HWDecimalTextField.m
//  skill_demo
//
//  Created by Lucy_Lee on 16/8/26.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import "HWDecimalTextField.h"

#define hw_dotNumbers     @"0123456789.\n"
#define hw_numbers          @"0123456789\n"

@implementation HWDecimalTextField

+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInDecimalRange:(NSRange)range replacementString:(NSString *)string{

    if ([string isEqualToString:@"\n"]||[string isEqualToString:@""]) {//按下return
        return YES;
    }
    
    
    if (string && string.length > 0) {
        // 输入
        if (textField.text.length == 0) {
            if ([string isEqualToString:@"."]) {
                textField.text = @"0";
                return YES;
            }else{
                return YES;
            }
            
        }else if (textField.text.length == 1){
            if ([textField.text isEqualToString:@"0"]) {
                if ([string isEqualToString:@"."]) {
                    return YES;
                }else{
                    return NO;
                }
            }
        }
    }

    NSInteger dotLoction = [textField.text rangeOfString:@"."].location;
    
    NSCharacterSet * characterSet = nil;
    
    if (NSNotFound == dotLoction && 0 != range.location) {
        
        characterSet = [[NSCharacterSet characterSetWithCharactersInString:hw_dotNumbers] invertedSet];
        
    } else {
        
        characterSet = [[NSCharacterSet characterSetWithCharactersInString:hw_numbers] invertedSet];
    }
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:characterSet] componentsJoinedByString:@""];
    BOOL basicTest = [string isEqualToString:filtered];
    if (!basicTest) {
        NSLog(@"只能输入数字和小数点");
        return NO;
    }
    
    if (NSNotFound != dotLoction && range.location > dotLoction +2) {//小数点后面两位
        NSLog(@"小数点后最多2位");
        return NO;
    }
    
    return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}

@end
