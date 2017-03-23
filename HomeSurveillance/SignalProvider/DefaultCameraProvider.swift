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
    
    func startPreview(forView view: PreviewView) -> Bool {
        
        let session = AVCaptureSession()
        let input = (try! AVCaptureDeviceInput(device: captureDevice))
        let output = AVCaptureVideoDataOutput()
        
        session.addOutput(output)
        session.addInput(input)
        
        let layerPreview = AVCaptureVideoPreviewLayer(session: session)
        layerPreview?.videoGravity = AVLayerVideoGravityResizeAspectFill
        layerPreview?.frame = view.bounds
        
        view.layer = layerPreview
        view.wantsLayer = true
        
        session.startRunning()
        
        return true
    }
    
    func name() -> String {
        let manufacturer = captureDevice.manufacturer != nil ? captureDevice.manufacturer! : ""
        return manufacturer.isEmpty ? captureDevice.localizedName : captureDevice.localizedName + " (\(manufacturer))"
    }
}
