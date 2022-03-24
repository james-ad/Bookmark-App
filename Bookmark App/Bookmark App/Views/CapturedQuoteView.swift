//
//  CapturedQuoteView.swift
//  Bookmark App
//
//  Created by James Dunn on 3/23/22.
//

import SwiftUI

struct CapturedQuoteView: View {
    @State var image: UIImage
    @State private var capturedQuote: String = "Hola, Worldfdjfjasfjdslkjflksadjfldsjajfkldjsflkdjsaflkdjsalkfjdklsafjkldjfklasjfkl;alfjdklsaf;dsajfkl;dsjlgfjsaklf;jdkl;fjasklfjdlajgdlk;sajflksdfjdlksjfalisdfjldskjfklasjfdklsajfkldsajfkldsjafkl;sdajfkldsjflk;sdja"
    var body: some View {
        TextEditor(text: $capturedQuote)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .border(.black, width: 2)
        Image(uiImage: image)
        Button("Save Quote", action: {
            print("Le captured quote: \($capturedQuote)")
        })
    }
}

struct CapturedQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CapturedQuoteView(image: UIImage())
    }
}
