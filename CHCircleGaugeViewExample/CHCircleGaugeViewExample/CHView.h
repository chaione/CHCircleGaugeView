//
//  CHView.h
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

#import <UIKit/UIKit.h>

@class CHCircleGaugeView;

@interface CHView : UIView

@property (nonatomic, strong, readonly) CHCircleGaugeView *gauge;
@property (nonatomic, strong, readonly) UISwitch *gaugeStyleSwitch;
@property (nonatomic, strong, readonly) UILabel *valueSliderLabel;
@property (nonatomic, strong, readonly) UILabel *trackWidthSliderLabel;
@property (nonatomic, strong, readonly) UILabel *gaugeWidthSliderLabel;
@property (nonatomic, strong, readonly) UISlider *valueSlider;
@property (nonatomic, strong, readonly) UISlider *trackWidthSlider;
@property (nonatomic, strong, readonly) UISlider *gaugeWidthSlider;
@property (nonatomic, strong, readonly) UIView *valueColorIndicatorView;
@property (nonatomic, strong, readonly) UIView *trackColorIndicatorView;
@property (nonatomic, strong, readonly) UIView *gaugeColorIndicatorView;

@end
