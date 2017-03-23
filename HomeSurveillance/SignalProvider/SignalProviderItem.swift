//
//  SignalProvider.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 22/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import Cocoa
import AVFoundation

protocol SignalProviderItem {
    
    static func provider(withCaptureDevice captureDevice: AVCaptureDevice) -> SignalProviderItem
    
    @discardableResult func startPreview(forView view: PreviewView) -> Bool
    func name() -> String
    
}
