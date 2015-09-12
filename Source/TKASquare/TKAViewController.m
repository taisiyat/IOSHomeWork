//
//  TKAViewController.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAViewController.h"

@interface TKAViewController ()
@property (nonatomic, readonly) TKAView *squareView;

@end

@implementation TKAViewController

- (TKAView *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[TKAView class]]) {
        return (TKAView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.squareView.squarePosition = 0;
    self.squareView.mouvingSquare = NO;
}

- (void)viewDidAppear:animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onMoveSquareButton:(id)sender {
    [self.squareView setSquarePosition:[self.squareView nextSquarePosition]];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
