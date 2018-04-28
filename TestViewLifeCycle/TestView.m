//
//  TestView.m
//  TestViewLifeCycle
//
//  Created by yxf on 2018/4/27.
//  Copyright © 2018年 wj. All rights reserved.
//

#import "TestView.h"

@implementation TestView{
    NSInteger _count;
}

- (instancetype)init{
    if (self = [super init]) {
        _count = 0;
        NSLog(@"%@", [NSString stringWithFormat:@"%@ ==> %ld",NSStringFromSelector(_cmd),_count]);
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),_count);
    
}

- (void)didAddSubview:(UIView *)subview{
    [super didAddSubview:subview];
    _count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),_count);
}
- (void)willRemoveSubview:(UIView *)subview{
    [super willRemoveSubview:subview]; _count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),_count);

}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    _count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),_count);
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    _count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),_count);
}

- (void)didMoveToSuperview{ [super didMoveToSuperview];
    _count++;
    NSLog(@"%@ ==> %ld，%@",NSStringFromSelector(_cmd),_count,self.superview);
}


- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    _count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),_count);
}

- (void)didMoveToWindow{
    [super didMoveToWindow];
    _count++;
    NSLog(@"%@ ==> %ld,%@",NSStringFromSelector(_cmd),_count,self.window);
}

- (void)removeFromSuperview{
    [super removeFromSuperview];
    _count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),_count);
}

- (void)dealloc{
    _count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),_count);
}

@end
