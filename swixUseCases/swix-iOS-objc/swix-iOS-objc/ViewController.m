//
//  ViewController.m
//  swix-iOS-objc
//
//  Created by Scott Sievert on 7/12/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import "ViewController.h"
#import "swixiOSobjc-Swift.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    test* t = [[test alloc] init];
    [t testFunc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
