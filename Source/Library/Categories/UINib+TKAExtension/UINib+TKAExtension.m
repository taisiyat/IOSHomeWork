//
//  UINib+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "UINib+TKAExtension.h"

@implementation UINib (TKAExtension)

+ (UINib *)nibWithClass:(Class)classType {
    return [self nibWithClass:classType bundle:nil];
}

+ (UINib *)nibWithClass:(Class)classType
                 bundle:(NSBundle *)bundleOrNil
{
    NSString *className = NSStringFromClass(classType);
    return [self nibWithNibName:className bundle:bundleOrNil];
}

- (NSArray *)objectsWithClass:(Class)classType {
    return [self objectsWithClass:classType
                           bundle:nil];
}

- (NSArray *)objectsWithClass:(Class)classType
                       bundle:(NSBundle *)bundleOrNil
{
    return [self objectsWithClass:classType
                           bundle:bundleOrNil
                            owner:nil
                          options:nil];
}

- (NSArray *)objectsWithClass:(Class)classType
                       owner:(id)ownerOrNil
                     options:(NSDictionary *)optionsOrNil
{
    return [self objectsWithClass:classType
                          bundle:nil
                           owner:ownerOrNil
                         options:optionsOrNil];
}

- (NSArray *)objectsWithClass:(Class)classType
                      bundle:(NSBundle *)bundleOrNil
                       owner:(id)ownerOrNil
                     options:(NSDictionary *)optionsOrNil
{
    UINib *nib = [UINib nibWithClass:classType bundle:bundleOrNil];
    return [nib instantiateWithOwner:ownerOrNil options:optionsOrNil];
}

- (id)objectWithClass:(Class)typeClass {
    return [self objectWithClass:typeClass
                           bundle:nil
                            owner:nil
                          options:nil];
}

- (id)objectWithClass:(Class)typeClass
               bundle:(NSBundle *)bundleOrNil
{
    return [self objectWithClass:typeClass
                          bundle:bundleOrNil
                           owner:nil
                         options:nil];
}

- (id)objectWithClass:(Class)classType
               bundle:(NSBundle *)bundleOrNil
                owner:(id)ownerOrNil
              options:(NSDictionary *)optionsOrNil
{
    return [[self objectsWithClass:classType bundle:bundleOrNil owner:ownerOrNil options:optionsOrNil] firstObject];
}

@end
