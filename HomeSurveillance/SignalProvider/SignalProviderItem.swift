//
//  SignalProvider.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 22/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import Foundation
import AVFoundation

protocol SignalProviderItem {
    
    static func provider(withCaptureDevice captureDevice: AVCaptureDevice?) -> SignalProviderItem
    
    func startPreview() -> Bool
    func name() -> String
    
}
