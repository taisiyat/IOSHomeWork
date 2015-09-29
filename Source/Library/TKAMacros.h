//
//  TKAMacro.h
//  IOSHomeWork
//
//  Created by Taisiya on 15.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#define TKASetterWithAddObserver(var) \
    if (_##var != var) { \
        [_##var removeObserver:self]; \
        _##var = var; \
        [_##var addObserver:self]; \
    }

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
    @interface viewControllerClass (__viewClass__##propertyName) \
    TKABaseViewProperty(propertyName, viewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__viewClass__##propertyName) \
    \
    @dynamic propertyName; \
    \
    TKABaseViewGetter(propertyName, viewClass) \
    \
    @end


#define TKAWeakifyVariable(var) \
    __weak typeof(var) __TKAweak__##var = var;

#define TKAStrongifyVariable(var) \
    __strong typeof(__TKAweak__##var) var = __TKAweak__##var;

#define TKAEmpty

#define TKAStrongifyVariableAndReturnEntity(var, entity) \
    __strong typeof(__TKAweak__##var) var = __TKAweak__##var; \
    if (!var) { \
        return entity; \
    }

#define TKAStrongifyVariableAndReturnNilIfNil(var) \
TKAStrongifyVariableAndReturnEntity(var, nil)

#define TKAStrongifyVariableAndReturnEmptyIfNil(var) \
TKAStrongifyVariableAndReturnEntity(var, TKAEmpty)