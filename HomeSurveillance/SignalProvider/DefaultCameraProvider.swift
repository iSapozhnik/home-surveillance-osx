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
    
    static func provider(withCaptureDevice captureDevice: AVCaptureDevice) -> SignalProviderItem {
        return DefaultCameraProvider()
    }
    
    func startPreview() {
        
    }
    
    func name() -> String {
        return "Default camera"
    }
}
