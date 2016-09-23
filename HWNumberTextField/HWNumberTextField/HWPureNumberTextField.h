//
//  HWPureNumberTextField.h
//  skill_demo
//
//  Created by Lucy_Lee on 16/8/26.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWPureNumberTextField : UITextField

+(BOOL)textField:(UITextField *)textField shouldChangeCharactersInNumberRange:(NSRange)range replacementString:(NSString *)string;

@end
