//
//  WQProxy.m
//  WQGCDTimer
//
//  Created by chenweiqiang on 2020/5/17.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

#import "WQProxy.h"

@implementation WQProxy

+ (instancetype)proxyWithTarget:(id)target
{
    // NSProxy对象不需要调用init，因为它本来就没有init方法
    WQProxy *proxy = [WQProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}

@end
