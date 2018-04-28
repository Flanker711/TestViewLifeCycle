//
//  SecoundViewController.m
//  TestViewLifeCycle
//
//  Created by yxf on 2018/4/27.
//  Copyright © 2018年 wj. All rights reserved.
//

#import "SecoundViewController.h"
#import "TestView.h"

@interface SecoundViewController ()

@end

@implementation SecoundViewController{
    TestView * _testView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSStringFromSelector(_cmd));
    self.view.backgroundColor = [UIColor whiteColor];

    _testView = [[TestView alloc] init];
    [_testView setFrame:CGRectMake(100, 100, 100, 100)];
    [_testView setBackgroundColor:[UIColor orangeColor]];
    
    {   //用来测试testView上有多个view时，依次添加，移除时的生命周期
        TestView * testSubView1 = [[TestView alloc] init];
        [testSubView1 setFrame:CGRectMake(0, 0, 10, 10)];
        [_testView addSubview:testSubView1];
        
        TestView * testSubView2 = [[TestView alloc] init];
        [testSubView2 setFrame:CGRectMake(0, 20, 10, 10)];
        [_testView addSubview:testSubView2];
        
        TestView * testSubView3 = [[TestView alloc] init];
        [testSubView3 setFrame:CGRectMake(20, 0, 10, 10)];
        [_testView addSubview:testSubView3];
    }
    
    [self.view addSubview:_testView];

    //添加移除按钮，注意，移除后，因为testView是本类成员变量，并不会立马dealloc，pop后才会dealloc
    UIButton * removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeButton setFrame:CGRectMake(0, 0, 200, 100)];
    [removeButton setBackgroundColor:[UIColor redColor]];
    [removeButton setTitle:@"点此移除视图" forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeButton];
    [removeButton setCenter:self.view.center];
    
    //添加重新设置Frame按钮的方法，
    UIButton * resetFrameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [resetFrameButton setFrame:CGRectMake(0, 0, 200, 100)];
    [resetFrameButton setBackgroundColor:[UIColor redColor]];
    [resetFrameButton setTitle:@"点此重置Frame" forState:UIControlStateNormal];
    [resetFrameButton addTarget:self action:@selector(resetFrame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetFrameButton];
    [resetFrameButton setCenter:CGPointMake(200, 500)];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)removeView{
    UIView * subView = (UIView *)[[self.view subviews] firstObject];
    [subView removeFromSuperview];
}

- (void)resetFrame{
    UIView * subView = (UIView *)[[self.view subviews] firstObject];
    [subView setFrame:CGRectMake(200, 100, 100, 100)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
