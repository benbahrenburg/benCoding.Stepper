/**
 * benCoding.Stepper Project
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "BencodingStepperStepperProxy.h"
#import "TiUtils.h"

@implementation BencodingStepperStepperProxy

-(UIViewAutoresizing)verifyAutoresizing:(UIViewAutoresizing)suggestedResizing
{
	return suggestedResizing & ~UIViewAutoresizingFlexibleHeight;
}

USE_VIEW_FOR_VERIFY_HEIGHT

@end
