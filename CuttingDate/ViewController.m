//
//  ViewController.m
//  CuttingDate
//
//  Created by tianlong on 15/11/25.
//  Copyright © 2015年 SHS_TL. All rights reserved.
//

#import "ViewController.h"
#import "LEO_CutTime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn1 setTitle:@"以30分钟的时间间隔切割一段时间" forState:UIControlStateNormal];
    [btn1 setFrame:CGRectMake(50, 100, 250, 30)];
    [btn1 setBackgroundColor:[UIColor orangeColor]];
    [btn1 addTarget:self action:@selector(clickedBtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn2 setTitle:@"获取时间的间隔" forState:UIControlStateNormal];
    [btn2 setFrame:CGRectMake(50, 150, 250, 30)];
    [btn2 setBackgroundColor:[UIColor greenColor]];
    [btn2 addTarget:self action:@selector(clickedBtn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)clickedBtn1
{
    NSString *start = @"2015-12-12 08:00";
    NSString *end = @"2015-12-12 20:00";
    NSTimeInterval interval = 30;
    NSMutableArray *arr = [LEO_CutTime GetAppointTimeWithStartTime:start endTime:end intervalTime:interval];
    NSLog(@"%@",arr);
}

- (void)clickedBtn2
{
    NSString *start = @"2015-12-12 08:00";
    NSString *end = @"2015-12-12 20:00";
    NSArray *arr = [LEO_CutTime GetAppointTimeWithStartTime:start endTime:end];
   
    NSLog(@"获取时间间隔 \n以天为单位总计:%@天 \n以小时为单位总计:%@小时 \n以分钟微单总计:%@分钟 \n以秒为单位总计:%@秒", [arr objectAtIndex:0], [arr objectAtIndex:1], [arr objectAtIndex:2], [arr objectAtIndex:3]);
}

@end
