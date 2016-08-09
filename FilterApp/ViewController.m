//
//  ViewController.m
//  FilterApp
//
//  Created by James Rochabrun on 8/8/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>


@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UIButton *pickImage;
@property (strong, nonatomic) IBOutlet UIButton *captureImage;
@property (strong, nonatomic) IBOutlet UIButton *filterImage;

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
- (IBAction)pickImage:(id)sender {
    
    UIImagePickerController *imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:^{
        
    }];
    
}

- (IBAction)captureImage:(id)sender {
    
    UIImagePickerController *imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
}

- (IBAction)filterImage:(id)sender {
    
    CIImage *rawImageData;
    rawImageData =[[CIImage alloc] initWithImage:self.imageView.image];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIDotScreen"];
    [filter setDefaults];
    
    [filter setValue:rawImageData forKey:@"inputImage"];
    
    [filter setValue:[NSNumber numberWithFloat:25.00]
              forKey:@"inputWidth"];
    
    [filter setValue:[NSNumber numberWithFloat:0.00]
              forKey:@"inputAngle"];
    
    [filter setValue:[NSNumber numberWithFloat:0.70]
              forKey:@"inputSharpness"];
    
    CIImage *filteredImageData = [filter valueForKey:@"outputImage"];
    
    UIImage *filteredImage = [UIImage imageWithCIImage:filteredImageData];
    self.imageView.image = filteredImage;
}








@end








