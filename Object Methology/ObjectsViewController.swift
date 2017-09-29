//
//  ObjectsViewController.swift
//  Object Methology
//
//  Created by Timofey on 9/29/17.
//  Copyright © 2017 NFO. All rights reserved.
//

import Cocoa

class ObjectsViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var tableView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.headerView = NSTableHeaderView(frame: .zero)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        return tableView.make(withIdentifier: "ObjectCell", owner: nil)
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 40
    }
    
}
