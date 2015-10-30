//
//  TKAURLImageModel.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAFileImageModel.h"

@interface TKAURLImageModel : TKAFileImageModel

+ (NSURLSession *)sharedSession;

@end
