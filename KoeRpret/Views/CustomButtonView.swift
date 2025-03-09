//
//  CustomButtonView.swift
//  KoeRpret
//
//  Created by Karlijn van den Herik on 25/02/2025.
//

import SwiftUI

struct CustomButtonView: View {
    var text: String
    var width: CGFloat?
    var height: CGFloat?
    var fontSize: CGFloat
    var action: () -> Void
    
    var body: some View {
        Button(action: action)
        {
            Text(text)
                .font(.custom("PatrickHandSC-Regular", size: fontSize))
                .foregroundColor(.black)
                .frame(width: width, height: height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color.white, lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color(red: 199/255, green: 223/255, blue: 182/255)))
                                                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 3, y: 3)
                    
                
        )}
    }
}

#Preview {
    VStack{
        CustomButtonView(text: "Knop", width: 200, height: 100, fontSize: 60) {
            print("knop ingedrukt")
        }
        
        CustomButtonView(text: "Knop", width: 100, height: 50, fontSize: 40) {
            print("knop ingedrukt")
        }
    }
}
