//
//  ActiveApplicationsWindow.swift
//  fortyTwo-Menu
//
//  Created by Dr. Gernot Starke on 12.10.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Cocoa

class ActiveApplicationsWindow: NSWindowController  {

    var runningApplications: [RunningApplication]
    
    init(windowNibName: String ) {
        
        super.init( windowNibName: "ActiveApplicationsWindow")
        
        let ra1 = RunningApplication(name: "Firefox", icon: nil, memoryUsed: 10011)
        let ra2 = RunningApplication(name: "IntelliJ", icon: nil, memoryUsed: 20043 )
        self.runningApplications = [ra1, ra2]
    }
    
    override init(window: NSWindow!)
    {
        super.init(window: window)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
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
        return "Active Applications and their Memory Usage"
    }
    
}

    extension ActiveApplicationsWindow: NSTableViewDataSource {
        
        // should be
        func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
            return self.runningApplications.count
        }
        
        func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
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

