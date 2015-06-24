//
//  YSPopMenuView.h
//  PopTableView
//
//  Created by Ralbatr on 15/6/23.
//  Copyright (c) 2015年 ralbatr Yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectCellDelegate <NSObject>

- (void) cellDidSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface YSPopMenuView : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL isCloseAfterClick;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) NSString *directionString;
@property (nonatomic,strong) NSArray *datalist;
// 设置动画的方向
@property (nonatomic,assign) CGFloat width;
// 如果设置宽度，则不在使用按钮的宽度
@property (nonatomic,weak) id<SelectCellDelegate> delegate;

- (id) initWithButtonFrame:(CGRect)frame andViewHeight:(CGFloat)height andTitle:(NSString *)title;

- (void)show;

- (void)hide;

- (void)reloadDate;
// 重新加载数据，刷新界面
- (void)buttonAction;


@end
