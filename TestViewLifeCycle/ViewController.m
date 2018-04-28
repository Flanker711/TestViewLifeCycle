//
//  ViewController.m
//  TestViewLifeCycle
//
//  Created by yxf on 2018/4/27.
//  Copyright © 2018年 wj. All rights reserved.
//

#import "ViewController.h"
#import "SecoundViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushButton setFrame:CGRectMake(100, 100, 300, 100)];
    [pushButton setBackgroundColor:[UIColor redColor]];
    [pushButton setTitle:@"点此PUSH" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushSecoundViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    [pushButton setCenter:self.view.center];
}

- (void )pushSecoundViewController{
    
    SecoundViewController * vc = [[SecoundViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
