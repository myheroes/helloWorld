//
//  CTFrameParser.h
//  GCD
//
//  Created by 潘文龙 on 2018/8/22.
//  Copyright © 2018年 PorklingTV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "coreTextData.h"

@class CTFrameParserConfig;

@interface CTFrameParser : NSObject

/**
 通过配置信息获取内容

 @param coreTextData 获取内容
 @return 返回内容
 */

+(coreTextData *)parserContent:(NSString *)parserContent config:(CTFrameParserConfig *)config;

@end
