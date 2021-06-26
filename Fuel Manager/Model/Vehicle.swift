//
//  Vehicle.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 20/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import Foundation
import RealmSwift

class Vehicle: Object, Identifiable {
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var tankCapacity: Int = 0
    @objc dynamic var mileage: Int = 0
    var values = List<Refueling>()
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(name: String, tankCapacity: Int, mileage: Int) {
        self.init()
        self.name = name
        self.tankCapacity = tankCapacity
        self.mileage = mileage
    }
    
}
