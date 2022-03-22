//
//  AddBookView.swift
//  Bookmark App
//
//  Created by James Dunn on 1/19/22.
//

import SwiftUI

struct AddBookView: View {
    @State private var nameComponents = PersonNameComponents()
    @State private var shouldShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        VStack(alignment: .leading) {
            EntryField(titleText: "Author:", onSubmitAction: { print(self.$nameComponents) })
            EntryField(titleText: "Title:", onSubmitAction: { print(self.$nameComponents) })
            HStack {
                Spacer()
            Button("Choose Image", action: {
                self.shouldShowPhotoLibrary = true
            })
            .sheet(isPresented: $shouldShowPhotoLibrary) {
                ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
            }
                Spacer()
            }
            Spacer()
            
            HStack {
                Spacer()
                Button("Save", action: { print("Hola World!") })
                    .border(.black, width: 2)
                    .cornerRadius(5)
                Spacer()
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Add a Book")
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddBookView()
        }
    }
}

struct EntryField: View {
    @State private var nameComponents = PersonNameComponents()
    private let titleText: String
    private let onSubmitAction: () -> Void
    
    var body: some View {
        HStack {
            Text(titleText)
            TextField(
                "",
                value: $nameComponents,
                format: .name(style: .medium)
            )
                .onSubmit {
                    onSubmitAction()
                }
                .disableAutocorrection(true)
                .border(.secondary)
        }
    }
    
    init(titleText: String, onSubmitAction: @escaping () -> Void) {
        self.titleText = titleText
        self.onSubmitAction = onSubmitAction
    }
}
