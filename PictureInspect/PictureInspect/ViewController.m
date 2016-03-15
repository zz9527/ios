//
//  ViewController.m
//  PictureInspect
//
//  Created by zz on 16/3/15.
//  Copyright © 2016年 zz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong) UILabel *noLabel;
@property(nonatomic,strong) UIImageView* photoImage;
@property(nonatomic,strong) UIButton* leftButton;
@property(nonatomic,strong) UIButton* rightButton;
@property(nonatomic,strong) UILabel* descLabel;
@property(nonatomic,assign) NSInteger idx;
@property(nonatomic,strong) NSArray* imageList;

@end

@implementation ViewController

//懒加载 descLabel
-(UILabel*)descLabel{
    if (_descLabel==nil) {
        _descLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.photoImage.frame)+20,
                                                             self.view.bounds.size.width, 40)];
        
        _descLabel.text=[NSString stringWithFormat:@"Hello World"];
        [_descLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self.view addSubview:_descLabel];
    }
    return _descLabel;
}

//懒加载 rightbutton
-(UIButton*)rightButton{

    if (_rightButton==nil) {
        
        _rightButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _rightButton.center=CGPointMake(self.view.bounds.size.width-self.leftButton.center.x, self.photoImage.center.y
                                        );
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"]  forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
        
        [_rightButton addTarget:nil action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.tag=1;
        [self.view addSubview:_rightButton];
    }
    return _rightButton;

}


//懒加载 leftbutton
-(UIButton*)leftButton
{
    if (_leftButton==nil) {
        
        _leftButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        
        CGFloat centerX=(self.photoImage.center.x-self.photoImage.frame.origin.x)*0.5;
        CGFloat centerY=self.photoImage.center.y;
        _leftButton.center=CGPointMake(centerX, centerY);
        _leftButton.tag=-1;
        
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
        
        [_leftButton addTarget:nil action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_leftButton];
    }
    return _leftButton;
}

//懒加载
-(UIImageView*) photoImage{
   
    if (_photoImage==nil) {
        
        CGFloat imgW=200;
        CGFloat imgH=200;
        CGFloat imgX=(self.view.bounds.size.width-imgW)*0.5;
        CGFloat imgY=CGRectGetMaxY(self.noLabel.frame)+20;
        _photoImage=[[UIImageView alloc] initWithFrame:CGRectMake(imgX, imgY, imgW, imgH)];
        [_photoImage setImage:[UIImage imageNamed:@"biaoqingdi"]];
        [self.view addSubview:_photoImage];
        
    }
    return _photoImage;

}

//懒加载 noLabel
-(UILabel*)noLabel{

    if (_noLabel==nil) {
        _noLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
        _noLabel.text=[NSString stringWithFormat:@"1/5"];
        _noLabel.textAlignment=NSTextAlignmentCenter;
        
        [self.view addSubview:_noLabel];
    }
    return _noLabel;


}


/*懒加载 imageList*/
-(NSArray*)imageList{

    if (_imageList==nil) {
        NSString* path=[[NSBundle mainBundle] pathForResource:@"ImageList" ofType:@"plist"];
        _imageList=[NSArray arrayWithContentsOfFile:path];
    }
    return _imageList;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showPhotoInfo];
    
    
}

//按钮点击处理action
-(void) clickButton:(UIButton*)button{

    self.idx+=button.tag;
    [self showPhotoInfo];

}

//显示图片
-(void)showPhotoInfo{

    NSLog(@"%ld",self.idx);
    self.leftButton.enabled=(self.idx!=0);
    self.rightButton.enabled=(self.idx!=4);
    
    self.noLabel.text=[NSString stringWithFormat:@"%ld/%d",self.idx+1,5];
    self.photoImage.image=[UIImage imageNamed:self.imageList[self.idx][@"name"]];
    self.descLabel.text=self.imageList[self.idx][@"desc"];
    
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
