//
//  SignalProvider.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 22/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import Cocoa
import AVFoundation

class SignalProvider: NSObject {
    
    func startMonitoring(onUpdate: @escaping (SignalProvider) -> ()) {
        
        //FIXME: remove observer
        
        NotificationCenter.default
            .addObserver(forName: NSNotification.Name.AVCaptureDeviceWasDisconnected, object: nil, queue: nil)
            { (notif) -> Void in
                onUpdate(self)
        }
        
        NotificationCenter.default
            .addObserver(forName: NSNotification.Name.AVCaptureDeviceWasConnected, object: nil, queue: nil)
            { (notif) -> Void in
                onUpdate(self)
        }
    }
    
    func allProviders() -> [SignalProviderItem] {

        let captureDevices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo) as! [AVCaptureDevice]
        
        if !captureDevices.isEmpty {
            let providers = captureDevices.map() { return DefaultCameraProvider.provider(withCaptureDevice: $0 ) }
        
            return providers
            
        } else {
            return [NoCameraProvider()]
        }
    }
    
    /*
    func setupCameraSession() {
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) as AVCaptureDevice
        let captureDevice = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo)
        do {
            let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
            
            cameraSession.beginConfiguration()
            
            if (cameraSession.canAddInput(deviceInput) == true) {
                cameraSession.addInput(deviceInput)
            }
            
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString) : NSNumber(value: kCVPixelFormatType_420YpCbCr8BiPlanarFullRange as UInt32)]
            dataOutput.alwaysDiscardsLateVideoFrames = true
            
            if (cameraSession.canAddOutput(dataOutput) == true) {
                cameraSession.addOutput(dataOutput)
            }
            
            cameraSession.commitConfiguration()
            
            let queue = DispatchQueue(label: "com.invasivecode.videoQueue")
            dataOutput.setSampleBufferDelegate(self, queue: queue)
            
        }
        catch let error as NSError {
            NSLog("\(error), \(error.localizedDescription)")
        }
    }
 */
}
