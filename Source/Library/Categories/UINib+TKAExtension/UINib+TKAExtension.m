//
//  UINib+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "UINib+TKAExtension.h"

@implementation UINib (TKAExtension)

+ (UINib *)nibWithNibName:(NSString *)name {
    return [self nibWithNibName:name bundle:nil];
}

- (NSArray *)instantiateWithNilOwnerAndNilOptions {
    return [self instantiateWithOwner:nil options:nil];
}

- (NSArray *)objectWithNibName:(NSString *)name {
    return [self objectWithNibName:name
                           owner:nil
                         options:nil];
}

- (NSArray *)objectWithNibName:(NSString *)name
                       owner:(id)ownerOrNil
                     options:(NSDictionary *)optionsOrNil
{
    return [self objectWithNibName:name
                          bundle:nil
                           owner:ownerOrNil
                         options:optionsOrNil];
}

- (NSArray *)objectWithNibName:(NSString *)name
                      bundle:(NSBundle *)bundleOrNil
                       owner:(id)ownerOrNil
                     options:(NSDictionary *)optionsOrNil
{
    UINib *nib = [UINib nibWithNibName:name bundle:bundleOrNil];
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
                owner:(id)ownerOrNil
              options:(NSDictionary *)optionsOrNil
{
    NSString *className = NSStringFromClass(typeClass);
//    UINib *nib = [UINib nibWithNibName:className bundle:bundleOrNil];
//    return [[nib instantiateWithOwner:ownerOrNil options:optionsOrNil] firstObject];
    
    return [[self objectWithNibName:className] firstObject];
}

@end
