//
//  ContentView.swift
//  iOScalculator
//
//  Created by GAMA  on 25/02/2022.
//

import SwiftUI

enum Operations{
    case null
    case add
    case sub
    case mul
    case div
    case equal
    case clear
}

struct ContentView: View {
    @State var currentValue = "0"
    @State var savedNum = 0
    @State var currentValueInt = 0
    @State var current_operation = Operations.null
    @State var last_button_pressed_was_operation = false
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                TotalText(value: currentValue)
                HStack {
                    CalculatorButton(buttonText: "1", action: didPressedNumber)
                    CalculatorButton(buttonText: "2", action: didPressedNumber)
                    CalculatorButton(buttonText: "3", action: didPressedNumber)
                    CalculatorButton(buttonText: "+", color: .orange, action: didOperationPressed, mode: .add)
                }
                HStack {
                    CalculatorButton(buttonText: "4", action: didPressedNumber)
                    CalculatorButton(buttonText: "5", action: didPressedNumber)
                    CalculatorButton(buttonText: "6", action: didPressedNumber)
                    CalculatorButton(buttonText: "-", color: .orange, action: didOperationPressed, mode: .sub)
                }
                HStack {
                    CalculatorButton(buttonText: "7", action: didPressedNumber)
                    CalculatorButton(buttonText: "8", action: didPressedNumber)
                    CalculatorButton(buttonText: "9", action: didPressedNumber)
                    CalculatorButton(buttonText: "x", color: .orange, action: didOperationPressed, mode: .mul)
                }
                HStack {
                    CalculatorButton(buttonText: "0", action: didPressedNumber, width: 148)
                    CalculatorButton(buttonText: "C", color: .gray, action: didClear)
                    CalculatorButton(buttonText: "=", action: didEqual)
                }
            }
        }.ignoresSafeArea()
    }
    
    func didPressedNumber(button: CalculatorButton){
        if last_button_pressed_was_operation {
            last_button_pressed_was_operation = false
            currentValueInt = 0
        }
        if let parsedValue = Int("\(currentValueInt)" + "\(button.buttonText)"){
            currentValueInt = parsedValue
            updateText()
        }
        else{
            currentValue = "Error!"
            currentValueInt = 0
        }
    }
    
    
    func didOperationPressed(button: CalculatorButton){
        current_operation = button.mode
        last_button_pressed_was_operation = true
    }

    func didEqual(button: CalculatorButton){
        if (current_operation == .null || last_button_pressed_was_operation){
            return
        }
        if (current_operation == .add){
            savedNum += currentValueInt
        }
        else if (current_operation == .sub){
            savedNum -= currentValueInt
        }
        else if(current_operation == .mul){
            savedNum*=currentValueInt
        }
        
        currentValueInt = savedNum
        updateText()
        last_button_pressed_was_operation = true
    }
    
    func didClear(button: CalculatorButton){
        currentValue = "0"
        currentValueInt = 0
        savedNum = 0
    }
    
    func updateText (){
        if current_operation == .null{
            savedNum = currentValueInt
        }
        
        let numberFormator = NumberFormatter()
        numberFormator.numberStyle = .decimal
        let num = NSNumber(value: currentValueInt)
        currentValue = numberFormator.string(from: num) ?? "Error"
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
