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
    
    private let javaScriptContext = CustomJSContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startTapped(_ sender: Any) {
        startButton.isEnabled = false
        let code = readJSCode()
        runJavaScript(code: code)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        javaScriptContext.kill()
    }
    
    private func runJavaScript(code: String) {
        DispatchQueue.global().async { [weak self] in
            self?.javaScriptContext.evaluateScript(code)
            
            DispatchQueue.main.async { [weak self] in
                self?.startButton.isEnabled = true
            }
        }
    }
}

private func readJSCode() -> String {
    let url = Bundle.main.url(forResource: "code", withExtension: "js")!
    return try! String(contentsOf: url)
}

