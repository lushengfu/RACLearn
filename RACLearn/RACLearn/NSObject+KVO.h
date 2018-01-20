//
//  NSObject+KVO.h
//  RACLearn
//
//  Created by happy on 2018/1/20.
//  Copyright © 2018年 happy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)lsf_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
