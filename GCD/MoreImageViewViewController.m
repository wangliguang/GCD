//
//  MoreImageViewViewController.m
//  GCD
//
//  Created by GG on 16/3/1.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "MoreImageViewViewController.h"

#define kUrl @"http://store.storeimages.cdn-apple.com/8748/as-images.apple.com/is/image/AppleInc/aos/published/images/s/38/s38ga/rdgd/s38ga-rdgd-sel-201601?wid=848&hei=848&fmt=jpeg&qlt=80&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=1454777389943"

@interface MoreImageViewViewController ()
{
    int imageIndex;
    UIImage *image;
    
    dispatch_queue_t serialQueue;
}

@end

@implementation MoreImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self controlBtn];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"使用GCD加载多张图片";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    imageIndex = 100;
    
    for (int  row= 0; row<3; row++) {
        for (int list = 0; list<2; list++) {
            
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10+list*200, 10+row*200, 200, 200)];
            
            imageView.tag = imageIndex++;
            
            [self.view addSubview:imageView];
            
        }
    }
    
    serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    
    for (int index = 0; index<6; index++) {
        
        dispatch_async(serialQueue, ^{
           
            
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kUrl]];
            
            NSLog(@"获取数据所在的线程 = %@",[NSThread currentThread]);
            
            [NSThread sleepForTimeInterval:2];
            
            image = [UIImage imageWithData:data];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
               
                UIImageView *imgeView = [self.view viewWithTag:100+index];
                
                NSLog(@"更新UI所在的线程 = %@",[NSThread currentThread]);

                imgeView.image = image;
                
            });
            
        });
        
    }
    

}


- (void)controlBtn{
    
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"暂停",@"开启",]];
    
    segment.frame = CGRectMake(50, 620, 300, 50);
    
    segment.apportionsSegmentWidthsByContent = YES;
    
    [self.view addSubview:segment];
    
    [segment addTarget:self action:@selector(clickSegment:) forControlEvents:UIControlEventValueChanged];
}

- (void)clickSegment:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
            
        case 0:{
            
            dispatch_suspend(serialQueue);
        }break;
            
        case 1:{
            
            dispatch_resume(serialQueue);
            
        }break;
            
    }
    
    
    
}



@end
