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

   
    // get reference to statusBar (aka menuBar)
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // statusIcon is the name of the imageSet in the Assets.xcassets folder
        let icon = NSImage(named: "statusIcon" )
        icon?.template = false
        //icon.setTemplate(true)
        
        statusItem.image = icon
        
        statusItem.menu = statusMenu
    }

    @IBAction func menuClicked(sender: NSMenuItem) {
        print("toggle hidden files clicked...")
        let task = NSTask()
        task.launchPath = "/usr/bin/defaults"
    }
    
}

