//
//  NSString+ChangeString.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "NSString+ChangeString.h"

@implementation NSString (ChangeString)


+ (NSMutableAttributedString *)changeLabelWithText:(NSString*)needText FontFormatName:(NSString *)name FontSize:(NSInteger)size ReplaceOtherSize:(NSInteger)replaceSize RangeLocation:(NSInteger)location WithRangeLenth:(NSInteger)lenth
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    
    //选中范围文字
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:name size:size] range:NSMakeRange(location,lenth)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:71/255.0 blue:89/255.0 alpha:1] range:NSMakeRange(location,lenth)];
    
    //文字间距
    [attrString addAttribute:NSKernAttributeName value:@1.0f range:NSMakeRange(0, needText.length)];
    
    if (location == 0) {
        //其余文字
        [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:name size:replaceSize] range:NSMakeRange(lenth,needText.length-lenth)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(2,needText.length-2)];

    }else{
        //其余文字
        [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:name size:replaceSize] range:NSMakeRange(0,location)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,location)];
        
        
        [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:name size:replaceSize] range:NSMakeRange(lenth+location,needText.length-(lenth+location))];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(lenth+location,needText.length-(lenth+location))];
    }
    
    return attrString;
}

@end
