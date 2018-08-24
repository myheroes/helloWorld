//
//  coreTextData.h
//  GCD
//
//  Created by 潘文龙 on 2018/8/22.
//  Copyright © 2018年 PorklingTV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface coreTextData : NSObject
/**
 * 位置排版
 */
@property(nonatomic,assign)CTFrameRef frame;
/**
 * 内容的高度
 */
@property(nonatomic,assign)CGFloat height;


@end
