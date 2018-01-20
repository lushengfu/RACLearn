//
//  NSObject+KVO.m
//  RACLearn
//
//  Created by happy on 2018/1/20.
//  Copyright © 2018年 happy. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/message.h>

@implementation NSObject (KVO)

- (void)lsf_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
{
    /**
     1.runtime动态生成Person的子类(派生类)
     2.重写KVO_Person的属性set方法,目的:监听属性有没有改变
     3.修改对象的isa指针
     */
    // 修改对象的isa指针
    object_setClass(self, NSClassFromString(@"NSKVONotifying_Person"));
    
    // 保存观察者对象
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
