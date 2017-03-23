//
//  DebugCameraProvider.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 23/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import Cocoa
import AVFoundation

class NoCameraProvider: SignalProviderItem {
    
    static func provider(withCaptureDevice device: AVCaptureDevice) -> SignalProviderItem {
        return NoCameraProvider()
    }
    
    func startPreview(forView view: PreviewView) -> Bool {
        return false
    }
    
    func name() -> String {
        return "Default name"
    }
}
