//
//  BackgroundSquare.swift
//  KoeRpret
//
//  Created by Jasmin Hachmane on 25/02/2025.
//

import SwiftUI

struct BackgroundSquare: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.15),
                        Color.green.opacity(0.15),
                        Color.yellow.opacity(0.15)//Transparency colours
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 365, height: 700)
            .overlay( // White border line
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 2)
                    .shadow(color: Color.white.opacity(1), radius: 1) // Extra shadow on border
            )
            .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 0, y: 5) // Schadow
            //.offset(y: 30) // Move square a little down
    }
}



#Preview {
    BackgroundSquare()
}
