//
//  ContentView.swift
//  Calculator
//
//  Created by Joao Batista Padilha on 2023-05-15.
//

import SwiftUI

struct ContentView: View {
    @State var currentValue: String = "0"
    var body: some View {
        ZStack {
            Color.black
            VStack {
                TotalText(value: currentValue)
                ButtonGrid(currentValue: $currentValue)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
