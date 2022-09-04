//
//  ImagePicker.swift
//  Bookmark App
//
//  Created by James Dunn on 3/19/22.
//

import SwiftUI
import UIKit
import AVFoundation
import Vision

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var capturedQuote: CapturedQuote
    @EnvironmentObject var cameraLauncher: CameraLauncher
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
 
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
 
        return imagePicker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
 
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
        var parent: ImagePicker
     
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
                parent.cameraLauncher.didFinishPickingImage = true
                guard let cgImage = image.cgImage else { return }
                
                // Create Vision request to read text from image
                let imageRequestHandler = VNImageRequestHandler(cgImage: cgImage, orientation: .up, options: [:])
                
                DispatchQueue.global(qos: .userInitiated).async {
                    let request = VNRecognizeTextRequest(completionHandler: self.recognizeTextHandler)
                    do {
                        try imageRequestHandler.perform([request])
        //                let results = request.results
                    } catch let error as NSError {
                        print("Failed to perform image request: \(error)")
                        return
                    }
                }
            }
     
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func recognizeTextHandler(request: VNRequest, error: Error?) {
            guard let observations =
                    request.results as? [VNRecognizedTextObservation] else {
                return
            }
            let recognizedStrings = observations.compactMap { observation in
                // Return the string of the top VNRecognizedText instance.
                return observation.topCandidates(1).first?.string
            }
            
            // Process the recognized strings.
            print("Recognized Strings: \na\(recognizedStrings)")
            DispatchQueue.main.async {
                self.parent.capturedQuote.text = recognizedStrings.joined(separator: " ")
            }
    //        processResults(recognizedStrings)
        }
    }
}



//class PreviewView: UIView {
//    override class var layerClass: AnyClass {
//        return AVCaptureVideoPreviewLayer.self
//    }
//
//    /// Convenience wrapper to get layer as its statically known type.
//    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
//        return layer as! AVCaptureVideoPreviewLayer
//    }
//}
