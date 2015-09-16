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
    @interface viewControllerClass (__TKAPrivateBaseView__##viewClass##__##propertyName) \
    TKABaseViewProperty(propertyName, viewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__TKAPrivateBaseView__##viewClass##__##propertyName) \
    \
    @dynamic propertyName; \
    \
    TKABaseViewGetter(propertyName, viewClass) \
    \
    @end


#define TKAWeakifyVariable(var) \
    __weak typeof(var) weak##var = var;

#define TKAStrongifyVariable(var) \
    __strong typeof(weak##var) var = weak##var;

#define TKAEmpty

#define TKAStrongifyVariableAndReturnEntity(var, entity) \
    __strong typeof(weak##var) var = weak##var; \
    if (!var) { \
        return entity; \
    }