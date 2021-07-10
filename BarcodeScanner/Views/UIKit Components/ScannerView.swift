//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by 이현호 on 2021/07/08.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerViewControllerDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            print(barcode)
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertConText.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertConText.invalidScannedType
            }
        }
        
        
    }
}

//struct ScannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScannerView(scannedCode: .constant("1234"), alertItem: <#Binding<AlertItem?>#>,
//                    alertItem: )
//    }
//}
