//
//  ViewController.m
//  GCD
//
//  Created by GG on 16/2/28.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"GCD的四种使用方式";

#pragma mark ------------------串行队列同步执行任务--------------
    
//    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
//    
//    
//    dispatch_sync(serialQueue, ^{
//        NSLog(@"1 = %@",[NSThread currentThread]);
//    });
//    
//    dispatch_sync(serialQueue, ^{
//        NSLog(@"2 = %@", [NSThread currentThread]);
//    });
//    dispatch_sync(serialQueue, ^{
//        NSLog(@"3 = %@", [NSThread currentThread]);
//    });
//    dispatch_sync(serialQueue, ^{
//        NSLog(@"4 %@", [NSThread currentThread]);
//    });
    
    
#pragma mark ------------------串行队列异步执行任务------------
    
//    dispatch_queue_t serialQueue1 = dispatch_queue_create("serialQueue1", DISPATCH_QUEUE_SERIAL);
//    
//    dispatch_async(serialQueue1, ^{
//       
//        NSLog(@"1 = %@",[NSThread currentThread]);
//        
//    });
//    
//    dispatch_async(serialQueue1, ^{
//      
//        NSLog(@"2 = %@",[NSThread currentThread]);
//
//    });
//    
//    dispatch_async(serialQueue1, ^{
//        
//        NSLog(@"3 = %@",[NSThread currentThread]);
//
//    });
    
#pragma mark ----------------并行队列同步执行任务-----------------
    
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_sync(concurrentQueue, ^{
//        
//        NSLog(@"1 = %@",[NSThread currentThread]);
//        
//    });
//    
//    dispatch_sync(concurrentQueue, ^{
//        
//        NSLog(@"2 = %@",[NSThread currentThread]);
//        
//    });
//    
//    dispatch_sync(concurrentQueue, ^{
//        
//        NSLog(@"3 = %@",[NSThread currentThread]);
//        
//    });
    
#pragma mark ----------------并行队列异步执行任务-----------------
    
    dispatch_queue_t concurrentQueue1 = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrentQueue1, ^{
       
        NSLog(@"1 = %@",[NSThread currentThread]);
        
    });
    
    
    dispatch_async(concurrentQueue1, ^{
        
        NSLog(@"2 = %@",[NSThread currentThread]);
        
    });
    
    dispatch_async(concurrentQueue1, ^{
        
        NSLog(@"3 = %@",[NSThread currentThread]);
        
    });
    
}




@end
