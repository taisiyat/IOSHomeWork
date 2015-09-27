//
//  UINib+TKAExtension.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (TKAExtension)

+ (UINib *)nibWithNibName:(NSString *)name;

- (NSArray *)instantiateWithNilOwnerAndNilOptions;

- (NSArray *)objectWithNibName:(NSString *)name;

- (NSArray *)objectWithNibName:(NSString *)name
                       owner:(id)ownerOrNil
                     options:(NSDictionary *)optionsOrNil;
- (NSArray *)objectWithNibName:(NSString *)name
                      bundle:(NSBundle *)bundleOrNil
                       owner:(id)ownerOrNil
                     options:(NSDictionary *)optionsOrNil;

- (id)objectWithClass:(Class)typeClass;

- (id)objectWithClass:(Class)typeClass
               bundle:(NSBundle *)bundleOrNil
                owner:(id)ownerOrNil
              options:(NSDictionary *)optionsOrNil;

@end
