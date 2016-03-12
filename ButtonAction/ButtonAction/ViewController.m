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

/*按钮移动*/
- (IBAction)move:(UIButton *)sender {
    
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
