//
//  CustomJavaScriptCore.swift
//  StopJavaScript
//
//  Created by Juanjo Ramos Rodriguez on 03/11/2019.
//  Copyright © 2019 JJR. All rights reserved.
//

import Foundation

final class CustomJavaScriptCore: NSObject, CustomJSContextProtocol {
    
    private var context: JSContext? = JSContext()
    
    func evaluateScript(_ script: String!) -> JSValue! {
        return context!.evaluateScript(script)
    }
    
    func kill() {
        guard let context = context else { return }
        JSGlobalContextRelease(context.jsGlobalContextRef)
    }
}
