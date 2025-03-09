import AVFoundation
import SwiftUI

struct CameraUIView: UIViewControllerRepresentable {
    @ObservedObject var viewModel: CameraViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let session = viewModel.setupCaptureSession()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = viewController.view.layer.bounds
        viewController.view.layer.addSublayer(previewLayer)
        
        session.startRunning()
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
