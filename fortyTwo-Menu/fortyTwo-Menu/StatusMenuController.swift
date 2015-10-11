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
 
    
    // arc42 logo is displayed in a custom-View.
    @IBOutlet weak var arc42View: Arc42View!
    var arc42MenuItem: NSMenuItem!
    
    

    
    // preferences ...
    @IBAction func preferencesAction(sender: NSMenuItem) {
    }
    
    // quit the app
    // ************
    @IBAction func quitAction(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
    
    
    override func awakeFromNib() {
        statusItem.menu = statusMenu
        setIcon()
        
        arc42MenuItem = statusMenu.itemWithTitle("arc42")
        arc42MenuItem.view = arc42View
        arc42View.setArc42Logo()
    }
    
    
    /**************
    set menu bar icon
    ***************/
    func setIcon(  ) {
        let icon = NSImage(named: "menu42Icon")
        icon?.template = false
        
        statusItem.image = icon
        statusItem.menu = statusMenu
        
    }

}