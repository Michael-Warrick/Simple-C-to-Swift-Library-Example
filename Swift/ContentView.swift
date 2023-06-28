//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Michael Warrick on 25/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var number1 = ""
    @State private var number2 = ""
    @State private var operation = 0
    @State private var result = ""
    
    let operations = ["Add", "Subtract", "Multiply", "Divide"]
    
    private let calculator = SimpleCalculatorWrapper()
    
    var body: some View {
        VStack {
            Picker("Operation", selection: $operation) {
                ForEach(operations.indices, id: \.self) { index in
                    Text(self.operations[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            HStack {
                TextField("Number 1", text: $number1)
                    .padding()
                    .frame(maxWidth: 200)
                
                TextField("Number 2", text: $number2)
                    .padding()
                    .frame(maxWidth: 200)
            }
            
            Button("Calculate") {
                calculateResult()
            }
            .padding()
            
            Text("Result: \(result)")
                .padding()
            
            Spacer()
        }
    }
    
    private func calculateResult() {
        guard let num1 = Int32(number1), let num2 = Int32(number2) else {
            result = "Invalid numbers"
            return
        }
        
        switch operation {
        case 0:
            result = "\(calculator.add(a: num1, b: num2))"
        case 1:
            result = "\(calculator.subtract(a: num1, b: num2))"
        case 2:
            result = "\(calculator.multiply(a: num1, b: num2))"
        case 3:
            result = "\(calculator.divide(a: num1, b: num2))"
        default:
            result = "Invalid operation"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
