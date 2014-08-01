//
//  CHColorPickerViewController.m
//  CHCircleGaugeViewExample
//
//  Copyright (c) 2014 ChaiOne <http://www.chaione.com/>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
