//
//  MainView.swift
//  Bookmark App
//
//  Created by James Dunn on 12/29/21.
//

import SwiftUI

protocol QuoteCaptureDelegate: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func confirmPhotoPermissions() -> Bool
}

struct MainView: View {
    @State private var image = UIImage()
    @State private var shouldOpenUserCamera = false
    @EnvironmentObject var cameraLauncher: CameraLauncher
    @State private var textFromImage: String = ""
    
    var body: some View {
            VStack(alignment: .center, spacing: 50, content: {
                Spacer()
                Text("Bookmark")
                    .font(.system(size: 75))
                Spacer()
                Spacer()
                Spacer()
                CaptureButton(delegate: self)
                    .sheet(isPresented: $shouldOpenUserCamera) {
                        ImagePicker(selectedImage: self.$image, sourceType: .camera, delegate: self)
                    }
                Spacer()
            })
            .sheet(isPresented: $cameraLauncher.didFinishPickingImage) {
                CapturedQuoteView()
            }
        }
    
    var delegate: QuoteCaptureDelegate
    
    func handleTap() {
        print(shouldOpenUserCamera)
        shouldOpenUserCamera = delegate.confirmPhotoPermissions()
        print(shouldOpenUserCamera)
    }
    
    func handleImageSelected() {
        cameraLauncher.didFinishPickingImage = true
    }    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(delegate: QuoteCaptureViewController())
    }
}

struct CaptureButton: View {
    var body: some View {
        Group {
            Button(action: handleTap) {
                Text("Capture Photo")
                    .font(.largeTitle)
            }
            .frame(maxWidth: 300, maxHeight: 300)
        }
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(200)
        .onTapGesture {
            handleTap()
        }
    }
    
    var delegate: MainView
    
    private func handleTap() {
        print("Button Tapped!!")
        delegate.handleTap()
    }
}
