//
//  HWPureNumberTextField.m
//  skill_demo
//
//  Created by Lucy_Lee on 16/8/26.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import "HWPureNumberTextField.h"

#define hw_numbers          @"0123456789\n"

@implementation HWPureNumberTextField

+(BOOL)textField:(UITextField *)textField shouldChangeCharactersInNumberRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([string isEqualToString:@"\n"]||[string isEqualToString:@""]) {//按下return
        return YES;
    }
    
    if (textField.text.length == 0) {
        if ([string isEqualToString:@"0"]) {
            return NO;
        }
    }
    NSCharacterSet * characterSet = [[NSCharacterSet characterSetWithCharactersInString:hw_numbers] invertedSet];
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:characterSet] componentsJoinedByString:@""];
    
    BOOL basicTest = [string isEqualToString:filtered];
    
    if (!basicTest) {
        NSLog(@"只能输入数字");
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
