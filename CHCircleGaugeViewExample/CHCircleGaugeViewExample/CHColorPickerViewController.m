//
//  CHColorPickerViewController.m
//  CHCircleGaugeViewExample
//
//  Created by Rogelio Gudino on 7/29/14.
//  Copyright (c) 2014 ChaiOne. All rights reserved.
//

#import "CHColorPickerViewController.h"
#import "HRBrightnessSlider.h"
#import "CHColorPickerView.h"
#import "HRColorPickerView.h"
#import "HRColorMapView.h"

@interface CHColorPickerViewController ()

@property (nonatomic, strong) CHColorPickerView *customView;

@end

@implementation CHColorPickerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupUI];
    [self setupTargetActions];
    [self setupConstraints];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.customView = [[CHColorPickerView alloc] init];
    self.customView.translatesAutoresizingMaskIntoConstraints = NO;
    self.customView.colorPickerView.color = self.color;
    self.customView.colorPickerView.brightnessSlider.brightnessLowerLimit = @0.0;
    self.customView.colorPickerView.colorMapView.saturationUpperLimit = @1.0;
    [self.view addSubview:self.customView];
}

- (void)setupTargetActions {
    
    [self.customView.colorPickerView addTarget:self action:@selector(colorChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)setupConstraints {
    
    NSDictionary *viewsDictionary = @{ @"topLayoutGuide": self.topLayoutGuide,
                                       @"customView": self.customView
                                       };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLayoutGuide][customView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[customView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:viewsDictionary]];
}

#pragma mark - Action Methods

- (void)colorChanged:(HRColorPickerView *)sender {
    
    self.color = sender.color;
    
    if (self.colorChangeCallback) {
        self.colorChangeCallback(self.color);
    }
}

@end
