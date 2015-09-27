//
//  TKATableViewController.h
//  IOSHomeWork
//
//  Created by Taisiya on 20.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKAUsers;

@interface TKATableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) TKAUsers *users;

- (IBAction)onAddButton:(id)sender;
- (IBAction)onEditButton:(id)sender;

@end
