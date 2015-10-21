//
//  TKAUsersView.h
//  IOSHomeWork
//
//  Created by Taisiya on 04.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TKALoadingView.h"

@interface TKAUsersView : TKALoadingView
@property (nonatomic, strong) IBOutlet UITableView  *tableView;
@property (nonatomic, strong) IBOutlet UIButton     *addButton;
@property (nonatomic, strong) IBOutlet UIButton     *editButton;

@property (nonatomic, assign, getter=isEditing) BOOL  editing;

- (void)setEditing:(BOOL)editing animated:(BOOL)animated;

@end
