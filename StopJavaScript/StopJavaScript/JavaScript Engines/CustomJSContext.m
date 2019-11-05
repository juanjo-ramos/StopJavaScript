//
//  CustomJSContext.m
//  StopJavaScript
//
//  Created by Juanjo Ramos Rodriguez on 03/11/2019.
//  Copyright © 2019 JJR. All rights reserved.
//

#import "CustomJSContext.h"

@interface CustomJSContext ()

@end

@implementation CustomJSContext

- (instancetype)init
{
    if (self = [super init]) {
        _contextGroup = JSContextGroupCreate();
        _context = JSGlobalContextCreateInGroup(_contextGroup, NULL);
        JSContextGroupRetain(_contextGroup);
        JSGlobalContextRetain(_context);
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
    
    JSGlobalContextRelease(_context);
}

- (JSValue *)evaluateScript:(NSString *)script
{
    JSStringRef query = JSStringCreateWithCFString((CFStringRef)script);
    return (JSValue *)JSEvaluateScript(_context, query, NULL, NULL, 1, NULL);
}

- (void)kill
{
    JSGlobalContextRelease(_context);
    JSContextGroupRelease(_contextGroup);
}

@end
