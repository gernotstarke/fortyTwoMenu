//
//  AppDelegate.swift
//  fortyTwo-Menu
//
//  Created by Dr. Gernot Starke on 10.10.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    
    
    @IBAction func quitAction(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)

    }
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        statusItem.menu = statusMenu
        
        setIcon()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
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

