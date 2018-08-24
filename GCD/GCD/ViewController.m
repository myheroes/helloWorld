//
//  ViewController.m
//  GCD
//
//  Created by 潘文龙 on 2018/8/14.
//  Copyright © 2018年 PorklingTV. All rights reserved.
//

#import "ViewController.h"
#import "PTVDisplayView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    //显示内容
    PTVDisplayView * displayView = [[PTVDisplayView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    displayView.center = self.view.center;
    displayView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:displayView];
}

/**
 * GCD的栅栏函数
 */
-(void)GCDBarrier
{
    dispatch_queue_t queue = dispatch_queue_create("gcd", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"-----");
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"1%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"2%@", [NSThread currentThread]);
    });
    NSLog(@"----11111");
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:.5];
    });
    NSLog(@"----2222222");
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"3%@", [NSThread currentThread]);
    });
    NSLog(@"----3333333");
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"4%@", [NSThread currentThread]);
    });
    NSLog(@"----4444444");
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self GCDBarrier];
////    [self dispathApply];
//    NSLog(@"------");
//    //延迟执行，计时比较精确
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"------");
//    });
//    [self run1];
//    [self serialQueue];
    [self fileHandle];
}
//线程间通信
-(void)downLoadImage
{
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img.lanrentuku.com/img/allimg/1310/13822295641903.jpg"]];
    UIImage * image = [UIImage imageWithData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}

#pragma mark - 常驻线程
-(void)run
{
    @autoreleasepool{
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        NSLog(@"---- run --- %@----",[NSThread currentThread]);
        [[NSRunLoop currentRunLoop] run];
        //不会执行
        NSLog(@"不会执行");
    }
}
#pragma mark - 常驻线程2
-(void)run1
{
    @autoreleasepool{
        while (1) {
            NSLog(@"--run1 --- %@ ---",[NSThread currentThread]);
            [[NSRunLoop currentRunLoop] run];
        }
    }

}





-(void)dispathApply
{
    //执行某个代码片10次
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@" %zd %@",index,[NSThread currentThread]);
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)serialQueue
{
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1begin");
    dispatch_async(serialQueue, ^{
        NSLog(@"block1");
    });
    NSLog(@"1end");
    NSLog(@"2begin");
    dispatch_async(serialQueue, ^{
        NSLog(@"block2");
    });
    NSLog(@"2end");
    NSLog(@"3begin");
    dispatch_async(serialQueue, ^{
        NSLog(@"block3");
    });
    NSLog(@"3end");
}
-(void)create
{

}

-(void)fileHandle
{
        //创建一个文件
    NSString * str = @"this is a test";
    NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSFileManager * fileManger = [NSFileManager defaultManager];
    NSString * path = NSHomeDirectory();
    NSLog(@"当前目录是%@",path);
    path = [path stringByAppendingPathComponent:@"1.txt"];
    if ([fileManger createFileAtPath:path contents:data attributes:nil]) {
        NSLog(@"文件创建成功");
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:@"1.txt"];
        if (fileHandle) {
            //读取文件的内容
            NSMutableData * allData = [NSMutableData data];
            NSData * contents ;
            while (1) {
                contents = [fileHandle readDataOfLength:4];
                if (!contents || contents.length <= 0) {
                    break;
                }
                [allData appendData:contents];
            }
            NSString * strContent = [[NSString alloc] initWithData:allData encoding:NSUTF8StringEncoding];
            NSLog(@"%@",strContent);

        }
        //关闭文件
        [fileHandle closeFile];
    }else{
        NSLog(@"创建文件失败");
    }
    NSLog(@"--=======%@",[fileManger currentDirectoryPath]);
    //通过fileHandle写文件的例子
    path = NSHomeDirectory();
    path = [path stringByAppendingPathComponent:@"2.txt"];
    if ([fileManger createFileAtPath:path contents:nil attributes:nil]) {
        NSLog(@"创建文件陈宫");
        NSFileHandle * fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
        if (fileHandle) {
            NSData * data = [@"hello world" dataUsingEncoding:NSUTF8StringEncoding];
            [fileHandle writeData:data];
            NSLog(@"++++++");
        }
        [fileHandle closeFile];
        NSLog(@"%@",[fileManger currentDirectoryPath]);
    }
    
    
    
}




@end
