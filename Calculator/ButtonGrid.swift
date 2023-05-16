//
//  ButtonGrid.swift
//  Calculator
//
//  Created by Joao Batista Padilha on 2023-05-15.
//

import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case subtraction
    case multiplication
}

struct ButtonGrid: View {
    @Binding var currentValue: String
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonWasMode: Bool = false
    @State var savedInt = 0
    @State var currentInt = 0
    var body: some View {
        Grid {
            GridRow {
                CalculatorButton(buttonText: "1", action: numberWasPressed)
                CalculatorButton(buttonText: "2", action: numberWasPressed)
                CalculatorButton(buttonText: "3", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "+", action: modeWasPressed, mode: .addition)
            }
            GridRow {
                CalculatorButton(buttonText: "4", action: numberWasPressed)
                CalculatorButton(buttonText: "5", action: numberWasPressed)
                CalculatorButton(buttonText: "6", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "-", action: modeWasPressed, mode: .subtraction)
            }
            GridRow {
                CalculatorButton(buttonText: "7", action: numberWasPressed)
                CalculatorButton(buttonText: "8", action: numberWasPressed)
                CalculatorButton(buttonText: "9", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "X", action: modeWasPressed, mode: .multiplication)
            }
            GridRow {
                CalculatorButton(width: 148, buttonText: "0", action: numberWasPressed)
                    .gridCellColumns(2)
                CalculatorButton(color: .gray, buttonText: "C", action: clearWasPressed)
                CalculatorButton(color: .orange, buttonText: "=", action: equalWasPressed)
            }
        }
    }
    
    func numberWasPressed(button: CalculatorButton){
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentInt = 0
        }
        if let currentValueInt = Int("\(currentInt)" + button.buttonText) {
            currentInt = currentValueInt
            updateText()
        } else {
            currentValue = "Error"
            currentInt = 0
        }
    }
    
    func modeWasPressed(button: CalculatorButton) {
        currentMode = button.mode
        lastButtonWasMode = true
    }
    
    func clearWasPressed(button: CalculatorButton) {
        currentValue = "0"
        currentInt = 0
        lastButtonWasMode = false
        savedInt = 0
        currentMode = .notSet
    }
    
    func equalWasPressed(button: CalculatorButton) {
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        
        if currentMode == .addition {
            savedInt += currentInt
        } else if currentMode == .subtraction {
            savedInt -= currentInt
        } else if currentMode == .multiplication {
            savedInt *= currentInt
        }
        
        currentInt = savedInt
        updateText()
        lastButtonWasMode = true
    }
    
    func updateText() {
        if currentMode == .notSet {
            savedInt = currentInt
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        currentValue = formatter.string(for: currentInt) ?? "Error"
    }
}

struct ButtonGrid_Previews: PreviewProvider {
    @State static var currentValue = "1"
    static var previews: some View {
        ButtonGrid(currentValue: $currentValue)
    }
}
