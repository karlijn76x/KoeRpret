import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct CameraView: View {
    @StateObject private var viewModel = CameraViewModel()
    @State private var navigateTo: String? = nil
    
    var body: some View {
        ZStack {
            BackGroundView()
            
            VStack{
                VStack(spacing: 2) {
                    Text("QR code scanner")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                    ZStack{
                        BackgroundSquare()
                        
                        
                        VStack {
                            Spacer()
                            
                            
                            ZStack {
                                CameraUIView(viewModel: viewModel)
                                    .frame(width: 300, height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white, lineWidth: 3)
                                    )
                            }
                            
                            Spacer()
                            
                        }
                        
                        VStack {
                            Image("KlaraHappyIcon")
                                .resizable()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                            
                                .offset(x: 0, y: 40.5)
                            
                            Spacer()
                        }
                        
                    }
                    .onChange(of: viewModel.scannedCode) { newCode in
                        if let code = newCode {
                            navigateTo = code
                        }
                    }
                    .fullScreenCover(item: $navigateTo) { destination in
                        DestinationView(destination: destination)
                    }
                }
            }
        }
    }
}

#Preview {
    CameraView()
}
