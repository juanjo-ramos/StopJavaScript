//
//  WKWebViewJSCore.swift
//  StopJavaScript
//
//  Created by Juanjo Ramos Rodriguez on 05/11/2019.
//  Copyright © 2019 JJR. All rights reserved.
//

import Foundation
import WebKit

final class WKWebViewJSCore: NSObject, CustomJSContextProtocol {
    
    private var wkWebView: WKWebView?
    
    override init() {
        let configuration = WKWebViewConfiguration()
        configuration.preferences.javaScriptEnabled = true

        self.wkWebView = WKWebView(frame: .zero, configuration: configuration)
        super.init()
    }
    
    // MARK: CustomJSContextProtocol
    
    func evaluateScript(_ script: String!) -> JSValue! {
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.main.async { [weak self] in
            self?.wkWebView?.evaluateJavaScript(script) { (result, error) in
                print("result: \(result)")
                print("error: \(error)")
                group.leave()
            }
        }
        group.wait()
        return JSValue()
    }
    
    func kill() {
        self.wkWebView = nil
    }
}
