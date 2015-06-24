//
//  YSPopMenuView.m
//  PopTableView
//
//  Created by Ralbatr on 15/6/23.
//  Copyright (c) 2015年 ralbatr Yi. All rights reserved.
//

#import "YSPopMenuView.h"

@interface YSPopMenuView()
{
    CGRect _viewFrame;
}
@end

@implementation YSPopMenuView

- (id) initWithButtonFrame:(CGRect)frame andViewHeight:(CGFloat)height andTitle:(NSString *)title {
    
    self = [super init] ;
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, (self.width>0)?self.width:frame.size.width, height);
        
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, frame.origin.y-2*frame.size.height, frame.size.width, frame.size.height)];
        self.button.backgroundColor = [UIColor grayColor];
        [self.button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.button setTitle:title forState:UIControlStateNormal];
        [self addSubview:self.button];
        
        self.tableView =  [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
//        self.tableView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height-height);
        _viewFrame = CGRectMake(0, 0, frame.size.width, height-self.button.frame.size.height);
        [self addSubview:self.tableView];
        
        self.tableView.hidden = YES;
    }
    
    return self;
}

- (void)buttonAction {
    if (self.tableView.isHidden) {
        self.tableView.frame = CGRectMake(_viewFrame.origin.x, _viewFrame.origin.y+_viewFrame.size.height, _viewFrame.size.width, 1);
    }
    [UIView animateWithDuration:0.9 animations:^{
        if (self.tableView.isHidden) {
            self.tableView.frame = _viewFrame;
        }
    }];
    [UIView animateWithDuration:0.9 animations:^{
        if (self.tableView.isHidden) {
        }else {
            self.tableView.frame = CGRectMake(_viewFrame.origin.x, _viewFrame.origin.y+_viewFrame.size.height, _viewFrame.size.width, 1);
        }
    } completion:^(BOOL finished) {
        self.tableView.hidden = self.tableView.isHidden?NO:YES;
    }];
    
}

- (void)setWidth:(CGFloat)width
{
    if (width != _width) {
        _width = width;
        CGRect frame = self.frame;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, (self.width>0)?self.width:frame.size.width, frame.size.height);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datalist count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.datalist[indexPath.row];
    
    UIView * v = [[UIView alloc] init];
    v.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = v;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(cellDidSelectedAtIndexPath:)]) {
        [self.delegate cellDidSelectedAtIndexPath:indexPath];
    }
    if (self.isCloseAfterClick) {
        //
    }
}

- (void)show {
    [UIView animateWithDuration:0.5 animations:^{
        [self.tableView setHidden:NO];
    }];
}

- (void)hide {
    [UIView animateWithDuration:0.5 animations:^{
        [self.tableView setHidden:YES];
    }];
}

- (void)reloadDate {
    [self.tableView reloadData];
}

@end
