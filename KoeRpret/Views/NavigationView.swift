//
//  NavigationView.swift
//  KoeRpret
//
//  Created by Karlijn van den Herik on 21/02/2025.
//

import SwiftUI

struct CombinedView: View {
    var body: some View {
        ZStack {
            BackGroundView()
            BackgroundSquare()
        }
    }
}
#Preview {
    CombinedView()
}
