//
//  CHCircleGaugeView.m
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

#import "CHCircleGaugeView.h"
#import "CHCircleGaugeViewDebugMacros.h"
#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>

static CGFloat const CHKeyAnimationDuration = 0.5f;
static CGFloat const CHKeyDefaultValue = 0.0f;
static CGFloat const CHKeyDefaultFontSize = 32.0f;
static CGFloat const CHKeyDefaultTrackWidth = 0.5f;
static CGFloat const CHKeyDefaultGaugeWidth = 2.0f;
static NSString * const CHKeyDefaultNAText = @"n/a";
static NSString * const CHKeyDefaultNoAnswersText = @"%";
#define CHKeyDefaultTrackTintColor [UIColor blackColor]
#define CHKeyDefaultGaugeTintColor [UIColor blackColor]
#define CHKeyDefaultTextColor [UIColor blackColor]

@interface CHCircleGaugeView ()

@property (nonatomic, strong) CAShapeLayer *trackCircleLayer;
@property (nonatomic, strong) CAShapeLayer *gaugeCircleLayer;
@property (nonatomic, strong) UILabel *valueTextLabel;

@end

@implementation CHCircleGaugeView

#pragma mark - View Initialization

- (instancetype)init {
    
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
   
    if (self) {
        
        [self initSetup];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self initSetup];
    }
    
    return self;
}

- (void)initSetup {
    
    _state = CHCircleGaugeViewStateNA;
    _value = CHKeyDefaultValue;
    _trackTintColor = CHKeyDefaultTrackTintColor;
    _gaugeTintColor = CHKeyDefaultGaugeTintColor;
    _textColor = CHKeyDefaultTextColor;
    _font = [UIFont systemFontOfSize:CHKeyDefaultFontSize];
    _trackWidth = CHKeyDefaultTrackWidth;
    _gaugeWidth = CHKeyDefaultGaugeWidth;
    _notApplicableString = CHKeyDefaultNAText;
    _noDataString = CHKeyDefaultNoAnswersText;
    [self createGauge];
}

- (void)createGauge {
    
    [self.layer addSublayer:self.trackCircleLayer];
    [self.layer addSublayer:self.gaugeCircleLayer];
    [self addSubview:self.valueTextLabel];
    
    [self setupConstraints];
}

- (void)setupConstraints {
    
    NSDictionary *viewDictionary = @{@"valueText" : self.valueTextLabel};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[valueText]|" options:0 metrics:nil views:viewDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[valueText]|" options:0 metrics:nil views:viewDictionary]];
}

#pragma mark - Property Setters

- (void)setState:(CHCircleGaugeViewState)state {
    
    if (_state != state) {
        
        _state = state;
        
        switch (state) {
            case CHCircleGaugeViewStateNA: {
                [self updateGaugeWithValue:0 animated:NO];
                
                break;
            }
            case CHCircleGaugeViewStatePercentSign: {
                [self updateGaugeWithValue:0 animated:NO];
                
                break;
            }
            case CHCircleGaugeViewStateScore: {
                [self updateGaugeWithValue:self.value animated:NO];
                
                break;
            }
                
            default: {
                ALog(@"Missing gauge state.");
                
                break;
            }
        }
    }
}

- (void)setValue:(CGFloat)value {
    
    [self setValue:value animated:NO];
}

- (void)setValue:(CGFloat)value animated:(BOOL)animated {
    
    self.state = CHCircleGaugeViewStateScore;
    
    if (value != _value) {
        
        [self willChangeValueForKey:NSStringFromSelector(@selector(value))];
        value = MIN(1.0f, MAX(0.0f, value));
        [self updateGaugeWithValue:value animated:animated];
        _value = value;
        [self didChangeValueForKey:NSStringFromSelector(@selector(value))];
    }
}

- (void)setUnitsString:(NSString *)unitsString {
    
    if ([_unitsString isEqualToString:unitsString] == NO) {
        _unitsString = [unitsString copy];
        self.valueTextLabel.attributedText = [self formattedStringForValue:self.value];
    }
}

- (void)updateGaugeWithValue:(CGFloat)value animated:(BOOL)animated {
    
    self.valueTextLabel.attributedText = [self formattedStringForValue:value];
    
    BOOL previousDisableActionsValue = [CATransaction disableActions];
    [CATransaction setDisableActions:YES];
    self.gaugeCircleLayer.strokeEnd = value;
    
    if (animated) {
 
        self.gaugeCircleLayer.strokeEnd = value;
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = CHKeyAnimationDuration;
        pathAnimation.fromValue = [NSNumber numberWithFloat:self.value];
        pathAnimation.toValue = [NSNumber numberWithFloat:value];
        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.gaugeCircleLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    }
    
    [CATransaction setDisableActions:previousDisableActionsValue];
}

- (void)setTrackTintColor:(UIColor *)trackTintColor {
    
    if (_trackTintColor != trackTintColor) {
        
        _trackTintColor = trackTintColor;
        self.trackCircleLayer.strokeColor = trackTintColor.CGColor;
    }
}

- (void)setGaugeTintColor:(UIColor *)gaugeTintColor {
    
    if (_gaugeTintColor != gaugeTintColor) {
        
        _gaugeTintColor = gaugeTintColor;
        self.gaugeCircleLayer.strokeColor = gaugeTintColor.CGColor;
    }
}

- (void)setTrackWidth:(CGFloat)trackWidth {
    
    if (_trackWidth != trackWidth) {
        
        _trackWidth = trackWidth;
        self.trackCircleLayer.lineWidth = trackWidth;
        [self.layer layoutSublayers];
    }
}

