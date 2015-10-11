//
//  StatusMenuController.swift
//  fortyTwo-Menu
//
//  Created by Dr. Gernot Starke on 10.10.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1) // NSVariableStatusItemLength
 
    
    // quit the app
    // ************
    @IBAction func quitAction(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
    
    override func awakeFromNib() {
        statusItem.menu = statusMenu
        setIcon()
    }
    
    
    /**************
    set icon
    ***************/
    func setIcon(  ) {
        
        let icon = NSImage(named: "menu42Icon")
        icon?.template = false
        
        
        statusItem.image = icon
        statusItem.menu = statusMenu
        
    }

}