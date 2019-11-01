//
//  ViewController.swift
//  StopJavaScript
//
//  Created by Juanjo Ramos Rodriguez on 31/10/2019.
//  Copyright © 2019 JJR. All rights reserved.
//

import JavaScriptCore
import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    private var context: JSContext? = JSContext()
    private var item: DispatchWorkItem?
    
    override func viewDidLoad() {
        JSGlobalContextRelease(context?.jsGlobalContextRef)
        super.viewDidLoad()
    }

    @IBAction func startTapped(_ sender: Any) {
        startButton.isEnabled = false
        let code = readJSCode()
        runJavaScript(code: code)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        cancelWorkItem()
        discardContext()
    }
    
    private func runJavaScript(code: String) {
        let item = DispatchWorkItem { [weak self] in
            let value = self?.context?.evaluateScript(code)
            value?.call(withArguments: [])
            DispatchQueue.main.async {
                self?.startButton.isEnabled = true
            }
        }
        DispatchQueue.global().async(execute: item)
        self.item = item
    }
    
    private func cancelWorkItem() {
        item?.cancel()
        item = nil
    }
    
    private func discardContext() {
        guard let context = context else { return }
        JSGlobalContextRelease(context.jsGlobalContextRef)
        let a = JSVirtualMachine().remo
    }
}

private func readJSCode() -> String {
    let url = Bundle.main.url(forResource: "code", withExtension: "js")!
    return try! String(contentsOf: url)
}

