//
//  NetworkModel.swift
//  fortyTwo-Menu
//
//  Created by Dr. Gernot Starke on 11.10.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Foundation


class NetworkModel {
    
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
        var currentIP: String = NSString(data: data, encoding: NSUTF8StringEncoding) as String!
        
        if (currentIP == "") {
            currentIP = "no ip address assigned"
        }
        
        return currentIP
    }
    

}