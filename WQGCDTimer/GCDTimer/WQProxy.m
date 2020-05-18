//
//  WQProxy.m
//  WQGCDTimer
//
//  Created by chenweiqiang on 2020/5/17.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

#import "WQProxy.h"

@implementation WQProxy
- (void) dealloc{
    NSLog(@"WQProxy dealloc");
}
+ (instancetype)proxyWithTarget:(id)target
{
    // NSProxy对象不需要调用init，因为它本来就没有init方法
    WQProxy *proxy = [WQProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *signature = nil;
    if ([self.target respondsToSelector:sel]) {
        signature = [self.target methodSignatureForSelector:sel];
    } else {
        // 动态造一个 void object selector arg 函数签名。
        // 目的是返回有效signature，不要因为找不到而crash
        signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
        NSLog(@"methodSignatureForSelector找不到方法");
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    if ([self.target respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.target];
    }else {
        NSLog(@"forwardInvocation找不到方法");
    }
    
}

@end
