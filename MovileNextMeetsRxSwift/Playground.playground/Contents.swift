//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import PlaygroundSupport






























func synchronousFunction() -> Int {
    return Int(randomInt())
}

func asynchronousFunction(delay: TimeInterval, onGeneration: @escaping (Int) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        onGeneration(randomInt())
    }
}

asynchronousFunction(delay: 1.5) { print($0) }





















print("✅")

func randomInt() -> Int {
    return Int(arc4random())
}

PlaygroundPage.current.needsIndefiniteExecution = true
