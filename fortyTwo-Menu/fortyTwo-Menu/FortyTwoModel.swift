//
//  FortyTwoModel.swift
//  fortyTwo-Menu
//
//  Created by Dr. Gernot Starke on 10.10.15.
//  Copyright © 2015 Dr. Gernot Starke. All rights reserved.
//

import Foundation


class FortyTwoModel {
    
    let networkModel = NetworkModel()
    let memoryModel = MemoryModel()
    
    
    func getCurrentIPAddress() -> String {
        return networkModel.getIPAddressAsString()
    }
    
    
    
}