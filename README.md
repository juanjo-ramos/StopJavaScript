# StopJavaScript
This project doesn't aim to kill JavaScript (well, hold on :thinking_face:) but tries to stop the execution of some JS code ruinning in a `JSContext`. Situation:
* You have some JS code you want to run.
* That code takes a significant amount of time to run.
* The user can cancel the operation at any time.
* When they do, you want to stop the execution of the JS code no matter what.

## How to run this
This project is targetting iOS 13.1.
Just open & run it. The different attemps I'm trying are in `ViewController.swift`.

## Wait, but does this work or not?
It **does not**. Next think I'm trying to do is to have an Obj-C class with ARC disabled and use the C API from JavaScriptCore to see if releasing the Global Context stops the execuition. Stay tuned.
