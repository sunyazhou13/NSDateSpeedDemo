//
//  NSDate+YZUtils.h
//  NSDateSpeedDemo
//
//  Created by sunyazhou on 2023/2/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (YZUtils)

- (BOOL)isTodayWithDate:(NSDate *)date;
- (NSDate *)dateByBeginDay;
- (BOOL)isToday;

@end

NS_ASSUME_NONNULL_END
