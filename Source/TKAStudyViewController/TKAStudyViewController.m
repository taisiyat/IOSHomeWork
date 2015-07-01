//
//  TKAStudyViewController.m
//  IOSHomeWork
//
//  Created by Taisiya on 30.06.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAStudyViewController.h"
#import "TKAStudyView.h"

@interface TKAStudyViewController ()
@property (nonatomic, readonly) TKAStudyView *studyView;

@end

@implementation TKAStudyViewController

#pragma mark -
#pragma mark Accessors

- (void)setStudying:(TKAStudying *)studying{
    if (_studying != studying) {
        _studying = studying;
        
        self.studyView.studying = studying;
//        self.studyView.label.text = data;
    }
}

- (TKAStudyView *)studyView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[TKAStudyView class]]) {
        return (TKAStudyView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.studyView.studying = self.studying;
//    self.data = self.data;
//    self.studyView.label.text = @"study second";
 //   [[(TKAStudyView *)[self view] label] setText:@"study second"];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 40)];
//    label.backgroundColor = [UIColor yellowColor];
//    label.text = @"study";
//    
//    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
//    self.view.opaque = NO;
//    
//    [self.view addSubview:label];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onRotateButton:(id)sender {
    [self.studyView rotateLabel];
}


@end
