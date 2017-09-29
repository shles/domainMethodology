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
    
    var objectViewTarget: ObjectViewTarget?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.headerView = NSTableHeaderView(frame: .zero)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        var views = NSArray()
        _ = NSNib(nibNamed: "User", bundle: nil)?.instantiate(withOwner: nil, topLevelObjects: &views)
        objectViewTarget?.publish(objectView: views.filter{ $0 is NSView }[0] as! NSView)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.make(withIdentifier: "ObjectCell", owner: nil) as! TitlableCell
        cell.titleLabel.stringValue = {
            switch row {
            case 0: return "User"
            case 1: return "Car"
            case 2: return "Credit Card"
            case 3: return "Purchases"
            default: return "Hello world"
            }
        }()
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 30
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let nibName: String
        switch tableView.selectedRow {
        case 0:
            nibName = "User"
        case 1:
            nibName = "Car"
        case 2:
            nibName = "CreditCard"
        case 3:
            nibName = "Purchases"
        default:
            nibName = "User"
        }
        var views = NSArray()
        _ = NSNib(nibNamed: nibName, bundle: nil)?.instantiate(withOwner: nil, topLevelObjects: &views)
        objectViewTarget?.publish(objectView: views.filter{ $0 is NSView }[0] as! NSView)
    }
    
    
}
