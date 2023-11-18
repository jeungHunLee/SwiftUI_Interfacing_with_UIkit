//
//  ImagePicker.swift
//  SwiftUI_with_UIKit
//
//  Created by 이정훈 on 2023/07/30.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage    //선택된 이미지를 bindging 형식으로 저장
    @Environment(\.presentationMode) private var presentationMode    //photo 라이브러리 해지를 위한 변수
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var imagePicker: ImagePicker

        init(imagePicker: ImagePicker) {
            self.imagePicker = imagePicker
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imagePicker.selectedImage = image
            }

            imagePicker.presentationMode.wrappedValue.dismiss()    //사진 라이브러리 해제
        }
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        // UIImagePickerController 인스턴스 반환
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary    //이미지 소스 선택
        imagePicker.allowsEditing = false    //이미지 편집기능 여부
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePicker: self)
    }
}
