//
//  ViewController.m
//  ToViewALargerVersion
//
//  Created by 高彬 on 15/9/8.
//  Copyright (c) 2015年 erweimashengchengqi. All rights reserved.
//

#import "ViewController.h"
#import "checkBigPictureController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //查看放大的图片
    
    self.title  = @"查看放大的图片";
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50,self.view.frame.size.height/2, 120, 30)];
    [button setTitle:@"点击查看大图" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(checkBigPic:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)checkBigPic:(UIButton *) sender {
    checkBigPictureController * checkPic = [[checkBigPictureController alloc]init];
    
    [self.navigationController pushViewController:checkPic animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
