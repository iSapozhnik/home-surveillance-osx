//
//  HomeViewController.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 22/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import Cocoa
import AVFoundation

class HomeViewController: NSViewController {
    
    let player = AVQueuePlayer()
    
    @IBOutlet weak var providersPopUp: NSPopUpButton!
    
    @IBOutlet weak var previewView: PreviewView!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        //previewView.layer?.backgroundColor = NSColor.black.cgColor
        
        let provider = SignalProvider()
        let providerItem = provider.allProviders().first
        if let providerItem = providerItem {
            providerItem.startPreview(forView: previewView)
        }
        
        provider.startMonitoring { [unowned self] (provider) in
            self.updatePopUpMenu(withProvider: provider)
        }
        
        updatePopUpMenu(withProvider: provider)
    }
    
    @IBAction func onChangeProvider(_ sender: Any) {
        player.pause()
        let index = providersPopUp.indexOfSelectedItem
        let provider = SignalProvider().allProviders()[index]
        provider.startPreview(forView: previewView)
    }
    
    fileprivate func startPreview(withProvider provider: SignalProviderItem) {
    
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let fileURL = NSURL(string: "http://nasatv-lh.akamaihd.net/i/NASA_101@319270/master.m3u8")
        let avAsset = AVURLAsset(url: fileURL! as URL, options: nil)
        
        let playerItem = AVPlayerItem(asset: avAsset)
        //AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
        let layer = AVPlayerLayer.init(player: player)
        layer.frame = previewView.bounds

        if player.items().contains(playerItem) {
            player.play()
        } else {
            player.insert(playerItem, after: nil)
            previewView.layer = nil
            previewView.player = player
            previewView.layer = layer

        //videoPlayer = AVPlayer(playerItem: playerItem)
        //previewView.player = videoPlayer
            player.play()
        }
    }
    
    fileprivate func updatePopUpMenu(withProvider provider: SignalProvider) {
        player.pause()
        let providers = provider.allProviders()
        providersPopUp.removeAllItems()
        
        for providerItem in providers {
            providersPopUp.addItem(withTitle: providerItem.name())
        }
    }
}
