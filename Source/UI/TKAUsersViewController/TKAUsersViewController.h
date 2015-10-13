//
//  TKAUsersViewController.h
//  IOSHomeWork
//
//  Created by Taisiya on 04.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKAUsers;

@interface TKAUsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) TKAUsers *users;

- (IBAction)onAddButton:(id)sender;
- (IBAction)onEditButton:(id)sender;
- (IBAction)onSaveButton:(id)sender;
- (IBAction)onLoadButton:(id)sender;
- (IBAction)onShowButton:(id)sender;
- (IBAction)onHideButton:(id)sender;

@end
