import SwiftUI

struct ConfettiView: View {
    @State private var confettiParticles: [ConfettiParticle] = []

    var body: some View {
        ZStack {
            ForEach(confettiParticles) { particle in
                RoundedRectangle(cornerRadius: particle.size / 2)
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size * 0.6)
                    .position(particle.position)
                    .opacity(particle.opacity)
                    .rotationEffect(.degrees(particle.rotation))
                    .animation(
                        Animation.easeOut(duration: 4.0) // Langzamere en soepelere animatie
                            .repeatCount(1, autoreverses: false),
                        value: particle.position
                    )
            }
        }
        .onAppear {
            generateConfetti()
        }
    }

    private func generateConfetti() {
        let colors: [Color] = [.red, .blue, .green, .yellow, .pink, .purple, .orange, .cyan]
        let screenWidth = UIScreen.main.bounds.width
        
        let newParticles = (0..<75).map { _ in
            ConfettiParticle(
                id: UUID(),
                position: CGPoint(x: CGFloat.random(in: 0...screenWidth), y: -50), // Start net boven het scherm
                color: colors.randomElement() ?? .red,
                size: CGFloat.random(in: 15...30),
                opacity: 1.0,
                rotation: Double.random(in: 0...360)
            )
        }
        confettiParticles = newParticles

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            for index in confettiParticles.indices {
                confettiParticles[index].position.y += CGFloat.random(in: 600...800) // Valt mooi omlaag
                confettiParticles[index].position.x += CGFloat.random(in: -150...150) // Verspreiding
                confettiParticles[index].opacity = 0 // Verdwijnt na de val
            }
        }
    }
}

struct ConfettiParticle: Identifiable {
    let id: UUID
    var position: CGPoint
    var color: Color
    var size: CGFloat
    var opacity: Double
    var rotation: Double
}

