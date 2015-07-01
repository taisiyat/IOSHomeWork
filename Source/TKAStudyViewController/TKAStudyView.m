//
//  TKAStudyView.m
//  IOSHomeWork
//
//  Created by Taisiya on 30.06.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAStudyView.h"
#import "TKAStudying.h"

@implementation TKAStudyView

#pragma mark -
#pragma mark Accessors

- (void)setStudying:(TKAStudying *)studying {
    if (_studying != studying) {
        _studying = studying;
        
        [self fillWithStudying:studying];
    }
}


#pragma mark -
#pragma mark Public

- (void)fillWithStudying:(TKAStudying *)studying {
    self.label.text = studying.fullname;
}

- (void)rotateLabel {
    self.label.transform = CGAffineTransformMakeRotation((float)1/(2*M_PI));
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.label.text = @"study 3";
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
