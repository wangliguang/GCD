//
//  OneImageViewController.m
//  GCD
//
//  Created by GG on 16/3/1.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "OneImageViewController.h"

#define kUrl @"http://store.storeimages.cdn-apple.com/8748/as-images.apple.com/is/image/AppleInc/aos/published/images/s/38/s38ga/rdgd/s38ga-rdgd-sel-201601?wid=848&hei=848&fmt=jpeg&qlt=80&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=1454777389943"

@interface OneImageViewController ()
{
    UIImageView *imageView;
    
    UIImage *image;
}
@end

@implementation OneImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"使用GCD加载一张图片";
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    [self.view addSubview:imageView];
    
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(concurrentQueue, ^{
    
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kUrl]];
        
        NSLog(@"获取数据所在的线程 = %@",[NSThread currentThread]);
        
        image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        NSLog(@"更新UI所在的线程 = %@",[NSThread currentThread]);
        imageView.image = image;
            
            
        });
        
        
    });
    

}


@end
