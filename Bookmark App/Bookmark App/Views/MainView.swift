//
//  MainView.swift
//  Bookmark App
//
//  Created by James Dunn on 12/29/21.
//

import SwiftUI
import AlertToast

protocol QuoteCaptureDelegate: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func confirmPhotoPermissions() -> Bool
}

struct MainView: View {
    @EnvironmentObject var cameraLauncher: CameraLauncher
    @State private var image = UIImage()
    @State private var shouldOpenUserCamera = false
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
            .toast(isPresenting: $cameraLauncher.didSaveQuote,
                   duration: 2,
                   tapToDismiss: true,
                   offsetY: -200,
                   alert: {
                AlertToast(displayMode: .banner(.pop),
                           type: .complete(.green),
                           title: "Quote saved!",
                           style: .style(backgroundColor: .green, titleColor: .white, subTitleColor: nil, titleFont: nil, subTitleFont: nil))
            })
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
