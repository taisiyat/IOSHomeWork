//
//  TKAUsersView.h
//  IOSHomeWork
//
//  Created by Taisiya on 04.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKAVisibleView;

@interface TKAUsersView : UIView
@property (nonatomic, strong) IBOutlet UITableView  *tableView;
@property (nonatomic, strong) IBOutlet UIButton     *addButton;
@property (nonatomic, strong) IBOutlet UIButton     *editButton;
@property (nonatomic, strong) IBOutlet TKAVisibleView     *visibleView;

@property (nonatomic, strong) IBOutlet UIButton     *saveButton;
@property (nonatomic, strong) IBOutlet UIButton     *loadButton;
@property (nonatomic, strong) IBOutlet UIButton     *showButton;
@property (nonatomic, strong) IBOutlet UIButton     *hideButton;

@property (nonatomic, assign, getter=isEditing) BOOL  editing;

- (void)setEditing:(BOOL)editing animated:(BOOL)animated;

- (void)show;
- (void)hide;

@end
