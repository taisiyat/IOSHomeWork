//
//  TKATableViewController.h
//  IOSHomeWork
//
//  Created by Taisiya on 20.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKAUser;
@class TKAUsers;

@interface TKATableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) TKAUser  *user;
@property (nonatomic, strong) TKAUsers *users;

- (IBAction)onAddButton:(id)sender;
- (IBAction)onRemoveButton:(id)sender;

@end
