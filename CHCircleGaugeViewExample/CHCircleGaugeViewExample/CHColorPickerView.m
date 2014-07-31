//
//  CHColorPickerView.m
//  CHCircleGaugeViewExample
//
//  Created by Rogelio Gudino on 7/29/14.
//  Copyright (c) 2014 ChaiOne. All rights reserved.
//

#import "CHColorPickerView.h"
#import "HRColorPickerView.h"

@interface CHColorPickerView ()

@property (nonatomic, strong) HRColorPickerView *colorPickerView;

@end

@implementation CHColorPickerView

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
    
    self.colorPickerView = [[HRColorPickerView alloc] init];
    [self addSubview:self.colorPickerView];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.colorPickerView.frame = self.bounds;
}

@end
