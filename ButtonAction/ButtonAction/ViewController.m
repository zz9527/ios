//
//  ViewController.m
//  ButtonAction
//
//  Created by zz on 16/3/12.
//  Copyright © 2016年 zz. All rights reserved.
//

#import "ViewController.h"

/*宏定义 移动偏移量*/
#define kMovingDelta 20.f;

/*枚举上下左右*/
typedef enum{
    kMovingDirTop=10,
    kMovingDirBottom,
    kMovingDirLeft,
    kMovingDirRight

} kMovingDir;


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@end

@implementation ViewController

-(IBAction)zoom:(UIButton*)sender{
    
    /*bounds缩放*/
    CGRect bounds= self.iconButton.bounds;
    if (sender.tag) {
        NSLog(@"放大");
        bounds.size.width+=20;
        bounds.size.height+=20;
    }
    else
    {
        NSLog(@"缩小");
        bounds.size.width-=20;
        bounds.size.height-=20;
    }
    
    /*加入首尾动画*/
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    self.iconButton.bounds=bounds;
    
    [UIView commitAnimations];

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
    
    /*center实现按钮移动*/
    CGPoint center=self.iconButton.center;
    switch (sender.tag) {
        case kMovingDirTop://向上移动
            center.y-=kMovingDelta;
            break;
        case kMovingDirBottom://向下移动
            center.y+=kMovingDelta;
            break;
        case kMovingDirLeft://向左移动
            center.x-=kMovingDelta;
            break;
        case kMovingDirRight://向右移动
            center.x+=kMovingDelta;
            break;
    }
    
    /*首尾动画*/
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    self.iconButton.center=center;
    [UIView commitAnimations];
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
