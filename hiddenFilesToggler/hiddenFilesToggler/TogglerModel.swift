//
//  TogglerModel.swift
//  hiddenFilesToggler
//
//  Created by Dr. Gernot Starke on 28.09.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Foundation

class TogglerModel {
    
    
    var showAllFilesState = false
    
    let systemBarIconName = "systemBarIcon"
    
    
    let menuItemPrefix = "Toggle hidden files (currently:"
    var menuItemText: String {
        get {
            return "\(menuItemPrefix) \(translateBoolToState(showAllFilesState)))"
        }
    }
   
    
    init() {
        // initialize
        
        showAllFilesState = self.determineInitialShowAllFilesState()
    }
    
    
    
    // uses the "default" application to determine the current state
    // as it takes rather long, we try to do it only once,
    // and later on manage this state ourself.
    func determineInitialShowAllFilesState() -> Bool {
        // define an operating system task from which we can call
        // the "default" application
        let task = NSTask()
        
        task.launchPath = "/usr/bin/defaults"
        
        
        // defaultTask expects array
        task.arguments = ["read", "com.apple.finder", "AppleShowAllFiles"]
 
        let pipe = NSPipe()
        task.standardOutput = pipe
        
        task.launch()
        task.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: NSString = NSString(data: data, encoding: NSUTF8StringEncoding)!
        
        let result: Bool
        
        //print(output)
        
        switch output {
            case "No":
                result = false
            
            case "Yes":
                result = true
            
            default:
                result = false
        }
        
        return result
    }
    
    
    
    
    func setShowAllFilesState() {
        let state: String
        
        switch showAllFilesState {
            case true: state = "YES"
            case false: state = "NO"
        }
        
        // define an operating system task from which we can call
        // the "default" application
        let task = NSTask()
        task.launchPath = "/usr/bin/defaults"
        
        // defaultTask expects array
        task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", state]
        
        task.launch()
        task.waitUntilExit()
        
        let killFinderTask = NSTask()
        killFinderTask.launchPath = "/usr/bin/killall"
        killFinderTask.arguments = ["Finder"]
        killFinderTask.launch()
        
        // now switch state...
        showAllFilesState = !showAllFilesState
 
    }
    
    // uses the ipconfig program to get the current ip address,
    // or "" if no lan/wlan is active
    func getIPAddressAsString() -> String {
        let task = NSTask()
        task.launchPath = "/usr/sbin/ipconfig"
        task.arguments = ["getifaddr", "en0"]
        
        let pipe = NSPipe()
        task.standardOutput = pipe
        
        task.launch()
        task.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        var output: String = NSString(data: data, encoding: NSUTF8StringEncoding) as String!

        if (output == "") {
            output = "no ip address assigned"
        }
        
        return output
    }
    
    func setMenuItemText() {
        
    }
    
    func translateBoolToState(bool: Bool) -> String {
        if bool {
            return  "On"
        }
        else {
            return "Off"
        }
    }
    
} // TogglerModel
