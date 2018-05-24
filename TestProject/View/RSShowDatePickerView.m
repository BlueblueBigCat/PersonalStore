//
//  RSShowDatePickerView.m
//  RSProject
//
//  Created by 于露 on 2018/5/16.
//  Copyright © 2018年 ziroomer. All rights reserved.
//
#define PickerViewHeight 340
#import "MDDeviceHelper.h"
#import "RSShowDatePickerView.h"
@interface RSShowDatePickerView () <THDatePickerViewDelegate>
@property (nonatomic,weak) THDatePickerView * datePickerView;
@end
@implementation RSShowDatePickerView
- (instancetype)init
{
    if (self = [super init]) {
        [self initUI];
    }
    return  self;
}

// 初始化ui
- (void)initUI
{
    UIView *view = [MDDeviceHelper getMainView];
    [self setFrame:view.bounds];
    
    UIView * bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.3;
    [self addSubview:bgView];
    [bgView setFrame:self.frame];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundViewTaped:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [bgView addGestureRecognizer:tap];
    

    THDatePickerView * pView = [[THDatePickerView alloc] init];
    pView.delegate = self;
    self.datePickerView = pView;
    
    [self addSubview:pView];
    [pView setFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, PickerViewHeight)];
    
//    [pView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_bottom).offset(0);
//        make.left.equalTo(self.mas_left);
//        make.right.equalTo(self.mas_right);
//        make.height.mas_equalTo(PickerViewHeight);
//        make.width.equalTo(self);
//    }];
    
    UIWindow *window=[[UIApplication sharedApplication].delegate window];
    [window addSubview:self];
}

- (void)setIsSlide:(BOOL)isSlide
{
    _isSlide = isSlide;
    self.datePickerView.isSlide = isSlide;
}

// 分钟间隔设置
- (void)setMinuteInterval:(NSInteger)minuteInterval
{
    _minuteInterval = minuteInterval;
    self.datePickerView.minuteInterval = _minuteInterval;
}

- (void)setDate:(NSString *)date
{
    _date = date;
    self.datePickerView.date = _date;
}

- (void)setSelectedDate:(NSString *)selectedDate
{
    _selectedDate = selectedDate;
    self.datePickerView.selectedDate = _selectedDate;
}

#pragma mark -- datePickerViewDelegate
- (void)datePickerViewSaveBtnClickDelegate:(NSString *)timer {
  
    [self removeDatePickerView];
    
    if (self.certainHandler) {
        self.certainHandler(timer);
    }
}

- (void)datePickerViewCancelBtnClickDelegate {
    
    [self removeDatePickerView];
    
    if (self.cancleHandler) {
        self.cancleHandler(@"");
    }
}

/*
 tap点击事件
**/
- (void)backgroundViewTaped:(UITapGestureRecognizer *)sender
{
    [self removeDatePickerView];
}


/*
 展示日期选择控件
 **/
- (void)showDatePickerView
{
//   [self setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.2 animations:^{
        //            [self.datePickerView mas_updateConstraints:^(MASConstraintMaker *make) {
        //                make.top.equalTo(self.mas_bottom).offset(-340);
        //                make.bottom.equalTo(self.mas_bottom);
        //            }];

//        [self.datePickerView updateConstraintsIfNeeded];
        self.datePickerView.transform = CGAffineTransformMakeTranslation(0, -PickerViewHeight);

    }];
    

//        [self.datePickerView.superview layoutIfNeeded];
    
    
    [self.datePickerView show];
}


/*
 移除日期选择控件
 **/
- (void)removeDatePickerView
{
//    [self setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.2 animations:^{

//        [self.datePickerView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.mas_bottom);
//            make.height.mas_equalTo(PickerViewHeight);
//
//        }];
//
//        [self.datePickerView.superview layoutIfNeeded];
        self.datePickerView.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
