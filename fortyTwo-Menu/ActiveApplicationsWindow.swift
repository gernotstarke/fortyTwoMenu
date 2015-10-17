//
//  ActiveApplicationsWindow.swift
//  fortyTwo-Menu
//
//  Created by Dr. Gernot Starke on 12.10.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Cocoa

protocol ActiveAppicationsWindowDelegate {
    func getActiveApplications()
}


class ActiveApplicationsWindow: NSWindowController, NSWindowDelegate  {

    var delegate: ActiveAppicationsWindowDelegate?

    var runningApplications = [RunningApplication(name: "Firefox", icon: nil, memoryUsed: 10011),
                            RunningApplication(name: "IntelliJ", icon: nil, memoryUsed: 20022)]
    
//    init() {
//        let ra1 = RunningApplication(name: "Firefox", icon: nil, memoryUsed: 10011)
//        let ra2 = RunningApplication(name: "IntelliJ", icon: nil, memoryUsed: 20043 )
//        self.runningApplications = [ra1, ra2]
//    }

    
    @IBAction func closeAppWindowAction(sender: NSButton) {
        self.close()
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activateIgnoringOtherApps(true)
        
        
        
    }
    
    func windowWillClose(notification: NSNotification) {
        NSLog("running applicatins: \(runningApplications)")
    }
    
    override var windowNibName : String! {
        return "ActiveApplicationsWindow"
    }
    
}

    extension ActiveApplicationsWindow: NSTableViewDataSource {
        
        
        func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
            //return 0
            return self.runningApplications.count
        }
        
        
        func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
            
            NSLog("func tableView called for row \(row)")
            
            let cellView: NSTableCellView =
            tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        
            if (tableColumn?.identifier == "appNameAndIcon") {
                let applicationInfo = self.runningApplications[row]
            
                cellView.imageView!.image = applicationInfo.icon
                cellView.textField!.stringValue = applicationInfo.name
            }
            
            return cellView
        }
  }

extension ActiveApplicationsWindow: NSTableViewDelegate {
    
}

