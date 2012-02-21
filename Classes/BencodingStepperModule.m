/**
 * benCoding.Stepper Project
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "BencodingStepperModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation BencodingStepperModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
    bool marketPlace=NO;
    
    if(marketPlace)
    {
        return @"83883a90-ce38-4677-98c8-09dd820675c1";
    }
    else
    {
        return @"845f9d15-31dd-41e0-9225-d0bd4fb8ab04";
    }    
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"bencoding.stepper";
}

@end
