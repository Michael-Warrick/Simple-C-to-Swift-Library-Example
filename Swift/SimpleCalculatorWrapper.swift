//
//  SimpleCalculatorWrapper.swift
//  SimpleCalculator
//
//  Created by Michael Warrick on 25/06/2023.
//

import Foundation

class SimpleCalculatorWrapper {
    private let simpleCalculator: OpaquePointer
    
    init() {
        simpleCalculator = createSimpleCalculator()
    }
    
    deinit {
        destroySimpleCalculator(simpleCalculator)
    }
    
    func add(a: Int32, b: Int32) -> Int32 {
        return addNumbers(simpleCalculator, a, b)
    }
    
    func subtract(a: Int32, b: Int32) -> Int32 {
        return subtractNumbers(simpleCalculator, a, b)
    }
    
    func multiply(a: Int32, b: Int32) -> Int32 {
        return multiplyNumbers(simpleCalculator, a, b)
    }
    
    func divide(a: Int32, b: Int32) -> Int32 {
        return divideNumbers(simpleCalculator, a, b)
    }
}

// Import the C functions from the dynamic library
private func createSimpleCalculator() -> OpaquePointer {
    let library = dlopen("libSimpleCalculator.dylib", RTLD_NOW) // Replace with the actual library name
    let symbol = dlsym(library, "createSimpleCalculator")
    let function = unsafeBitCast(symbol, to: (@convention(c) () -> OpaquePointer).self)
    return function()
}

private func addNumbers(_ simpleCalculator: OpaquePointer, _ a: Int32, _ b: Int32) -> Int32 {
    let library = dlopen("libSimpleCalculator.dylib", RTLD_NOW) // Replace with the actual library name
    let symbol = dlsym(library, "add")
    let function = unsafeBitCast(symbol, to: (@convention(c) (OpaquePointer, Int32, Int32) -> Int32).self)
    return function(simpleCalculator, a, b)
}

private func subtractNumbers(_ simpleCalculator: OpaquePointer, _ a: Int32, _ b: Int32) -> Int32 {
    let library = dlopen("libSimpleCalculator.dylib", RTLD_NOW) // Replace with the actual library name
    let symbol = dlsym(library, "subtract")
    let function = unsafeBitCast(symbol, to: (@convention(c) (OpaquePointer, Int32, Int32) -> Int32).self)
    return function(simpleCalculator, a, b)
}

private func multiplyNumbers(_ simpleCalculator: OpaquePointer, _ a: Int32, _ b: Int32) -> Int32 {
    let library = dlopen("libSimpleCalculator.dylib", RTLD_NOW) // Replace with the actual library name
    let symbol = dlsym(library, "multiply")
    let function = unsafeBitCast(symbol, to: (@convention(c) (OpaquePointer, Int32, Int32) -> Int32).self)
    return function(simpleCalculator, a, b)
}

private func divideNumbers(_ simpleCalculator: OpaquePointer, _ a: Int32, _ b: Int32) -> Int32 {
    let library = dlopen("libSimpleCalculator.dylib", RTLD_NOW) // Replace with the actual library name
    let symbol = dlsym(library, "divide")
    let function = unsafeBitCast(symbol, to: (@convention(c) (OpaquePointer, Int32, Int32) -> Int32).self)
    return function(simpleCalculator, a, b)
}

// Clean up the calculator instance
private func destroySimpleCalculator(_ simpleCalculator: OpaquePointer) {
    let library = dlopen("libSimpleCalculator.dylib", RTLD_NOW) // Replace with the actual library name
    let symbol = dlsym(library, "destroySimpleCalculator")
    let function = unsafeBitCast(symbol, to: (@convention(c) (OpaquePointer) -> Void).self)
    function(simpleCalculator)
}
