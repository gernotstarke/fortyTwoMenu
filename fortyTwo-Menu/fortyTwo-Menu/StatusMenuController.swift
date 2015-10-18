//
//  StatusMenuController.swift
//  fortyTwo-Menu
//
//  Created by Dr. Gernot Starke on 10.10.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject, ActiveAppicationsWindowDelegate {
    @IBOutlet weak var statusMenu: NSMenu!
    
    var appMemoryWindow: ActiveApplicationsWindow!
    
    let fortyTwoModel: FortyTwoModel

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
 
    override init() {
        fortyTwoModel = FortyTwoModel()
        
    }
    
    // arc42 logo is displayed in a custom-View.
    @IBOutlet weak var arc42View: Arc42View!
    var arc42MenuItem: NSMenuItem!
    
    
    @IBAction func memoryConsumptionAction(sender: NSMenuItem) {
        //appMemoryWindow.runningApplications
        
        let activeApps = NSWorkspace.sharedWorkspace().runningApplications

       appMemoryWindow.showWindow(nil)
        
    }
    
    /**************************
    get list of active applications
    **************************/
    func getActiveApplications() {
        NSLog("getActiveApplications() called...")
    }
    
    
    // Current IP address
    @IBOutlet weak var currentIPAddress: NSMenuItem!

    
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
        
        // ******* fortyTwo Model instance *******
        
        // ******* arc42 logo  ***********
        arc42MenuItem = statusMenu.itemWithTitle("arc42")
        arc42MenuItem.view = arc42View
        arc42View.setArc42Logo()
        
        // ******* memory consumption table ***********
        //memoryConsumptionMenuItem = statusMenu.itemWithTitle("memoryConsumptionTable")
        //memoryConsumptionMenuItem.view = memoryConsumptionView
        
        appMemoryWindow = ActiveApplicationsWindow()
        appMemoryWindow.delegate = self
        
        // ******* IP and network stuff ***********
        setCurrentIPAddress()
    
        
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

    /*************
    set current IP address
    *************/
    func setCurrentIPAddress() {
        currentIPAddress.title = fortyTwoModel.getCurrentIPAddress()
    }
    
    
}