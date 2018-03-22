//
//  ViewController.m
//  PThread
//
//  Created by peace on 2018/3/21.
//  Copyright © 2018 peace. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self pthreadButton:0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark -- Active
- (void)pthreadActive {
    pthread_t thread;
    pthread_create(&thread, NULL, run, @"pthread");
    pthread_detach(thread);
}

// 新线程调用方法，里边为需要执行的任务
void * run(void *param) {
    NSLog(@"%@ ----- %@",param,[NSThread currentThread]);
    
    return NULL;
}

#pragma mark -
#pragma mark -- UI
- (void)pthreadButton:(int)index {
    float y = 20 + index * 50;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor cyanColor]];
    [button setFrame:CGRectMake(0, y, self.view.frame.size.width, 40)];
    [button addTarget:self action:@selector(pthreadActive) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"PThread" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

@end
