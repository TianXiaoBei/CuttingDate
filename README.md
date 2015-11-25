# CuttingDate
/**

 *  获取指定时间的明天: yyyy-MM-dd HH:mm

 *  Gets a specified time tomorrow

 */

+ (NSString *)GetTomorrowDay:(NSString *)time;



/**

 *  获取指定时间的前一天: yyyy-MM-dd HH:mm

 *  Get the day before the specified time

 */

+ (NSString *)GetYesterdayDay:(NSString *)time;





/**

 *  时间转成字符串,可以改成自己的格式

 *  date to NSString

 *  You can change the format of your own needs

 */

+ (NSString *)dateToString:(NSDate *)date;



/**

 *  字符串转成date

 *  NSString to date

 *  You can change the format of your own needs

 */

+ (NSDate *)StringToDate:(NSString *)timeString;





/**

 *  字符串转成date HH:mm格式

 *  NSString to date

 *  You can change the format of your own needs

 */

+ (NSDate *)StringToDateHHmm:(NSString *)timeString;



/**

 *  将HH:mm格式的时间转成字符串

 *  date to NSString

 *  You can change the format of your own needs

 */

+ (NSString *)dateHHmmToString:(NSDate *)date;



/**

 *  设置指定的时间 Set the specified time

 *  24小时制,都传空获取的是当前的时间,

 *  Twenty hours system,all parameters is empty for the current time

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

                                      second:(NSInteger)second;



/**

 *  返回的是按照指定时间间隔计算好出来的数组,索引所对应的分别是 0:天 1:时 2:分 3:秒

 *  Corresponding to the index is 0:天 1:时 2:分 3:秒

 *  @param startTime 开始的时间

 *  @param endTime   结束的时间

 *

 *  @return 返回的是按照指定时间间隔计算好出来的数组,Array of the specified time interval

 */

+ (NSArray *)GetAppointTimeWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;





/**

 *  按照指定的时间间隔生成的时间字符串数组,时间的样式为 HH:mm/Array of the specified time interval,Format elements in the array is HH:mm

 *  @param startTimeStr 起始时间

 *  @param endTimeStr   结束事件

 *  @param intervalTime 时间间隔,分钟为单位/cut time unit is minute

 *

 *  @return 返回的是按照指定时间间隔计算好出来的数组

 */

+ (NSMutableArray *)GetAppointTimeWithStartTime:(NSString *)startTime endTime:(NSString *)endTime intervalTime:(NSTimeInterval)intervalTime;



/**

 *  获取时间间隔,单位为秒

 *  Get interval between two time periods,unit is second

 *  @param startTime 开始时间

 *  @param endTime   结束时间

 */

+ (NSTimeInterval)GetIntervalWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
