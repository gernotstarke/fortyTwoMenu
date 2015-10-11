//
//  RunningApplication.swift
//  fortyTwo-Menu
//
//  Created by Dr. Gernot Starke on 11.10.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

// RunningApplication represents one currently running application,
// with its name, icon and basic status information, like 
// current memory consumption, cpu usage
import Foundation
import Cocoa

class RunningApplication : NSObject {
    var name: String
    var icon: NSImage?
    var memoryUsed: Int
    
    override init() {
        self.name = ""
        self.memoryUsed = 0
    }
    
    init( name: String, icon: NSImage?, memoryUsed: Int) {
        self.name = name
        self.icon = icon
        self.memoryUsed = memoryUsed
    }
    
    func updateMemoryUsed( currentMemory: Int ) {
        memoryUsed = currentMemory
    }
    
}
