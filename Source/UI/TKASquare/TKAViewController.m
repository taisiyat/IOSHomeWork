//
//  TKAViewController.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAViewController.h"
#import "TKAMacros.h"
#import "TKAView.h"

TKAViewControllerBaseViewProperty(TKAViewController, mainView, TKAView)

@implementation TKAViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onMoveSquareButton:(id)sender {
    self.mainView.moving = !self.mainView.moving;
    [self.mainView animateSquare];
}

@end
