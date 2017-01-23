//
//  YDPaintView.h
//  画板
//
//  Created by 蓝科 on 16/5/7.
//  Copyright © 2016年 符玉达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDPaintView : UIView

@property (nonatomic, assign)CGFloat lineWidth;

@property (nonatomic, strong)UIColor *lineColor;

@property (nonatomic, strong)UIImage *image;
//清屏
- (void)clearScreen;
//撤销
- (void)undo;

@end
