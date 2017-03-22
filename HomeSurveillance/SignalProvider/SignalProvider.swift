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
    
    func allProviders() -> [SignalProviderItem]? {

        let captureDevices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo)
        print("Found \(captureDevices?.count) devices")
        return [DefaultCameraProvider()]
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
