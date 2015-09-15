//
//  TKAViewController.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAViewController.h"

@interface TKAViewController ()
@property (nonatomic, readonly) TKAView *mainView;

@end

@implementation TKAViewController

@dynamic mainView;

#pragma mark -
#pragma mark Accessors

- (TKAView *)mainView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[TKAView class]]) {
        return (TKAView *)self.view;
    }
    
    return nil;
}

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
}

@end
