//
//  WindowController.swift
//  Object Methology
//
//  Created by Timofey on 9/28/17.
//  Copyright © 2017 NFO. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    @IBOutlet weak var segmentedControl: NSSegmentedControl!

    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.isOpaque = false
        window?.backgroundColor = NSColor(colorLiteralRed: 216, green: 216, blue: 216, alpha: 0.9)
        
        contentViewController = firstVC
    }
    
    let firstVC: NSViewController = {
        let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "firstVC") as! NSViewController
        return vc
    }()
    
    let secondVC: NSViewController = {
        let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "secondVC") as! NSViewController
        return vc
    }()

    @IBAction func click(_ sender: Any) {
        let vc: NSViewController
        switch segmentedControl.selectedSegment {
        case 0:
            vc = firstVC
        case 1:
            vc = secondVC
        default: fatalError()
        }
        contentViewController = vc
    }
    
}
