//
//  FirstViewController.swift
//  Object Methology
//
//  Created by Timofey on 9/29/17.
//  Copyright © 2017 NFO. All rights reserved.
//

import Cocoa

class FirstViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.blue.cgColor
    }
    
}