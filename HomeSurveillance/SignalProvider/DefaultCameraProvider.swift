//
//  DefaultCameraProvider.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 22/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import Cocoa
import AVFoundation

class DefaultCameraProvider: SignalProviderItem {
    
    var captureDevice: AVCaptureDevice!
    
    static func provider(withCaptureDevice device: AVCaptureDevice) -> SignalProviderItem {
        let provider = DefaultCameraProvider()
        provider.captureDevice = device
        return provider
    }
    
    func startPreview() -> Bool {
        return true
    }
    
    func name() -> String {
        let manufacturer = captureDevice.manufacturer != nil ? captureDevice.manufacturer! : ""
        return manufacturer.isEmpty ? captureDevice.localizedName : captureDevice.localizedName + " (\(manufacturer))"
    }
}
