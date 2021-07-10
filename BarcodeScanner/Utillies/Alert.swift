//
//  Alert.swift
//  BarcodeScanner
//
//  Created by 이현호 on 2021/07/10.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertConText {
    static let invalidDeviceInput = AlertItem(title: "잘못된 디바이스 인풋",
                                              message: "카메라에 문제가 있습니다. 입력장치를 찾을 수 없습니다.",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidScannedType = AlertItem(title: "잘못된 스캔타입",
                                              message: "스캐닝 된 값이 유효하지 않습니다. 이 앱은 EAN-8과 EAN-13을 스캔합니다.",
                                              dismissButton: .default(Text("Ok")))
}
