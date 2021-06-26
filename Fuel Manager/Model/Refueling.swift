//
//  Refueling.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 06/06/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import Foundation
import RealmSwift

class Refueling: Object, Identifiable {
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var vehicle: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var capacity: Int = 0
    @objc dynamic var fuelCost: Double = 0.0
    @objc dynamic var mileage: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(vehicle: String, date: String, capacity: Int, fuelCost: Double, mileage: Int) {
        self.init()
        self.vehicle = vehicle
        self.date = date
        self.capacity = capacity
        self.fuelCost = fuelCost
        self.mileage = mileage
    }
}
