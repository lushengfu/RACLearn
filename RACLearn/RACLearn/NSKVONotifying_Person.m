//
//  NSKVONotifying_Person.m
//  RACLearn
//
//  Created by happy on 2018/1/20.
//  Copyright © 2018年 happy. All rights reserved.
//

#import "NSKVONotifying_Person.h"
#import <objc/message.h>

@implementation NSKVONotifying_Person

- (void)setAge:(NSInteger)age
{
    [super setAge:age];
//    _age = age;
    
    NSLog(@"%@", [super class]);
    
    id observer = objc_getAssociatedObject(self, @"observer");
    
    [observer observeValueForKeyPath:@"age" ofObject:self change:nil context:nil];
}

@end
