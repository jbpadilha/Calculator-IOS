//
//  TotalText.swift
//  Calculator
//
//  Created by Joao Batista Padilha on 2023-05-15.
//

import SwiftUI

struct TotalText: View {
    var value: String = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 60))
            .fontWeight(.light)
            .frame(width: 300, alignment: .trailing)
            .foregroundColor(.white)
            .background(.black)
            .padding()
            .lineLimit(1)
    }
}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText()
    }
}
