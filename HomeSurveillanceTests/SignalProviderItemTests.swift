//
//  SignalProviderItemTests.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 22/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import XCTest
import AVFoundation

@testable import HomeSurveillance

class SignalProviderItemTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreatingSignalProviderItem() {
        
        if let captureDevice = captureDevice() {
            let item = DefaultCameraProvider.provider(withCaptureDevice: captureDevice)
            XCTAssertNotNil(item, "Provider should not be nil")
        }
    }
    
    func testProviderHasName() {
        
        if let captureDevice = captureDevice() {
            let item = DefaultCameraProvider.provider(withCaptureDevice: captureDevice)
            XCTAssertNotNil(item, "Provider should not be nil")
            XCTAssertFalse(item.name().isEmpty, "Provider should return name")
        }
    }
    
    func testPreviewCanBeExecuted() {
        
        if let captureDevice = captureDevice() {
            let item = DefaultCameraProvider.provider(withCaptureDevice: captureDevice)
            XCTAssertNotNil(item, "Provider should not be nil")
            XCTAssertTrue(item.startPreview(), "Provider should be able to start capture")
        }
    }
    
    func captureDevice() -> AVCaptureDevice? {
        
        let captureDevices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo) as! [AVCaptureDevice]
        
        if !captureDevices.isEmpty {
        
            if let captureDevice = captureDevices.first {
                return captureDevice
            } else {
                return nil
            }
        
        } else {
        
            return nil
        }
    }
}
