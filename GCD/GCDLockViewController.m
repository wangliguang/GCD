//
//  ViewController.m
//  GCD_ Train_Ticket
//
//  Created by GG on 16/3/2.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "GCDLockViewController.h"

@interface  GCDLockViewController()
{
    NSLock *lock;
}


@end

@implementation GCDLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"线程锁";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    lock = [NSLock new];
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    
    __block int ticketNum = 10;
    
    for (int index = 0; index<15; index++) {
        
        
        dispatch_async(concurrentQueue, ^{
            
            
#pragma mark *****************不用线程锁，下面的购票的关键过程就可能会被打断，无法确认剩余的票数***********************
            
            //            if (ticketNum>0) {
            //
            //                ticketNum--;
            //
            //                NSLog(@"还剩%d张票",ticketNum);
            //            }

            
#pragma  mark *****************NSLock实现线程锁，能保证票数是按照预知的一张一张减少，对比不用线程所的输出可知*******************
            //
            //            [lock lock];
            //
            //            if (ticketNum>0) {
            //
            //                ticketNum--;
            //
            //                NSLog(@"还剩%d张票",ticketNum);
            //            }
            //
            //            [lock unlock];
            
            
#pragma mark *****************synchronized方式实现线程锁，能保证票数是按照预知的一张一张减少**********
            //保证此时没有其它线程对self里的对象进行修改
            @synchronized(self){
                
                if (ticketNum>0) {
                    
                    ticketNum--;
                    
                    NSLog(@"还剩%d张票",ticketNum);
                }
            }
            
            
            
            
            
            
        });
        
    }
    
}





@end
