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
    @State private var didFinishPickingImage = false
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
                        ImagePicker(selectedImage: self.$image, didFinishPickingImage: false, sourceType: .camera, delegate: self)
                    }.onAppear() { print("IMAGE SHEET APPEARED")}
                Spacer()
            })
            .sheet(isPresented: $didFinishPickingImage) {
                CapturedQuoteView(image: self.image, stringText: self.textFromImage)
            }.onAppear() { print("CAPTURED QUOTE APPEARED")}
        }
    
    var delegate: QuoteCaptureDelegate
    
    func handleTap() {
        print(shouldOpenUserCamera)
        shouldOpenUserCamera = delegate.confirmPhotoPermissions()
        print(shouldOpenUserCamera)
    }
    
    func handleImageSelected() {
        didFinishPickingImage = true
    }
    
    func getTextFromImage(with text: String) {
        print("TEXT IS HERE: \(textFromImage)")
        textFromImage = text
        print("NOW HEREEEE: \(textFromImage)")
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
