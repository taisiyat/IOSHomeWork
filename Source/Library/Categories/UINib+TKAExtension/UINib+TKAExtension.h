//
//  UINib+TKAExtension.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UINib (TKAExtension)

+ (UINib *)nibWithClass:(Class)classType;
+ (UINib *)nibWithClass:(Class)classType
                 bundle:(NSBundle *)bundleOrNil;

+ (NSArray *)objectsWithClass:(Class)classType;
+ (NSArray *)objectsWithClass:(Class)classType
                       bundle:(NSBundle *)bundleOrNil;
+ (NSArray *)objectsWithClass:(Class)classType
                        owner:(id)ownerOrNil
                      options:(NSDictionary *)optionsOrNil;
+ (NSArray *)objectsWithClass:(Class)classType
                       bundle:(NSBundle *)bundleOrNil
                        owner:(id)ownerOrNil
                      options:(NSDictionary *)optionsOrNil;

+ (id)objectWithClass:(Class)typeClass;
+ (id)objectWithClass:(Class)typeClass
               bundle:(NSBundle *)bundleOrNil;
+ (id)objectWithClass:(Class)classType
               bundle:(NSBundle *)bundleOrNil
                owner:(id)ownerOrNil
              options:(NSDictionary *)optionsOrNil;

@end
