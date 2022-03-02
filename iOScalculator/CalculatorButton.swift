//
//  CalculatorButton.swift
//  iOScalculator
//
//  Created by GAMA  on 25/02/2022.
//

import SwiftUI

struct CalculatorButton: View {
    var buttonText: String = "0"
    var color: Color = Color(hue: 1.0, saturation: 0.0, brightness: 0.283)
    var action: (CalculatorButton) -> Void = {_ in}
    var width: CGFloat = 70
    var mode: Operations = .null
    var body: some View {
        Button{
            action(self)
        }label: {
            Text(buttonText)
                .font(.system(size: 30))
                .frame(width: width, height: 70, alignment: .center)
                .background(color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 35))
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
