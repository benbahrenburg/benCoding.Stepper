/**
 * benCoding.Stepper Project
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiUIView.h"

@interface BencodingStepperStepper : TiUIView<LayoutAutosizing> {
@private
    UIStepper *stepperView;
}

- (IBAction)stepperPressed:(id)sender;

@end
