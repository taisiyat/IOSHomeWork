//
//  TKAMacro.h
//  IOSHomeWork
//
//  Created by Taisiya on 15.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

//@property (nonatomic, readonly) TKAView *mainView;

#define TKABaseViewProperty(propertyName, viewClass) \
    @property (nonatomic, readonly) viewClass   *propertyName;

//- (TKAView *)mainView {
//    if ([self isViewLoaded] && [self.view isKindOfClass:[TKAView class]]) {
//        return (TKAView *)self.view;
//    }
//
//    return nil;
//}

#define TKABaseViewGetter(selector, viewClass) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

//@interface TKAViewController ()
//@property (nonatomic, readonly) TKAView *mainView;
//
//@end
//
//@implementation TKAViewController
//
//@dynamic mainView;
//
//#pragma mark -
//#pragma mark Accessors
//
//- (TKAView *)mainView {
//    if ([self isViewLoaded] && [self.view isKindOfClass:[TKAView class]]) {
//        return (TKAView *)self.view;
//    }
//
//    return nil;
//}

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
    \
    @end



// __weak typeof(self) weakSelf = self;
#define TKAWeakVar(var)\
    __weak typeof(var) weak##var = var;

//__strong typeof(weakSelf) strongSelf = weakSelf;
#define TKAStrongVar(var)\
    __strong typeof(weak##var) strong##var = weak##var;
