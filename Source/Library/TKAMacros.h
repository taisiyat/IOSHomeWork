//
//  TKAMacro.h
//  IOSHomeWork
//
//  Created by Taisiya on 15.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#define TKABaseViewProperty(propertyName, viewClass) \
    @property (nonatomic, readonly) viewClass   *propertyName;

#define TKABaseViewGetter(selector, viewClass) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define TKAViewControllerBaseViewProperty(viewControllerClass, propertyName, viewClass) \
    @interface viewControllerClass () \
    TKABaseViewProperty(propertyName, viewClass) \
    \
    @end \
    \
    @implementation viewControllerClass \
    \
    @dynamic propertyName; \
    \
    TKABaseViewGetter(propertyName, viewClass) \


#define TKAWeakVar(var)\
    __weak typeof(var) weak##var = var;

#define TKAStrongVarFromWeak(var)\
    __strong typeof(weak##var) strong##var = weak##var;
