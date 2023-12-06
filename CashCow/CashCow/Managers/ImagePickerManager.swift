//
//  ImagePickerManager.swift
//  CashCow
//
//  Created by Angelique Freier on 05.12.23.
//

import Foundation
import SwiftUI
import PhotosUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    // MARK: - Variables
    
    @Binding var showImagePicker: Bool
    
    var action: (Data?) -> Void
    
    
    // MARK: - Functions
    
    func makeCoordinator() -> Coordinator {
        
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 5
        let imagePickerViewController = PHPickerViewController(configuration: configuration)
        imagePickerViewController.delegate = context.coordinator
        
        return imagePickerViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        var parent: ImagePickerView
        
        init(_ imagePickerView: ImagePickerView) {
            parent = imagePickerView
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let result = results.first {
                result.itemProvider.loadDataRepresentation(forTypeIdentifier: "public.image")
                { object, error in
                    self.parent.action(object)
                }
            }
            dismissImagePickerViewController()
        }
        
        private func dismissImagePickerViewController() {
            
            Task {
                await MainActor.run {
                    parent.showImagePicker = false
                }
            }
        }
    }
    
}

#Preview {
    ImagePickerView(showImagePicker: .constant(false)) { _ in }
}
