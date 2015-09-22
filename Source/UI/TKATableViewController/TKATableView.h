//
//  TKATableView.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKATableView : UIView
@property (nonatomic, strong) IBOutlet UITableView  *usersTableView;
@property (nonatomic, strong) IBOutlet UIButton     *addButton;
@property (nonatomic, strong) IBOutlet UIButton     *sortButton;
@property (nonatomic, strong) IBOutlet UIButton     *removeButton;

@end
