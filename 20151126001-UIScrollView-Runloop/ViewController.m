//
//  ViewController.m
//  20151126001-UIScrollView-Runloop
//
//  Created by Rainer on 15/11/26.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 *  开始倒计时
 */
- (IBAction)playTimerClickAction {
    // 创建一个默认运行循环状态的定时器
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimerAction:) userInfo:@"dajishi" repeats:YES];
    
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(startTimerAction:) userInfo:@"dajishi" repeats:YES];
    
    // 将定时器添加到NSRunLoopCommonModes类型的定时器中去，防止用户其它操作时，定时器不执行
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 * 暂停定时器
 */
- (IBAction)pauseClickAction{
    [self.timer invalidate];
}

/**
 *  停止定时器
 */
- (IBAction)stopClickAction {
    [self pauseClickAction];
    
    self.timeLabel.text = @"10";
}

/**
 * 开始倒计时
 */
- (void)startTimerAction:(NSTimer *)timer {
    int timeCount = self.timeLabel.text.intValue;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%d", --timeCount];
    
    if (timeCount == 0) {
        [self pauseClickAction];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
