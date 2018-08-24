//
//  CTFrameParserConfig.m
//  GCD
//
//  Created by 潘文龙 on 2018/8/22.
//  Copyright © 2018年 PorklingTV. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig

-(instancetype)init
{
    if (self = [super init]) {
        _width = 200.f;
        _lineSpace = 8.f;
        _fontSize = 18.f;
        _textColor = [UIColor colorWithRed:108 green:108 blue:108 alpha:1.0];
    }
    return self;
}


@end
