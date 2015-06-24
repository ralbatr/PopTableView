//
//  ViewController.m
//  PopTableView
//
//  Created by Ralbatr on 15/6/23.
//  Copyright (c) 2015年 ralbatr Yi. All rights reserved.
//

#import "ViewController.h"
#import "YSPopMenuView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    YSPopMenuView *popView = [[YSPopMenuView alloc] initWithButtonFrame:CGRectMake(20, 130, 100, 30) andViewHeight:100.0 andTitle:@"try"];
    popView.datalist = @[@"123",@"234",@"456",@"567"];
    [self.view addSubview:popView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
