//
//  ViewController.m
//  ButtonAction
//
//  Created by zz on 16/3/12.
//  Copyright © 2016年 zz. All rights reserved.
//

#import "ViewController.h"

/*宏定义 移动偏移量*/
#define kMovingDelta 20.0f;

/*枚举上下左右*/
typedef enum{
    kMovingDirTop=10,
    kMovingDirBottom,
    kMovingDirLeft,
    kMovingDirRight
    
} kMovingDir;



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property(nonatomic,assign) CGFloat delta;
@end

@implementation ViewController

/*悬转*/
- (IBAction)rate:(UIButton *)sender {
    
    CGFloat angle=(sender.tag)?-M_PI_4:M_PI_4;
    
    self.iconButton.transform=CGAffineTransformRotate(self.iconButton.transform, angle);
}

/*缩放*/
-(IBAction)zoom:(UIButton*)sender{
    
    CGFloat scale=(sender.tag)?1.2:0.8;
    
    self.iconButton.transform=CGAffineTransformScale(self.iconButton.transform,scale, scale);
    
    /*bounds缩放*/
    //    CGRect bounds= self.iconButton.bounds;
    //    if (sender.tag) {
    //        NSLog(@"放大");
    //        bounds.size.width+=20;
    //        bounds.size.height+=20;
    //    }
    //    else
    //    {
    //        NSLog(@"缩小");
    //        bounds.size.width-=20;
    //        bounds.size.height-=20;
    //    }
    
    /*加入首尾动画*/
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDuration:1];
    //
    //    self.iconButton.bounds=bounds;
    //
    //    [UIView commitAnimations];
    
    /*frame缩放*/
    /*
     CGRect frame=self.iconButton.frame;
     if (sender.tag) {
     NSLog(@"放大");
     frame.size.width+=20;
     frame.size.height+=20;
     }
     else
     {
     NSLog(@"缩小");
     frame.size.width-=20;
     frame.size.height-=20;
     }
     
     self.iconButton.frame=frame;
     */
    
}


/*按钮移动*/
- (IBAction)move:(UIButton *)sender {
    
    CGFloat dx=0,dy=0;
    self.delta=kMovingDelta;
    
    if (sender.tag==kMovingDirTop||sender.tag==kMovingDirBottom) {
        dy=(sender.tag==kMovingDirTop)?-self.delta: self.delta;
    }
    
    if (sender.tag==kMovingDirLeft||sender.tag==kMovingDirRight) {
        dx=(sender.tag==kMovingDirLeft)?-self.delta : self.delta;
    }
    self.iconButton.transform=CGAffineTransformTranslate(self.iconButton.transform, dx , dy);
    
    
    /*center实现按钮移动*/
    //    CGPoint center=self.iconButton.center;
    //    switch (sender.tag) {
    //        case kMovingDirTop://向上移动
    //            center.y-=kMovingDelta;
    //            break;
    //        case kMovingDirBottom://向下移动
    //            center.y+=kMovingDelta;
    //            break;
    //        case kMovingDirLeft://向左移动
    //            center.x-=kMovingDelta;
    //            break;
    //        case kMovingDirRight://向右移动
    //            center.x+=kMovingDelta;
    //            break;
    //    }
    
    /*首尾动画*/
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDuration:1];
    //
    //    self.iconButton.center=center;
    //    [UIView commitAnimations];
    /*
     
     CGRect frame=self.iconButton.frame;
     switch (sender.tag) {
     case kMovingDirTop://向上移动
     frame.origin.y-=kMovingDelta;
     break;
     case kMovingDirBottom://向下移动
     frame.origin.y+=kMovingDelta;
     break;
     case kMovingDirLeft://向左移动
     frame.origin.x-=kMovingDelta;
     break;
     case kMovingDirRight://向右移动
     frame.origin.x+=kMovingDelta;
     break;
     }
     self.iconButton.frame=frame;
     
     */
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(110, 100, 100, 100)];
    //设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:@"btn_01"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateHighlighted];
    
    //设置按钮文本
    [button setTitle:@"点我啊" forState:UIControlStateNormal];
    [button setTitle:@"摸我干嘛" forState:UIControlStateHighlighted];
    
    //设置文本颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    //设置按钮文本对齐方式
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    
    self.iconButton=button;
    [self.view addSubview:button];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
