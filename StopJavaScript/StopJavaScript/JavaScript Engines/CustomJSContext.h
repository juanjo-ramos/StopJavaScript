//
//  CustomJSContext.h
//  StopJavaScript
//
//  Created by Juanjo Ramos Rodriguez on 03/11/2019.
//  Copyright © 2019 JJR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol CustomJSContextProtocol <NSObject>

- (JSValue *)evaluateScript:(NSString *)script;
- (void)kill;

@end

@interface CustomJSContext : NSObject<CustomJSContextProtocol>  {
    JSGlobalContextRef _context;
}

@end
