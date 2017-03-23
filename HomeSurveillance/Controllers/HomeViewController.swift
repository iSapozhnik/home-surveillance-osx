//
//  HomeViewController.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 22/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import Cocoa

class HomeViewController: NSViewController {

    @IBOutlet weak var providersPopUp: NSPopUpButton!
    
    @IBOutlet weak var previewView: PreviewView!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        previewView.layer?.backgroundColor = NSColor.black.cgColor
        
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
        let index = providersPopUp.indexOfSelectedItem
        let provider = SignalProvider().allProviders()[index]
        provider.startPreview(forView: previewView)
    }
    
    fileprivate func startPreview(withProvider provider: SignalProviderItem) {
    
    }
    
    fileprivate func updatePopUpMenu(withProvider provider: SignalProvider) {
        let providers = provider.allProviders()
        providersPopUp.removeAllItems()
        
        for providerItem in providers {
            providersPopUp.addItem(withTitle: providerItem.name())
        }
    }
}
