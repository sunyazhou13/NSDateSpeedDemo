//
//  NSDate+YZUtils.m
//  NSDateSpeedDemo
//
//  Created by sunyazhou on 2023/2/13.
//

#import "NSDate+YZUtils.h"

@implementation NSDate (YZUtils)

- (BOOL)isTodayWithDate:(NSDate *)date {
    NSDate *selfBegin = [self dateByBeginDay];
    NSDate *dateBegin = [date dateByBeginDay];
    if (fabs([selfBegin timeIntervalSinceDate:dateBegin]) < 1.0e-6) {
        return YES;
    }
    return NO;
}

- (NSDate *)dateByBeginDay {
    //前一天的结束  16:00为结束  8小时时区  今天开始 也就是说 前一天的00:00:00
    unsigned int flags      = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *parts = [[NSCalendar currentCalendar] components:flags fromDate:self];
    [parts setHour:0];
    [parts setMinute:0];
    [parts setSecond:0];
    return [[NSCalendar currentCalendar] dateFromComponents:parts];
}

- (BOOL)isToday {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:self];
    NSDate *otherDate = [cal dateFromComponents:components];
    return [today isEqualToDate:otherDate];
}

@end
