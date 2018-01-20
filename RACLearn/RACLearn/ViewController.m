//
//  ViewController.m
//  RACLearn
//
//  Created by happy on 2018/1/20.
//  Copyright © 2018年 happy. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // KVO:监听set方法是否被调用
    /**
      1.runtime动态
     */
    
    Person *p = [[Person alloc] init];
    
    [p lsf_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
//    [p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    NSLog(@"%@", NSStringFromClass([p class]));
    //NSKVONotifying_Person
    _person = p;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _person.age++;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"监听到年龄: %ld", _person.age);
}

- (void)dealloc
{
    [_person removeObserver:self forKeyPath:@"age"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
