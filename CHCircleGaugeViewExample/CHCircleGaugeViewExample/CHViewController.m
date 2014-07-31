//
//  CHViewController.m
//  CHCircleGaugeViewExample
//
//  Created by Matthew Morey on 7/25/14.
//  Copyright (c) 2014 ChaiOne. All rights reserved.
//

#import "CHViewController.h"
#import "CHColorPickerViewController.h"
#import "CHCircleGaugeView.h"
#import "CHView.h"

@interface CHViewController ()

@property (nonatomic, strong) CHView *customView;

@end

@implementation CHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CHCircleGaugeView";
    [self setupCustomView];
}

- (void)setupCustomView {
    
    self.customView = [[CHView alloc] init];
    self.customView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.customView];
    
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
    
    [self setupSliders];
    [self updateColors];
    [self setupTargetActions];
}

- (void)setupSliders {
    
    self.customView.trackWidthSlider.maximumValue = 100.0;
    self.customView.gaugeWidthSlider.maximumValue = 100.0;
    self.customView.valueSlider.value = self.customView.gauge.value;
    self.customView.trackWidthSlider.value = self.customView.gauge.trackWidth;
    self.customView.gaugeWidthSlider.value = self.customView.gauge.gaugeWidth;
    self.customView.valueSliderLabel.text = [self formattedStringForFloatValue:(self.customView.gauge.value * 100)];
    self.customView.trackWidthSliderLabel.text = [self formattedStringForFloatValue:self.customView.gauge.trackWidth];
    self.customView.gaugeWidthSliderLabel.text = [self formattedStringForFloatValue:self.customView.gauge.gaugeWidth];
    self.customView.valueSlider.continuous = NO;
    self.customView.trackWidthSlider.continuous = NO;
    self.customView.gaugeWidthSlider.continuous = NO;
}

- (void)updateColors {
    
    self.customView.valueColorIndicatorView.backgroundColor = self.customView.gauge.textColor;
    self.customView.trackColorIndicatorView.backgroundColor = self.customView.gauge.trackTintColor;
    self.customView.gaugeColorIndicatorView.backgroundColor = self.customView.gauge.gaugeTintColor;
}

- (void)setupTargetActions {
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeState:)];
    [self.customView.gauge addGestureRecognizer:tapGestureRecognizer];
    
    [self.customView.gaugeStyleSwitch addTarget:self action:@selector(changeGuageStyle:) forControlEvents:UIControlEventValueChanged];
    [self.customView.valueSlider addTarget:self action:@selector(valueSliderChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.customView.trackWidthSlider addTarget:self action:@selector(trackWidthSliderChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.customView.gaugeWidthSlider addTarget:self action:@selector(gaugeWidthSliderChangedValue:) forControlEvents:UIControlEventValueChanged];
    
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeValueColor:)];
    [self.customView.valueColorIndicatorView addGestureRecognizer:tapGestureRecognizer];
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTrackColor:)];
    [self.customView.trackColorIndicatorView addGestureRecognizer:tapGestureRecognizer];
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeGaugeColor:)];
    [self.customView.gaugeColorIndicatorView addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark - Action Methods

- (void)changeState:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    if (self.customView.gauge.state != CHCircleGaugeViewStateNA) {
        self.customView.gauge.state = CHCircleGaugeViewStateNA;
    } else {
        [self.customView.gauge setValue:self.customView.gauge.value animated:YES];
    }
}

- (void)changeGuageStyle:(UISwitch *)sender {
    
    if (sender.on == YES) {
        self.customView.gauge.gaugeStyle = CHCircleGaugeStyleOutside;
    } else {
        self.customView.gauge.gaugeStyle = CHCircleGaugeStyleInside;
    }
}

- (void)changeValueColor:(UIButton *)sender {
    
    __weak typeof(self) welf = self;
    UIColor *color = self.customView.gauge.textColor;
    CHColorPickerViewControllerDidChangeColor callback = ^(UIColor *color) {
        welf.customView.gauge.textColor = color;
        [welf updateColors];
    };
    [self pushColorPickerViewControllerWithColor:color andCallback:callback];
}

- (void)changeTrackColor:(UIButton *)sender {
    
    __weak typeof(self) welf = self;
    UIColor *color = self.customView.gauge.trackTintColor;
    CHColorPickerViewControllerDidChangeColor callback = ^(UIColor *color) {
        welf.customView.gauge.trackTintColor = color;
        [welf updateColors];
    };
    [self pushColorPickerViewControllerWithColor:color andCallback:callback];
}

- (void)changeGaugeColor:(UIButton *)sender {
    
    __weak typeof(self) welf = self;
    UIColor *color = self.customView.gauge.gaugeTintColor;
    CHColorPickerViewControllerDidChangeColor callback = ^(UIColor *color) {
        welf.customView.gauge.gaugeTintColor = color;
        [welf updateColors];
    };
    [self pushColorPickerViewControllerWithColor:color andCallback:callback];
}

- (void)pushColorPickerViewControllerWithColor:(UIColor *)color andCallback:(CHColorPickerViewControllerDidChangeColor)callback {
    
    CHColorPickerViewController *colorPickerViewController = [[CHColorPickerViewController alloc] init];
    colorPickerViewController.color = color;
    colorPickerViewController.colorChangeCallback = callback;
    [self.navigationController pushViewController:colorPickerViewController animated:YES];
}

- (void)valueSliderChangedValue:(UISlider *)sender {
    
    [self.customView.gauge setValue:sender.value animated:YES];
    self.customView.valueSliderLabel.text = [self formattedStringForFloatValue:(sender.value * 100)];
}

- (void)trackWidthSliderChangedValue:(UISlider *)sender {
    
    self.customView.gauge.trackWidth = sender.value;
    self.customView.trackWidthSliderLabel.text = [self formattedStringForFloatValue:sender.value];
}

- (void)gaugeWidthSliderChangedValue:(UISlider *)sender {
    
    self.customView.gauge.gaugeWidth = sender.value;
    self.customView.gaugeWidthSliderLabel.text = [self formattedStringForFloatValue:sender.value];
}

- (NSString *)formattedStringForFloatValue:(CGFloat)value {
    
    return [NSString stringWithFormat:@"%.0f", value];
}

@end
