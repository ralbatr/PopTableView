//
//  ViewController.m
//  PopTableView
//
//  Created by Ralbatr on 15/6/23.
//  Copyright (c) 2015年 ralbatr Yi. All rights reserved.
//

#import "ViewController.h"
#import "YSPopMenuView.h"

@interface ViewController ()<SelectCellDelegate>
{
    YSPopMenuView *popView;
    YSPopMenuView *popView2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    popView = [[YSPopMenuView alloc] initWithButtonFrame:CGRectMake(20, 130, 100, 30) andViewHeight:100.0 andTitle:@"try"];
    popView.datalist = @[@"123",@"234",@"456",@"567"];
    popView.delegate = self;
    popView.isCloseAfterClick = YES;
    [self.view addSubview:popView];
    
    popView2 = [[YSPopMenuView alloc] initWithButtonFrame:CGRectMake(120, 130, 100, 30) andViewHeight:100.0 andTitle:@"3try"];
    popView2.datalist = @[@"a23",@"234",@"456",@"567"];
    popView2.delegate = self;
    [self.view addSubview:popView2];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(120, 200, 100, 30)];
    [btn addTarget:self action:@selector(butAc) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
}

- (void)butAc {
    [popView hide];
    [popView2 buttonAction];
}

- (void)cellDidSelectedAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath %ld ",indexPath.row);
}

@end
