//
//  CTFrameParserConfig.h
//  GCD
//
//  Created by 潘文龙 on 2018/8/22.
//  Copyright © 2018年 PorklingTV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CTFrameParserConfig : NSObject
//配置的属性
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat fontSize;
@property(nonatomic,assign)CGFloat lineSpace;
@property(nonatomic,strong)UIColor * textColor;

@end
