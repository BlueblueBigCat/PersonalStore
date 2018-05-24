//
//  RSShowDatePickerView.h
//  RSProject
//
//  Created by 于露 on 2018/5/16.
//  Copyright © 2018年 ziroomer. All rights reserved.
//
#import "THDatePickerView.h"
#import <UIKit/UIKit.h>
typedef void(^RSShowDatePickerViewHandler)(NSString *timeStr);

@interface RSShowDatePickerView : UIView
@property (nonatomic,assign) BOOL isSlide; // 是否不小于当前时间
@property (nonatomic,assign) NSInteger minuteInterval; // 分钟间隔
@property (copy, nonatomic) NSString *date; // 不小于选中的时间
@property (copy, nonatomic) NSString *selectedDate; // 选中的时间
@property (nonatomic,copy) RSShowDatePickerViewHandler certainHandler;
@property (nonatomic,copy) RSShowDatePickerViewHandler cancleHandler;

// 展示pickerview
- (void)showDatePickerView;

@end
