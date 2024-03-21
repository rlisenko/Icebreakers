//
//  AccessCameraView.swift
//  Icebreakers
//
//  Created by Susannah Skyer Gupta on 2/20/24.
//

import Foundation
import PhotosUI
import SwiftUI

struct AccessCameraView: UIViewControllerRepresentable {

    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
//        imagePicker.showsCameraControls = false
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }

    // Coordinator will help to preview the selected image in the View.
     class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var accessCameraView: AccessCameraView
        var imageSaver = ImageSaver()

        init(picker: AccessCameraView) {
            self.accessCameraView = picker
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[.editedImage] as? UIImage else { return }
            accessCameraView.selectedImage = selectedImage
            imageSaver.writeToPhotoAlbum(image: selectedImage)
            accessCameraView.isPresented.wrappedValue.dismiss()
        }
    }
}
