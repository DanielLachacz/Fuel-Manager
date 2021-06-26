//
//  AddVehicleViewModel.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 21/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import Foundation
import Combine

class AddVehicleViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var tankCapacity = "" {
        didSet {
            tankCapacityInt = Int(tankCapacity) ?? 0
        }
    }
    private var tankCapacityInt = 0
    @Published var mileage = "" {
        didSet {
            mileageInt = Int(mileage) ?? 0
        }
    }
    private var mileageInt = 0
    @Published var fuelType = 0
    @Published var fuels = ["Benzyna", "Olej napedowy"]
    
    private let persistenceService: PersistenceServiceProtocol
    
    init(persistenceService: PersistenceServiceProtocol) {
        self.persistenceService = persistenceService
    }
    
    func saveVehicle() {
        let vehicle = Vehicle(name: name,
                              tankCapacity: tankCapacityInt,
                              mileage: mileageInt)
        
        do {
            try self.persistenceService.addVehicle(vehicle: vehicle)
        }
        catch {
            print("ADDVEHICLEVIEWMODEL saveVehicle Error")
        }
    }
}
