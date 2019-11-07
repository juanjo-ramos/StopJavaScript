# StopJavaScript
This project doesn't aim to kill JavaScript (well, hold on 🤔) but tries to stop the execution of some JS code running in a `JSContext`. Situation:
* You have some JS code you want to run.
* That code takes a significant amount of time to run.
* The user can cancel the operation at any time.
* When they do, you want to stop the execution of the JS code no matter what.

## How to run this
This project is targetting iOS 13.1.
Just open & run it. The different attemps I'm trying are in `ViewController.swift`.

## Wait, but does this work or not?
~It does not.~

It does now. After some experimentation, it turns out that if you have a `WKWebView` evaluating certain JS code, you can terminate that execution by `nil`'ing the WKWebView object. See [WKWebViewJSCore](https://github.com/juanjo-ramos/StopJavaScript/blob/master/StopJavaScript/StopJavaScript/JavaScript%20Engines/WKWebViewJSCore.swift) for more details.
