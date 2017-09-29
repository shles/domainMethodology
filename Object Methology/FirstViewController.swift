//
//  FirstViewController.swift
//  Object Methology
//
//  Created by Timofey on 9/29/17.
//  Copyright © 2017 NFO. All rights reserved.
//

import Cocoa

class FirstViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        
        childViewControllers
            .flatMap{ $0 as? ObjectsViewController }
            .first!
            .objectViewTarget = childViewControllers
                .flatMap{ $0 as? ObjectCardViewController }
                .first!
    }
    
}
