//
//  MainView.swift
//  Bookmark App
//
//  Created by James Dunn on 12/29/21.
//

import SwiftUI

protocol QuoteCaptureDelegate: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func takePhoto()
}

struct MainView: View {
    var body: some View {
            VStack(alignment: .center, spacing: 50, content: {
                Spacer()
                Text("Bookmark")
                    .font(.system(size: 75))
                Spacer()
                Spacer()
                Spacer()
                CaptureButton(delegate: self)
                Spacer()
            })
        }
    
    var delegate: QuoteCaptureDelegate
    
    func handleTap() {
        delegate.takePhoto()
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
