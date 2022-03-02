//
//  TotalText.swift
//  iOScalculator
//
//  Created by GAMA  on 25/02/2022.
//

import SwiftUI

struct TotalText: View {
    var value: String = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 50))
            .padding()
            .foregroundColor(.white)
            .lineLimit(1)
    }
}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText()
    }
}
