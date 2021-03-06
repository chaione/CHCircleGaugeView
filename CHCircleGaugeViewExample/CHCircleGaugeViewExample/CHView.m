//
//  CHView.m
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

#import "CHView.h"
#import "CHCircleGaugeView.h"

static CGFloat const CHLabelFontSize = 11.0;
static CGFloat const CHSliderValueLabelFontSize = 12.0;
static CGFloat const CHLabelWidth = 50.0;

@interface CHView ()

@property (nonatomic, strong) CHCircleGaugeView *gauge;

@property (nonatomic, strong) UILabel *gaugeStyleLabel;
@property (nonatomic, strong) UISwitch *gaugeStyleSwitch;

@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UILabel *trackWidthLabel;
@property (nonatomic, strong) UILabel *gaugeWidthLabel;

@property (nonatomic, strong) UILabel *valueSliderLabel;
@property (nonatomic, strong) UILabel *trackWidthSliderLabel;
@property (nonatomic, strong) UILabel *gaugeWidthSliderLabel;

@property (nonatomic, strong) UISlider *valueSlider;
@property (nonatomic, strong) UISlider *trackWidthSlider;
@property (nonatomic, strong) UISlider *gaugeWidthSlider;

@property (nonatomic, strong) UIView *valueColorIndicatorView;
@property (nonatomic, strong) UIView *trackColorIndicatorView;
@property (nonatomic, strong) UIView *gaugeColorIndicatorView;

@end

@implementation CHView

- (id)init {
    
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initSetup];
    }
    
    return self;
}

- (void)initSetup {
    
    [self setupUI];
    [self setupConstraints];
}

- (void)setupUI {
    
    [self addSubview:self.gauge];
    [self addSubview:self.gaugeStyleLabel];
    [self addSubview:self.gaugeStyleSwitch];
    [self addSubview:self.valueLabel];
    [self addSubview:self.valueSlider];
    [self addSubview:self.trackWidthLabel];
    [self addSubview:self.valueSliderLabel];
    [self addSubview:self.trackWidthSliderLabel];
    [self addSubview:self.gaugeWidthSliderLabel];
    [self addSubview:self.trackWidthSlider];
    [self addSubview:self.gaugeWidthLabel];
    [self addSubview:self.gaugeWidthSlider];
    [self addSubview:self.valueColorIndicatorView];
    [self addSubview:self.trackColorIndicatorView];
    [self addSubview:self.gaugeColorIndicatorView];
    
    self.gaugeStyleLabel.text = @"Gauge Outside:";
    self.valueLabel.text = @"Value:";
    self.trackWidthLabel.text = @"Track Width:";
    self.gaugeWidthLabel.text = @"Gauge Width:";
}

- (void)setupConstraints {
    
    [self setupGaugeConstraints];
    [self setupGaugeStyleConstraints];
    [self setupColorIndicatorsConstraints];
    [self setupSliderLabelsConstraints];
    [self setupValueSliderConstraints];
    [self setupTrackWidthSliderConstraints];
    [self setupGaugeWidthSliderConstraints];
    [self setupLabelsConstraints];
}

- (void)setupGaugeConstraints {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gauge
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.25
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gauge
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gauge
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gauge
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gauge
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:68.0]];
}

- (void)setupGaugeStyleConstraints {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeStyleSwitch
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeStyleSwitch
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.valueSlider
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:-16]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeStyleLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeStyleSwitch
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:-8]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeStyleLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeStyleSwitch
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
}

- (void)setupColorIndicatorsConstraints {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueColorIndicatorView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.valueSlider
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackColorIndicatorView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.trackWidthSlider
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeColorIndicatorView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeWidthSlider
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:10]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueColorIndicatorView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.valueSlider
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackColorIndicatorView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.trackWidthSlider
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeColorIndicatorView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeWidthSlider
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueColorIndicatorView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:27]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackColorIndicatorView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:27]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeColorIndicatorView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:27]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueColorIndicatorView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.valueColorIndicatorView
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackColorIndicatorView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.trackColorIndicatorView
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeColorIndicatorView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeColorIndicatorView
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:0]];
}

- (void)setupSliderLabelsConstraints {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueSliderLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.valueSlider
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackWidthSliderLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.trackWidthSlider
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeWidthSliderLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeWidthSlider
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueSliderLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.valueSlider
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackWidthSliderLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.trackWidthSlider
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeWidthSliderLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeWidthSlider
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
}

- (void)setupValueSliderConstraints {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueSlider
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueSlider
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.45
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueSlider
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.trackWidthSlider
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:-20]];
}

- (void)setupTrackWidthSliderConstraints {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackWidthSlider
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackWidthSlider
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.45
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackWidthSlider
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeWidthSlider
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:-20]];
}

- (void)setupGaugeWidthSliderConstraints {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeWidthSlider
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeWidthSlider
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.45
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeWidthSlider
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:-20]];
}

- (void)setupLabelsConstraints {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.valueSliderLabel
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:-8]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackWidthLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.trackWidthSliderLabel
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:-8]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeWidthLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeWidthSliderLabel
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:-8]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.valueSlider
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackWidthLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.trackWidthSlider
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeWidthLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.gaugeWidthSlider
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.valueLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:CHLabelWidth]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.trackWidthLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:CHLabelWidth]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.gaugeWidthLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:CHLabelWidth]];
}

