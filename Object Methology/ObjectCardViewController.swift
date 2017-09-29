//
//  ObjectCardViewController.swift
//  Object Methology
//
//  Created by Timofey on 9/29/17.
//  Copyright © 2017 NFO. All rights reserved.
//

import Cocoa

class ObjectCardViewController: NSViewController, ObjectViewTarget {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    func publish(objectView: NSView) {
        view.subviews.forEach{ $0.removeFromSuperview() }
        view.addSubview(objectView)
        objectView.frame = view.frame
    }
    
}
