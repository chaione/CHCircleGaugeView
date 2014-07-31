//
//  CHColorPickerViewController.h
//  CHCircleGaugeViewExample
//
//  Created by Rogelio Gudino on 7/29/14.
//  Copyright (c) 2014 ChaiOne. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CHColorPickerViewControllerDidChangeColor)(UIColor *);

@interface CHColorPickerViewController : UIViewController

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, copy) CHColorPickerViewControllerDidChangeColor colorChangeCallback;

@end
