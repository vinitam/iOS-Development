//
//  ViewController.h
//  CameraDemo
//
//  Created by Vinita Miranda on 2/23/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;
@end

