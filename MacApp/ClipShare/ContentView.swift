//
//  ContentView.swift
//  ClipShare
//
//  Created by Saleeh k on 07/01/23.
//

import SwiftUI
import EFQRCode
import QRCode
//import QRCodeViewUI

public struct QRCodeViewUI: View {
    private let content: QRCode.Document
    public init(
        content: String,
        errorCorrection: QRCode.ErrorCorrection = .high,
        foregroundColor: CGColor = CGColor(gray: 0, alpha: 1),
        backgroundColor: CGColor = CGColor(gray: 1, alpha: 1),
        pixelStyle: QRCodePixelShapeGenerator? = nil,
        eyeStyle: QRCodeEyeShapeGenerator? = nil,
        pupilStyle: QRCodePupilShapeGenerator? = nil,
//        logoTemplate: QRCode.LogoTemplate? = nil,
        negatedOnPixelsOnly: Bool? = nil,
        generator: QRCodeEngine? = nil
    ) {
        self.content = QRCode.Document(
            utf8String: content,
            errorCorrection: errorCorrection,
            generator: generator
        )
        self.content.design.foregroundColor(foregroundColor)
        self.content.design.backgroundColor(backgroundColor)

        if let pixelStyle = pixelStyle {
            self.content.design.shape.onPixels = pixelStyle
        }
        if let eyeStyle = eyeStyle {
            self.content.design.shape.eye = eyeStyle
        }
        if let pupilStyle = pupilStyle {
            self.content.design.shape.pupil = pupilStyle
        }
//        if let logoTemplate = logoTemplate {
//            self.content.logoTemplate = logoTemplate
//        }
//        if let negatedOnPixelsOnly = negatedOnPixelsOnly {
//            self.content.design.shape.negatedOnPixelsOnly = negatedOnPixelsOnly
//        }
    }

    public var body: some View {
        QRCodeDocumentUIView(document: content)
    }
}
func getJSONforQR(deviceId:String!)->String{
    let deviceName = getDeviceName()
    var test = [String : String] ()
    test["deviceId"] = deviceId
    test["deviceName"] = deviceName
    

    let encoder = JSONEncoder()
    var jsonString :String = "{}"
    if let json = try? encoder.encode(test) {
        jsonString = String(data: json, encoding: .utf8)!
    }
    return jsonString
}

struct ContentView: View {
    @State private var isConnected: Bool = false

    var body: some View {
        VStack {
         let deviceId = getDeviceId();
          if(deviceId != nil)
            {
              let jsonString = getJSONforQR(deviceId:deviceId);
              QRCodeViewUI(
                content:jsonString
              )
//              Text(jsonString)
          }else{
              Text("Not connected")
              Button(!isConnected ? "Connect" : "Disconnect") {
//                  isConnected.toggle()
                  regiserDevice()
              }
          }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
