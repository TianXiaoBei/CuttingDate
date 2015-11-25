//
//  LEO_CutTime.m
//  LEO_CutTime
//
//  Created by tianlong on 15/11/24.
//  Copyright © 2015年 SHS_TL. All rights reserved.
//

#import "LEO_CutTime.h"

@implementation LEO_CutTime


/**
 *  获取指定时间的明天
 *  Gets a specified time tomorrow
 */
+ (NSString *)GetTomorrowDay:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [formatter dateFromString:time];
    NSDate *tomorrow = [NSDate dateWithTimeInterval:60 * 60 * 24 sinceDate:date];//下一天
    NSString *tomorrowStr = [formatter stringFromDate:tomorrow];
    return tomorrowStr;
}

/**
 *  获取指定时间的前一天
 *  Get the day before the specified time
 */
+ (NSString *)GetYesterdayDay:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [formatter dateFromString:time];
    NSDate *yesterday = [NSDate dateWithTimeInterval:-60 * 60 * 24 sinceDate:date];//前一天
    NSString *yesterStr = [formatter stringFromDate:yesterday];
    return yesterStr;
}

/**
 *  时间转成字符串
 */
+ (NSString *)dateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    return dateStr;
}

/**
 *  字符串转成date
 */
+ (NSDate *)StringToDate:(NSString *)timeString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [formatter dateFromString:timeString];
    
    return date;
}

/**
 *  字符串转成date HH:mm格式
 */
+ (NSDate *)StringToDateHHmm:(NSString *)timeString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSDate *date = [formatter dateFromString:timeString];
    
    return date;
}

/**
 *  将HH:mm格式的时间转成字符串
 */
+ (NSString *)dateHHmmToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *str = [dateFormatter stringFromDate:date];
    
    return str;
}


/**
 *    24小时制,都传空获取的是当前的时间,设置指定的时间
 *
 *  @param year   设置指定的年份
 *  @param month  设置指定的月份
 *  @param day    设置指定的日期
 *  @param hour   设置指定的小时
 *  @param minute 设置指定的分钟
 *  @param second 设置指定的秒数
 *
 *  @return NSDateComponents对象
 */
+ (NSDateComponents *)GetAppointTimeWithYear:(NSInteger)year
                                       month:(NSInteger)month
                                         day:(NSInteger)day
                                        hour:(NSInteger)hour
                                      minute:(NSInteger)minute
                                      second:(NSInteger)second
{
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitWeekday |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitWeekdayOrdinal|
    NSCalendarUnitSecond;
    
    comps = [calendar components:unitFlags fromDate:date];
    //    NSInteger week = [comps weekday];////注意：星期日是数字1，星期一时数字2，以此类推
    //    NSInteger year=[comps year];
    //    NSInteger month = [comps month];
    //    NSInteger day = [comps day];
    //    NSInteger second = [comps second];
    //    NSInteger minute = [comps minute];
    //    NSInteger hour = [comps hour];
    
    //    //可以设置指定的时间
    //   [comps setYear:2016];
    //   [comps setDay:11];
    //   [comps setMonth:11];
    [comps setHour:hour];
    [comps setMinute:minute];
    [comps setSecond:second];
    return comps;
}

#pragma mark - 获取时间间隔
/**
 *  返回的是数组,索引所对应的分别是 0:天 1:时 2:分 3:秒
 *
 *  @param startTimeStr 开始的时间
 *  @param endTimeStr   结束的时间
 *
 *  @return 两段间隔的总分钟数
 */
