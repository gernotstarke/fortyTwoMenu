//
//  AppDelegate.swift
//  hiddenFilesToggler
//
//  Created by Dr. Gernot Starke on 27.09.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var menuClicked: NSMenuItem!
    @IBOutlet weak var statusMenu: NSMenu!

    @IBOutlet weak var ipAddress: NSMenuItem!
   
    @IBOutlet weak var memory_1: NSMenuItem!
    @IBOutlet weak var memory_2: NSMenuItem!
    @IBOutlet weak var memory_3: NSMenuItem!
    
    var togglerModel = TogglerModel()
    
    // get reference to statusBar (aka menuBar)
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

    
    // after app launched, do the following:
    // 1.) set icon to either on/off
    // 2.) set appropriate menu text
    //
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        setIcon( togglerModel.showAllFilesState)
        
        memory_1.title = "calculating..."
        memory_2.title = "calculating..."
        memory_3.title = "calculating..."
        
        ipAddress.title = togglerModel.getIPAddressAsString()
        
        
    }
    
    
    
    /**************
    set icon, in harmony with current setting
    ***************/
    func setIcon( currentState: Bool ) {
        
        let icon = NSImage(
            named: togglerModel.systemBarIconName)
        icon?.template = false
        
        statusItem.image = icon
        statusItem.menu = statusMenu
    
    }
    
    // quit the application
    @IBAction func quitAction(sender: NSMenuItem) {
         NSApplication.sharedApplication().terminate(self)
    }

    @IBAction func menuClicked(sender: NSMenuItem) {
        print("toggle hidden files clicked...")
        togglerModel.setShowAllFilesState()
    }
    
}

