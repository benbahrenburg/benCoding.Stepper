/**
 * benCoding.Stepper Project
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "BencodingStepperStepper.h"
#import "TiUtils.h"
@implementation BencodingStepperStepper

-(void)dealloc
{
	[stepperView removeTarget:self action:@selector(stepperPressed:) forControlEvents:UIControlEventValueChanged];
	RELEASE_TO_NIL(stepperView);
	[super dealloc];
}

-(UIStepper*)stepperView
{
	if (stepperView==nil)
	{
		stepperView = [[UIStepper alloc] initWithFrame:[self bounds]];
		[stepperView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        
		// We have to do this to force the slider subviews to appear, in the case where value<=min==0.
		// If the slider doesn't register a value change (or already have its subviews drawn in a nib) then
		// it will NEVER draw them.
		[stepperView setValue:0.1];
		[stepperView setValue:0];
        //Wire up on on change event
		[stepperView addTarget:self action:@selector(stepperPressed:) forControlEvents:UIControlEventValueChanged];
		[self addSubview:stepperView];

	}
	return stepperView;
}

-(BOOL)hasTouchableListener
{
	// since this guy only works with touch events, we always want them
	// just always return YES no matter what listeners we have registered
	return YES;
}

#pragma mark View controller stuff

-(void)setContinuous_:(id)value
{
	[[self stepperView] setContinuous:[TiUtils boolValue:value]];
}

-(void)setWraps_:(id)value
{
	[[self stepperView] setWraps:[TiUtils boolValue:value]];
}

-(void)setStepValue_:(id)value
{
	[[self stepperView] setStepValue:[TiUtils floatValue:value]];
}

-(void)setMin_:(id)value
{
	[[self stepperView] setMinimumValue:[TiUtils floatValue:value]];
}

-(void)setMax_:(id)value
{
	[[self stepperView] setMaximumValue:[TiUtils floatValue:value]];
}

-(void)setValue_:(id)value withObject:(id)properties
{
	CGFloat newValue = [TiUtils floatValue:value];
	UIStepper * ourStepper = [self stepperView];
	[ourStepper setValue:newValue];
	[self stepperPressed:ourStepper];
}

-(void)setValue_:(id)value
{
	[self setValue_:value withObject:nil];
}

-(void)setEnabled_:(id)value
{
	[[self stepperView] setEnabled:[TiUtils boolValue:value]];
}

-(CGFloat)verifyHeight:(CGFloat)suggestedHeight
{
	CGSize fitSize = [[self stepperView] sizeThatFits:CGSizeZero];
	return fitSize.height;
}

USE_PROXY_FOR_VERIFY_AUTORESIZING

#pragma mark Delegates 

- (IBAction)stepperPressed:(id)sender
{
	NSNumber * newValue = [NSNumber numberWithFloat:[(UISlider *)sender value]];
	[self.proxy replaceValue:newValue forKey:@"value" notification:NO];
    
	if ([self.proxy _hasListeners:@"change"])
	{
		[self.proxy fireEvent:@"change" withObject:[NSDictionary dictionaryWithObject:newValue forKey:@"value"]];
	}
}

@end
