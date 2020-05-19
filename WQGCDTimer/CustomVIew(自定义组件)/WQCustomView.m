//
//  WQCustomView.m
//  WQGCDTimer
//
//  Created by chenweiqiang on 2020/5/19.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

#import "WQCustomView.h"
@interface WQCustomView()
@property (strong, nonatomic) id target;
@property (assign, nonatomic) SEL pushSel;
@end
@implementation WQCustomView
- (void) dealloc {
    NSLog(@"WQCustomView dealloc");
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubviews];
    }
    return self;
}

- (void) addSubviews {
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, 40, 20)];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}
- (void)pushVC {
    if (self.target != nil && self.pushSel != nil){
            //[target performSelector:selector];
            if ([self.target respondsToSelector:self.pushSel]) {
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [self.target performSelector:self.pushSel];
    #pragma clang diagnostic pop
            }
        }
}
- (void)setPushVCSelector:(id)target selector:(SEL)selector {
    self.target = target;
    self.pushSel = selector;
}
@end
