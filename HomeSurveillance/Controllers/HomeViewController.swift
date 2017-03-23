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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let provider = SignalProvider()
        provider.startMonitoring { (provider) in
            self.updatePopUpMenu(withProvider: provider)
        }
        updatePopUpMenu(withProvider: provider)
        
    }
    
    fileprivate func updatePopUpMenu(withProvider provider: SignalProvider) {
        let providers = provider.allProviders()
        providersPopUp.removeAllItems()
        
        for providerItem in providers {
            providersPopUp.addItem(withTitle: providerItem.name())
        }
    }
}
