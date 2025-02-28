import AVFoundation
import SwiftUI

class CameraViewModel: NSObject, ObservableObject, AVCaptureMetadataOutputObjectsDelegate {
    @Published var scannedCode: String? = nil
    private var captureSession: AVCaptureSession?
    
    func setupCaptureSession() -> AVCaptureSession {
        let session = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return session }
        
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            print("Error: Unable to initialize camera input")
            return session
        }
        
        if session.canAddInput(videoInput) {
            session.addInput(videoInput)
        } else {
            return session
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if session.canAddOutput(metadataOutput) {
            session.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        }
        
        self.captureSession = session
        return session
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject, let code = metadataObject.stringValue {
            scannedCode = code
            captureSession?.stopRunning()
        }
    }
}