+ (NSArray *)GetAppointTimeWithStartTime:(NSString *)startTime endTime:(NSString *)endTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSString *temp = nil;
    NSDate *date1 = nil;
    NSDate *start = [NSDate date];
    
    if (startTime == nil)
    {
        temp = [LEO_CutTime dateToString:start];
        date1 = [dateFormatter dateFromString:temp];
    }
    else
    {
        
        date1 = [dateFormatter dateFromString:startTime];
    }
    NSDate *date2 = [dateFormatter dateFromString:endTime];
    //取两个日期对象的时间间隔：
    NSTimeInterval intervalTime = [date2 timeIntervalSinceDate:date1];//间隔的总秒数
    NSInteger days = ((NSInteger)intervalTime)/(3600*24);
    NSInteger hours = ((NSInteger)intervalTime)%(3600*24)/3600;
    NSInteger minutes = ((NSInteger)intervalTime)/(60);
    
    
    NSMutableArray *tepmArr = [NSMutableArray array];
    //天数
    NSString *appointDays = [[NSString alloc] initWithFormat:@"%li",(long)days];
    [tepmArr addObject:appointDays];
    
    //小时
    NSString *appointHours = [[NSString alloc] initWithFormat:@"%li",(long)hours];
    [tepmArr addObject:appointHours];
    
    //分钟
    NSString *appointMinutes = [[NSString alloc] initWithFormat:@"%li",(long)minutes];
    [tepmArr addObject:appointMinutes];
    
    //秒
    NSString *appointSeconds = [[NSString alloc] initWithFormat:@"%li",(long)intervalTime];
    [tepmArr addObject:appointSeconds];
    
    NSArray *arr = [NSArray arrayWithArray:tepmArr];
    
    return arr;
}

#pragma mark -按照指定的时间间隔生成的时间字符串数组,时间的样式为 HH:mm
/**
 *  按照指定的时间间隔生成的时间字符串数组,时间的样式为 HH:mm
 *
 *  @param startTimeStr 起始时间
 *  @param endTimeStr   结束事件
 *  @param intervalTime 时间间隔,分钟为单位
 *
 *  @return 按照指定的时间间隔生成的时间字符串数组
 */
+ (NSMutableArray *)GetAppointTimeWithStartTime:(NSString *)startTime endTime:(NSString *)endTime intervalTime:(NSTimeInterval)intervalTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSString *temp = nil;
    NSDate *date1 = nil;
    NSDate *start = [NSDate date];
    
    if (startTime == nil)
    {
        temp = [LEO_CutTime dateToString:start];
        date1 = [dateFormatter dateFromString:temp];
    }
    else
    {
        date1 = [dateFormatter dateFromString:startTime];
    }
    NSDate *date2 = [dateFormatter dateFromString:endTime];
    //取两个日期对象的时间间隔：
    NSTimeInterval time = [date2 timeIntervalSinceDate:date1];//单位为秒
    
    //    NSInteger days = ((NSInteger)time)/(3600*24);
    //    NSInteger minutes = ((NSInteger)time)/(60);
    NSInteger hours = (NSInteger)time%(3600*24)/3600;
    
    //计算并换算成指定时间间隔的时间样式
    NSMutableArray *appointArray = [NSMutableArray array];
    
    {
        //转换成时分的格式
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm"];//@"HH点mm分"
        
        //间隔内一共多少小时,1小时 = 2 * 30分钟,所以遍历长度为小时数的2倍
        NSInteger range = hours * 2 + 1;
        for (NSInteger i = 0 ; i <= range; i++)
        {
            NSTimeInterval interval = 60 * i * intervalTime;//interval:最终必须换算成秒
            NSDate * intervalDate = [date1 dateByAddingTimeInterval:interval];
            NSString *intervalTimeStr = [formatter stringFromDate:intervalDate];
            
            //如果拼接的时间等于或者超过了最晚配送时间跳出循环
            //According to their needs out of the loop
            if ([intervalDate compare:date2] == NSOrderedDescending || NSOrderedSame)
            {
                NSLog(@"预约时间加成后的最终时间等于或者超过最晚配送时间跳出循环 %s",__FUNCTION__);
                break;
            }
            else
            {
                if (intervalTimeStr != nil)
                {
                    [appointArray addObject:intervalTimeStr];
                }
            }
        }
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:appointArray];
    return array;
}


/**
 *  获取时间间隔,单位为秒
 *  According to the time interval,unit is second
 *  @param startTime 开始时间
 *  @param endTime   结束时间
 */
+ (NSTimeInterval)GetIntervalWithStartTime:(NSString *)startTime endTime:(NSString *)endTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSString *temp = nil;
    NSDate *date1 = nil;
    NSDate *start = [NSDate date];
    
    if (startTime == nil)
    {
        temp = [LEO_CutTime dateToString:start];
        date1 = [dateFormatter dateFromString:temp];
    }
    else
    {
        date1 = [dateFormatter dateFromString:startTime];
    }
    NSDate *date2 = [dateFormatter dateFromString:endTime];
    //取两个日期对象的时间间隔：
    NSTimeInterval time = [date2 timeIntervalSinceDate:date1];//单位为秒
    return time;
}


@end
