//
//  TKAChangeModel+UITableView.h
//  IOSHomeWork
//
//  Created by Taisiya on 06.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TKAChangeModel.h"

@interface TKAChangeModel (UITableView)

- (void)useToTableView:(UITableView *)tableView;
- (void)useToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)animation;

@end
