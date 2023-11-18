//
//  ContentView.swift
//  SwiftUI_with_UIKit
//
//  Created by 이정훈 on 2023/07/30.
//

import SwiftUI

struct ContentView: View {
    @State private var image: UIImage = UIImage()
    @State private var showImagePicker: Bool = false
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
            
            Button(action: {
                showImagePicker.toggle()
            }, label: { Text("이미지 선택") })
            .buttonStyle(.borderedProminent)
        }
        .fullScreenCover(isPresented: $showImagePicker, content: {
            ImagePicker(selectedImage: $image)
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
