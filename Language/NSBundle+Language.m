//
//  NSBundle+Language.m
//  Language
//
//  Created by appteam on 2017/3/21.
//  Copyright © 2017年 colin.liu. All rights reserved.
//

#import "NSBundle+Language.h"
#import <objc/runtime.h>

static NSString *languageKey = @"chosenLanguage";

@implementation NSBundle (Language)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(localizedStringForKey:value:table:);
        SEL swizzledSelector = @selector(yx_localizedStringForKey:value:table:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (NSString *)yx_localizedStringForKey:(NSString *)key value:(nullable NSString *)value table:(nullable NSString *)tableName {
    NSString *chosenLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:languageKey];
    chosenLanguage = chosenLanguage ? chosenLanguage: @"Base";
    NSBundle *chosenBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:chosenLanguage ofType:@"lproj"]];
    chosenBundle = chosenBundle ? chosenBundle: NSBundle.mainBundle;
    NSString *result = [chosenBundle yx_localizedStringForKey:key value:value table:tableName];
    return result;
}

+ (void)setLangage:(NSString *)language {
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:languageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
