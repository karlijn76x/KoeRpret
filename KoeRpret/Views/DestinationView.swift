//
//  DestinationView.swift
//  KoeRpret
//
//  Created by Karlijn van den Herik on 26/02/2025.
//

import SwiftUI

struct DestinationView: View {
    let destination: String
    
    var body: some View {
        switch destination {
        case "quiz_view":
            QuizView()
        case "mini_game_view":
            MiniGameView()
        default:
            Text("Destination not found")
            
        }
    }
}
