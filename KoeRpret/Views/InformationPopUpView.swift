//
//  InformationPopUpView.swift
//  KoeRpret
//
//  Created by Karlijn van den Herik on 21/02/2025.
//

import SwiftUI

struct InformationPopUpView: View {
    var body: some View {
        VStack{
            Text("Welkom bij KoeRpret,")
            
            Text("Vind boerderijen in de buurt en schakel over naar de KinderModus, waar een vrolijke koe-mascotte je op weg helpt. Scan QR-codes op de boerderij om leuke weetjes te ontdekken en minigames te spelen!")
        }
        .font(.custom("Patrick Hand SC", size: 20))
        
    }
}

#Preview {
    InformationPopUpView()
}
