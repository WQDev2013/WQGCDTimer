//
//  WQProxy.h
//  WQGCDTimer
//
//  Created by chenweiqiang on 2020/5/17.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WQProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;
@property (weak, nonatomic) id target;

@end

NS_ASSUME_NONNULL_END
