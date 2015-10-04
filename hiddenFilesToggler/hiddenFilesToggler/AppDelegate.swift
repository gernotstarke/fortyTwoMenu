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

   
    var togglerModel = TogglerModel()
    
    // get reference to statusBar (aka menuBar)
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

    
    // after app launched, do the following:
    // 1.) set icon to either on/off
    // 2.) set appropriate menu text
    //
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        setIcon( togglerModel.showAllFilesState)
        
        
    }
    
    
    
    /**************
    set icon, in harmony with current setting
    ***************/
    func setIcon( currentState: Bool ) {
        
        let icon = NSImage(
            named: togglerModel.currentIconName( currentState ))
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
        let task = NSTask()
        task.launchPath = "/usr/bin/defaults"
        
        if (sender.state == NSOnState) {
            sender.state = NSOffState
            
            // task expects array
            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "NO"]
        }
        else {
            sender.state = NSOnState
            
            // task expects array
            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "YES"]
        }
        
        task.launch()
        task.waitUntilExit()
        
        let killFinderTask = NSTask()
        killFinderTask.launchPath = "usr/bin/killall"
        killFinderTask.arguments = ["Finder"]
        killFinderTask.launch()
    }
    
}

