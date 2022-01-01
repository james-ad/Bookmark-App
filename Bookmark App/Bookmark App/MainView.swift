//
//  MainView.swift
//  Bookmark App
//
//  Created by James Dunn on 12/29/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
            VStack(alignment: .center, spacing: 50, content: {
                Spacer()
                Text("Bookmark")
                    .font(.system(size: 75))
                Spacer()
                Spacer()
                Spacer()
                CaptureButton()
                Spacer()
            })
        }    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
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
    
    private func handleTap() {
        print("Button Tapped!!")
    }
}
