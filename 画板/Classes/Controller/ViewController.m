//
//  ViewController.m
//  画板
//
//  Created by 蓝科 on 16/5/7.
//  Copyright © 2016年 符玉达. All rights reserved.
//

#import "ViewController.h"
#import "YDPaintView.h"
#import "UIImage+MSTool.h"
#import "MBProgressHUD+MS.h"
#import "YDHandleImageView.h"


@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,YDHandleImageViewDelegate>



@property (weak, nonatomic) IBOutlet YDPaintView *paintView;


- (IBAction)lineWidthChange:(UISlider *)sender;
- (IBAction)chooesColor:(UIButton *)sender;
- (IBAction)clearScreen;
- (IBAction)undo;
- (IBAction)eraser;
- (IBAction)photo;
- (IBAction)save;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置线宽的方法
- (IBAction)lineWidthChange:(UISlider *)sender {
    //给paintView对象的线宽属性赋值
    self.paintView.lineWidth = sender.value;
}

- (IBAction)chooesColor:(UIButton *)sender {
    
    self.paintView.lineColor =sender.backgroundColor;
}

- (IBAction)clearScreen
{
    [self.paintView clearScreen];
    
}
- (IBAction)undo
{
    [self.paintView undo];
    
}
- (IBAction)eraser
{
    self.paintView.lineColor = [UIColor whiteColor];
    
}
- (IBAction)photo
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    [self presentViewController:imagePicker animated:YES completion:nil];

}

- (IBAction)save
{
    //截屏获取图片
    UIImage *newImgae = [UIImage imageWithCaptureView:self.paintView];
    
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(newImgae, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error) {
        [MBProgressHUD showSuccess:@"保存成功"];
    }else{
        [MBProgressHUD showError:@"保存失败"];
        
    }
    
    
}


#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //获取原始图片
    UIImage *originalImage = info[@"UIImagePickerControllerOriginalImage"];
   
    //初始化一个YDHandleImageView
    YDHandleImageView *handleImageView = [[YDHandleImageView alloc] initWithFrame:self.paintView.frame];
   
    handleImageView.delegate = self;
    handleImageView.image = originalImage;
    
    [self.view addSubview:handleImageView];
    //隐藏相册控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - YDHandleImageViewDelegate
-(void)handleImageView:(YDHandleImageView *)handleImageView didCaptureImage:(UIImage *)image
{
    self.paintView.image = image;
    
}

@end