- (CHCircleGaugeView *)gauge {
    
    if (_gauge == nil) {
        
        _gauge = [[CHCircleGaugeView alloc] init];
        [_gauge setTranslatesAutoresizingMaskIntoConstraints:NO];
        _gauge.trackTintColor = [UIColor colorWithRed:0.761 green:0.035 blue:0.078 alpha:1.0];
        _gauge.trackWidth = 10;
        _gauge.gaugeTintColor = [UIColor blackColor];
        _gauge.textColor = [UIColor blackColor];
        _gauge.font = [UIFont systemFontOfSize:38];
        _gauge.value = 0.42;
    }
    
    return _gauge;
}

- (UILabel *)gaugeStyleLabel {
    
    if (_gaugeStyleLabel == nil) {
        _gaugeStyleLabel = [[UILabel alloc] init];
        _gaugeStyleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _gaugeStyleLabel.font = [UIFont systemFontOfSize:CHLabelFontSize];
    }
    
    return _gaugeStyleLabel;
}

- (UISwitch *)gaugeStyleSwitch {
    
    if (_gaugeStyleSwitch == nil) {
        _gaugeStyleSwitch = [[UISwitch alloc] init];
        _gaugeStyleSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _gaugeStyleSwitch;
}

- (UILabel *)valueLabel {
    
    if (_valueLabel == nil) {
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _valueLabel.font = [UIFont systemFontOfSize:CHLabelFontSize];
        _valueLabel.textAlignment = NSTextAlignmentRight;
        _valueLabel.numberOfLines = 2;
    }
    
    return _valueLabel;
}

- (UILabel *)trackWidthLabel {
    
    if (_trackWidthLabel == nil) {
        _trackWidthLabel = [[UILabel alloc] init];
        _trackWidthLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _trackWidthLabel.font = [UIFont systemFontOfSize:CHLabelFontSize];
        _trackWidthLabel.textAlignment = NSTextAlignmentRight;
        _trackWidthLabel.numberOfLines = 2;
    }
    
    return _trackWidthLabel;
}

- (UILabel *)gaugeWidthLabel {
    
    if (_gaugeWidthLabel == nil) {
        _gaugeWidthLabel = [[UILabel alloc] init];
        _gaugeWidthLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _gaugeWidthLabel.font = [UIFont systemFontOfSize:CHLabelFontSize];
        _gaugeWidthLabel.textAlignment = NSTextAlignmentRight;
        _gaugeWidthLabel.numberOfLines = 2;
    }
    
    return _gaugeWidthLabel;
}

- (UILabel *)valueSliderLabel {
    
    if (_valueSliderLabel == nil) {
        _valueSliderLabel = [[UILabel alloc] init];
        _valueSliderLabel.font = [UIFont boldSystemFontOfSize:CHSliderValueLabelFontSize];
        _valueSliderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _valueSliderLabel;
}

- (UILabel *)trackWidthSliderLabel {
    
    if (_trackWidthSliderLabel == nil) {
        _trackWidthSliderLabel = [[UILabel alloc] init];
        _trackWidthSliderLabel.font = [UIFont boldSystemFontOfSize:CHSliderValueLabelFontSize];
        _trackWidthSliderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _trackWidthSliderLabel;
}

- (UILabel *)gaugeWidthSliderLabel {
    
    if (_gaugeWidthSliderLabel == nil) {
        _gaugeWidthSliderLabel = [[UILabel alloc] init];
        _gaugeWidthSliderLabel.font = [UIFont boldSystemFontOfSize:CHSliderValueLabelFontSize];
        _gaugeWidthSliderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _gaugeWidthSliderLabel;
}

- (UISlider *)valueSlider {
    
    if (_valueSlider == nil) {
        _valueSlider = [[UISlider alloc] init];
        _valueSlider.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _valueSlider;
}

- (UISlider *)trackWidthSlider {
    
    if (_trackWidthSlider == nil) {
        _trackWidthSlider = [[UISlider alloc] init];
        _trackWidthSlider.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _trackWidthSlider;
}

- (UISlider *)gaugeWidthSlider {
    
    if (_gaugeWidthSlider == nil) {
        _gaugeWidthSlider = [[UISlider alloc] init];
        _gaugeWidthSlider.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _gaugeWidthSlider;
}

- (UIView *)valueColorIndicatorView {
    
    if (_valueColorIndicatorView == nil) {
        _valueColorIndicatorView = [[UIView alloc] init];
        _valueColorIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        _valueColorIndicatorView.layer.borderWidth = 1.0;
        _valueColorIndicatorView.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return _valueColorIndicatorView;
}

- (UIView *)trackColorIndicatorView {
    
    if (_trackColorIndicatorView == nil) {
        _trackColorIndicatorView = [[UIView alloc] init];
        _trackColorIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        _trackColorIndicatorView.layer.borderWidth = 1.0;
        _trackColorIndicatorView.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return _trackColorIndicatorView;
}

- (UIView *)gaugeColorIndicatorView {
    
    if (_gaugeColorIndicatorView == nil) {
        _gaugeColorIndicatorView = [[UIView alloc] init];
        _gaugeColorIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        _gaugeColorIndicatorView.layer.borderWidth = 1.0;
        _gaugeColorIndicatorView.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return _gaugeColorIndicatorView;
}

@end
