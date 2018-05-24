//
//  ViewController.m
//  TestProject
//
//  Created by 于露 on 2018/5/24.
//  Copyright © 2018年 于露. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc] init];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIButton * datePickerBtn = [[UIButton alloc] init];
    [datePickerBtn setTitle:@"选择时间" forState:UIControlStateNormal];
    [datePickerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [datePickerBtn addTarget:self action:@selector(datePickerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:datePickerBtn];
    
    [datePickerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(100);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
        make.top.equalTo(@100);
    }];
    
}

- (void)datePickerButtonClicked:(UIButton *)sender
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
