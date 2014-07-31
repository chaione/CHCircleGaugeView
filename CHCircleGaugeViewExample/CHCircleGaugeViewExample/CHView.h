//
//  CHView.h
//  CHCircleGaugeViewExample
//
//  Created by Rogelio Gudino on 7/28/14.
//  Copyright (c) 2014 ChaiOne. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHCircleGaugeView;

@interface CHView : UIView

@property (nonatomic, strong, readonly) CHCircleGaugeView *gauge;
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
