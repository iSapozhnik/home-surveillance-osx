//
//  DebugCameraProvider.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 23/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import Cocoa
import AVFoundation

class DebugCameraProvider: SignalProviderItem {
    
    static func provider(withCaptureDevice device: AVCaptureDevice?) -> SignalProviderItem {
        return DebugCameraProvider()
    }
    
    func startPreview() -> Bool {
        return true
    }
    
    func name() -> String {
        return "Default name"
    }
}
