//
//  TKAUsers.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUsers.h"
#import "TKAUser.h"

#import "NSFileManager+TKAExtension.h"

#import "TKAMacros.h"

static const NSUInteger     kTKAUsersCount      = 6;
static const NSTimeInterval kTKASleepTime       = 1;
static NSString * const     kTKAFileName        = @"usersArray";
static NSString * const     kTKAKeyUsers        = @"TKAKeyUsers";

@interface TKAUsers ()
@property (nonatomic, readonly) NSString *fileFolder;
@property (nonatomic, readonly) NSString *filePath;
@property (nonatomic, readonly, getter=isFileExists) BOOL *fileExists;

@property (nonatomic, readonly) NSArray  *notificationNames;

@end

@implementation TKAUsers

@dynamic fileFolder;
@dynamic filePath;
@dynamic fileExists;
@dynamic notificationNames;

#pragma mark -
#pragma mark Class Method

+ (instancetype)users {
    return [TKAUsers new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unsubscribeFromApplicationNotification:self.notificationNames];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self subscribeToApplicationNotification:self.notificationNames];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fileFolder {
    return [NSFileManager documentsDirectory];
}

- (NSString *)filePath {
    return [NSFileManager pathForDocumentsDirectoryWithFileName:kTKAFileName];
}

- (NSArray *)notificationNames {
    return @[UIApplicationWillTerminateNotification, UIApplicationWillResignActiveNotification];
}

- (BOOL)isFileExists {
    return [NSFileManager fileExistsWithFileName:kTKAFileName];
}

#pragma mark -
#pragma mark Public

- (void)performLoading {
    id block = nil;
    
    if (self.fileExists) {
        TKASleep(kTKASleepTime);
        NSArray *arrayUsers = [[NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath] mutableCopy];
        
        block = ^{
            for (id object in arrayUsers) {
                [self addUnit:object];
            }
        };
        
    } else {
        block = ^{[self fill];};
    }
    
    [self performBlock:block shouldNotify:NO];
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.mutableCopy toFile:self.filePath];
}

#pragma mark -
#pragma mark Private

- (void)fill {
    [self fillWithRandomValueWithCount:kTKAUsersCount];
}

- (void)fillWithRandomValue {
    [self addUnit:[TKAUser user]];
}

- (void)fillWithRandomValueWithCount:(NSUInteger)count {
    for (NSUInteger index = 0; index < kTKAUsersCount; index++) {
        [self fillWithRandomValue];
    }
}

#pragma mark -
#pragma mark Private

- (void)unsubscribeFromApplicationNotification:(NSArray *)notificationNames {
    for (NSString *notificationName in self.notificationNames) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:notificationName
                                                      object:nil];
    }
}

- (void)subscribeToApplicationNotification:(NSArray *)notificationNames {
    for (NSString *notificationName in self.notificationNames) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:notificationName
                                                   object:nil];
    }
}

@end
