//
//  coreTextData.m
//  GCD
//
//  Created by 潘文龙 on 2018/8/22.
//  Copyright © 2018年 PorklingTV. All rights reserved.
//

#import "coreTextData.h"

@implementation coreTextData

-(void)setFrame:(CTFrameRef)frame
{
    if (_frame != frame) {
        if (frame != nil) {
            CFRelease(frame);
        }
    }
    CFRetain(frame);
    _frame = frame;
}

-(void)dealloc
{
    if (_frame != nil) {
        CFRelease(_frame);
        _frame = nil;
    }
}

@end
