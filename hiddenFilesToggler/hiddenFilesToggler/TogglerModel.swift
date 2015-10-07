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
    
    let statusOffIconName = "offStatusIcon"
    let statusOnIconName  = "onStatusIcon"
    
    
    let menuItemPrefix = "Toggle hidden files (currently:"
    var menuItemText: String {
        get {
            return "\(menuItemPrefix) \(translateBoolToState(showAllFilesState)))"
        }
    }
   
    // define an operating system task from which we can call
    // the "default" application
    private let defaultTask = NSTask()
    
    
    init() {
        // initialize
        defaultTask.launchPath = "/usr/bin/defaults"
        
        showAllFilesState = self.determineInitialShowAllFilesState()
    }
    
    
    //
    func currentIconName( currentState: Bool) -> String {
        switch currentState {
            case true: return statusOnIconName
            case false: return statusOffIconName
        }
    }
    
    // uses the "default" application to determine the current state
    // as it takes rather long, we try to do it only once,
    // and later on manage this state ourself.
    func determineInitialShowAllFilesState() -> Bool {
        // defaultTask expects array
        defaultTask.arguments = ["read", "com.apple.finder", "AppleShowAllFiles"]
 
        let pipe = NSPipe()
        defaultTask.standardOutput = pipe
        
        defaultTask.launch()
        defaultTask.waitUntilExit()

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
    
    
    func setShowAllFilesState(toState: Bool) {
        
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
