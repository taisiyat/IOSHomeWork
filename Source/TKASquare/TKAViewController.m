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

- (TKAView *)mainView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[TKAView class]]) {
        return (TKAView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView.squarePosition = 0;
    self.mainView.squareMoved = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onMoveSquareButton:(id)sender {
    self.mainView.squareMoved = !self.mainView.squareMoved;
}

@end