- (void)setGaugeWidth:(CGFloat)gaugeWidth {
    
    if (_gaugeWidth != gaugeWidth) {
        
        _gaugeWidth = gaugeWidth;
        self.gaugeCircleLayer.lineWidth = gaugeWidth;
        [self.layer layoutSublayers];
    }
}

- (void)setTextColor:(UIColor *)textColor {
    
    if (_textColor != textColor) {
        
        _textColor = textColor;
        self.valueTextLabel.textColor = textColor;
    }
}

- (void)setFont:(UIFont *)font {
    
    if (_font != font) {
        
        _font = font;
        self.valueTextLabel.font = font;
    }
}

- (void)setGaugeStyle:(CHCircleGaugeStyle)gaugeStyle {
    
    if (_gaugeStyle != gaugeStyle) {
        _gaugeStyle = gaugeStyle;
        [self.layer layoutSublayers];
    }
}

#pragma mark - Circle Shapes

- (CAShapeLayer *)trackCircleLayer {
    
    if (_trackCircleLayer == nil) {
        
        _trackCircleLayer = [CAShapeLayer layer];
        _trackCircleLayer.lineWidth = self.trackWidth;
        _trackCircleLayer.fillColor = [UIColor clearColor].CGColor;
        _trackCircleLayer.strokeColor = self.trackTintColor.CGColor;
        _trackCircleLayer.path = [self insideCirclePath].CGPath;
    }

    return _trackCircleLayer;
}

- (CAShapeLayer *)gaugeCircleLayer {
    
    if (_gaugeCircleLayer == nil) {
        
        _gaugeCircleLayer = [CAShapeLayer layer];
        _gaugeCircleLayer.lineWidth = self.gaugeWidth;
        _gaugeCircleLayer.fillColor = [UIColor clearColor].CGColor;
        _gaugeCircleLayer.strokeColor = self.gaugeTintColor.CGColor;
        _gaugeCircleLayer.strokeStart = 0.0f;
        _gaugeCircleLayer.strokeEnd = self.value;
        _gaugeCircleLayer.path = [self circlPathForCurrentGaugeStyle].CGPath;
    }
    
    return _gaugeCircleLayer;
}

- (UIBezierPath *)circlPathForCurrentGaugeStyle {
    
    switch (self.gaugeStyle) {
        case CHCircleGaugeStyleInside: {
            return [self insideCirclePath];
        }
        case CHCircleGaugeStyleOutside: {
            return [self outsideCirclePath];
        }
        default: {
            return nil;
        }
    }
}

- (UIBezierPath *)insideCirclePath {
    
    CGPoint arcCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                        radius:CGRectGetWidth(self.bounds) / 2.0f
                                                    startAngle:(3.0f * M_PI_2)
                                                      endAngle:(3.0f * M_PI_2) + (2.0f * M_PI)
                                                     clockwise:YES];
    
    return path;
}

- (UIBezierPath *)outsideCirclePath {
    
    CGPoint arcCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat radius = (CGRectGetWidth(self.bounds) / 2.0f) + (self.trackWidth / 2.0f) + (self.gaugeWidth / 2.0f);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                        radius:radius
                                                    startAngle:(3.0f * M_PI_2)
                                                      endAngle:(3.0f * M_PI_2) + (2.0f * M_PI)
                                                     clockwise:YES];
    
    return path;
}

#pragma mark - Text Label

- (UILabel *)valueTextLabel {
    
    if (_valueTextLabel == nil) {
        
        _valueTextLabel = [[UILabel alloc] init];
        [_valueTextLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        _valueTextLabel.textAlignment = NSTextAlignmentCenter;
        _valueTextLabel.attributedText = [self formattedStringForValue:self.value];
    }
    
    return _valueTextLabel;
}

- (NSAttributedString *)formattedStringForValue:(CGFloat)value {
    
    NSAttributedString *valueString;
    NSDictionary *stringAttributes = @{
                                       NSForegroundColorAttributeName : self.textColor,
                                       NSFontAttributeName : self.font
                                       };
    
    switch (self.state) {
        case CHCircleGaugeViewStateNA: {
            valueString = [[NSAttributedString alloc] initWithString:self.notApplicableString attributes:stringAttributes];
            
            break;
        }
        case CHCircleGaugeViewStatePercentSign: {
            valueString = [[NSAttributedString alloc] initWithString:self.noDataString attributes:stringAttributes];
            
            break;
        }
        case CHCircleGaugeViewStateScore: {
            NSString *suffix = self.unitsString ? self.unitsString : @"";
            valueString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.0f %@", value * 100.0f, suffix]
                                                          attributes:stringAttributes];
            
            break;
        }
            
        default: {
            ALog(@"Missing gauge state.");
            
            break;
        }
    }
    
    return valueString;
}

#pragma mark - KVO

// Handling KVO notifications for the value property, since
//   we're proxying with the setValue:animated: method.
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    
    if ([key isEqualToString:NSStringFromSelector(@selector(value))]) {
        
        return NO;
    } else {
        
        return [super automaticallyNotifiesObserversForKey:key];
    }
}

#pragma mark - CALayerDelegate

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    
    [super layoutSublayersOfLayer:layer];
    
    if (layer == self.layer) {
        
        self.trackCircleLayer.path = [self insideCirclePath].CGPath;
        self.gaugeCircleLayer.path = [self circlPathForCurrentGaugeStyle].CGPath;
    }
}

@end
