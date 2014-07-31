//
//  CHCircleGaugeView.h
//
//  Created by Matthew Morey on 5/6/14.
//  Copyright (c) 2014 ChaiOne. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Enumeration with the possible state of the circle gauge view.
 
 @constant CHCircleGaugeViewStateNA "n/a" is displayed.
 @constant CHCircleGaugeViewStatePercentSign "%" is displayed.
 @constant CHCircleGaugeViewStateScore A whole number is displayed.
 */
typedef NS_ENUM(NSInteger, CHCircleGaugeViewState) {
    CHCircleGaugeViewStateNA,
    CHCircleGaugeViewStatePercentSign,
    CHCircleGaugeViewStateScore
};

/**
 A circle gauge is used to depict the value of a measurement.
 If gauge state is CHCircleGaugeViewStateNA, "n/a" is shown instead of a value.
 If gague state is CHCircleGaugeViewStateScore, "%" is shown instead of a value.
 */
@interface CHCircleGaugeView : UIView

/** @name Managing the gauge */

/**
 The state of the gauge.
 */
@property (nonatomic, assign) CHCircleGaugeViewState state;

/**
 Contains the current value. Setting this property will change the state of the control to `CHCircleGaugeViewStateScore`.
 */
@property (nonatomic, assign) CGFloat value;

/**
 Sets the value the gauge should represent, with optional animation of the change.
 
 The current progress is represented by a floating-point value between 0.0 and 1.0, 
 inclusive, where 1.0 indicates the completion of the task. The default value is 0.0. 
 Values less than 0.0 and greater than 1.0 are pinned to those limits.
 
 Calling this will change the state of the control to `CHCircleGaugeViewStateScore`.
 
 @param value The new gauge value.
 @param animated `YES` if the change should be animated, `NO` if the change should happen immediately.
 */
- (void)setValue:(CGFloat)value animated:(BOOL)animated;

/** @name Configuring the gauge */

/**
 The color shown for the portion of the gauge that is allways filled.
 */
@property (nonatomic, strong) UIColor *trackTintColor;

/**
 The color shown on top of `trackTintColor` for the portion of the gauge that varies based on the `value` property.
 */
@property (nonatomic, strong) UIColor *gaugeTintColor;

/**
 The color of the text.
 
 The default value for this property is a black color (set through the blackColor class method of UIColor). The value for the property 
 can only be set to a non-nil value; setting this property to nil raises an exception.
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 The font of the text.
 
 The default value for this property is the system font at a size of 32 points (using the systemFontOfSize: class method of UIFont). 
 The value for the property can only be set to a non-nil value; setting this property to nil raises an exception.
 */
@property (nonatomic, strong) UIFont *font;

/**
 The width for the portion of the gauge that is always filled. Defaults to a value of 0.5.
 */
@property (nonatomic, assign) CGFloat trackWidth;

/**
 The width for the portion of the gauge that varies based on the `value` property. Defaults to a value of 2.
*/
@property (nonatomic, assign) CGFloat gaugeWidth;

/**
 String that is a suffix on the `value`. This string is meant to be just a few characters long. Defaults to `nil`.
 
 @warning The label backing the string does not auto-shrink, set a smaller font if the text gets truncated.
 
 @see font
 */
@property (nonatomic, copy) NSString *unitsString;

/**
 The text shown when the state of the gauge is `CHCircleGaugeViewStateNA`. Defaults to "n/a".
 */
@property (nonatomic, copy) NSString *notApplicableString;

/**
 The text shown when the state of the gauge is `CHCircleGaugeViewStatePercentSign`. Defaults to "%".
 */
@property (nonatomic, copy) NSString *noDataString;

@end
