//
//  AccessCameraView.swift
//  Icebreakers
//
//  Created by Susannah Skyer Gupta on 2/20/24.
//

import Foundation
import PhotosUI
import SwiftUI

struct accessCameraView: UIViewControllerRepresentable {

  @Binding var selectedImage: UIImage?
  @Environment(\.presentationMode) var isPresented

  func makeUIViewController(context: Context) -> UIImagePickerController {
    let imagePicker = UIImagePickerController()
    imagePicker.sourceType = .camera
    imagePicker.allowsEditing = true
    imagePicker.delegate = context.coordinator
    return imagePicker
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

  }

  func makeCoordinator() -> Coordinator {
    return Coordinator(picker: self)
  }
}

// Coordinator will help to preview the selected image in the View.
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  var picker: accessCameraView
  var imageSaver = ImageSaver()

  init(picker: accessCameraView) {
    self.picker = picker
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let selectedImage = info[.editedImage] as? UIImage else { return }
    self.picker.selectedImage = selectedImage
    imageSaver.writeToPhotoAlbum(image: selectedImage)
    self.picker.isPresented.wrappedValue.dismiss()
  }
}


