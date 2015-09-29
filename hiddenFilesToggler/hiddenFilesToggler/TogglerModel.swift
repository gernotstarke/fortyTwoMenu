//
//  TogglerModel.swift
//  hiddenFilesToggler
//
//  Created by Dr. Gernot Starke on 28.09.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Foundation

class TogglerModel {
    
//    enum BoolToState {
//        case true {
//            state: "On", boolName: "Yes"}
//        case false: {state: "Off", boolName: "No"}
//    }
    
    init() {
        showAllFilesState = false
    }
    
    var showAllFilesState: Bool
    
    let menuItemPrefix = "Toggle hidden files (currently:"
    var menuItemText: String {
        get {
           return "\(menuItemPrefix) \(translateBoolToState(showAllFilesState)))"
        }
    }
    
    
    // uses the default-binary to determine the current state
    // as it takes rather long, we try to do it only once,
    // and later on manage this state ourself.
    func determineInitialShowAllFilesState() -> Bool {
        return false
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
