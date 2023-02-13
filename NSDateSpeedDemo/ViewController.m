//
//  ViewController.m
//  NSDateSpeedDemo
//
//  Created by sunyazhou on 2023/2/13.
//

#import "ViewController.h"
#import "NSDate+YZUtils.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *l1;
@property (weak, nonatomic) IBOutlet UILabel *l2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)didSysDateClick:(id)sender {
    NSDate *date = [NSDate date];
    CFTimeInterval startTime = CACurrentMediaTime();
    for (int i = 0; i < 1000; i++) {
        __unused BOOL inToday = [[NSCalendar currentCalendar] isDateInToday:date];
    }
    CFTimeInterval endTime = CACurrentMediaTime();
    NSString *log = [NSString stringWithFormat:@"NSCalendar耗时:%f",endTime - startTime];
    NSLog(@"%@", log);
    self.l1.text = log;
    
}
- (IBAction)didOnCusDateClick:(id)sender {
    NSDate *date = [NSDate date];
    CFTimeInterval startTime = CACurrentMediaTime();
    for (int i = 0; i < 1000; i++) {
        __unused BOOL inToday = [date isTodayWithDate:date];
        self.l2.text = [NSString stringWithFormat:@"SysDate:%d",i];
    }
    CFTimeInterval endTime = CACurrentMediaTime();
    NSString *log = [NSString stringWithFormat:@"NSDate (YZUtils)耗时:%f",endTime - startTime];
    NSLog(@"%@", log);
    self.l2.text = log;
}


@end
