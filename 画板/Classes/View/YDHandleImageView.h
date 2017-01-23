//
//  YDHandleImageView.h
//  画板
//
//  Created by 蓝科 on 16/5/9.
//  Copyright © 2016年 符玉达. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YDHandleImageView;
@protocol YDHandleImageViewDelegate <NSObject>

@optional;

-(void)handleImageView:(YDHandleImageView *)handleImageView didCaptureImage:(UIImage *)image;

@end

@interface YDHandleImageView : UIView

@property (nonatomic, strong)UIImage *image;

@property (nonatomic, weak) id delegate;

@end
