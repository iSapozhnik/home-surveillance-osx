//
//  PreviewView.swift
//  HomeSurveillance
//
//  Created by Ivan Sapozhnik on 3/23/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import Cocoa
import AVFoundation

/// A simple `NSView` subclass that is backed by an `AVPlayerLayer` layer.

class PreviewView: NSView {

    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        
        set {
            playerLayer.player = newValue
        }
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
//    override class var layerClass: AnyClass {
//        return AVPlayerLayer.self
//    }
    
}
