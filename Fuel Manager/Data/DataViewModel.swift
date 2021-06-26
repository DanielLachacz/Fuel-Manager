//
//  DataViewModel.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 22/06/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import Foundation

class DataViewModel: ObservableObject {
    
    @Published var vehicle = ""
    @Published var averageFuelConsumption = 0.0
    @Published var averageTravelExpenses = 0.0
    private let persistenceService: PersistenceServiceProtocol
    
    init(persistenceService: PersistenceServiceProtocol) {
        self.persistenceService = persistenceService
       // self.calculateAvarageFuelConsumption()
        //self.calculateAverageTravelExpenses()
    }
    
    func calculateAvarageFuelConsumption() {
        var refuelings = [Refueling]()
        refuelings.removeAll()
        do {
            refuelings += try
            persistenceService.fetchRefuelingsByVehicle(name: vehicle)
        } catch {
            print("ERROR DataViewModel calculateAvarageFuelConsumption")
        }
        
        let mileage = refuelings.map {$0.mileage}.reduce(0,+)
        let capacity = refuelings.map {$0.capacity}.reduce(0,+)
        
        averageFuelConsumption = 0.0
        averageFuelConsumption += Double(mileage) / Double(capacity)
        
        print("averageFuelConsumption: \( averageFuelConsumption)")
    }
    
    func calculateAverageTravelExpenses() {
        var refuelings = [Refueling]()
        refuelings.removeAll()
        do {
            refuelings += try
            persistenceService.fetchRefuelingsByVehicle(name: vehicle)
        } catch {
            print("ERROR DataViewModel calculateTravelExpenses")
        }
        
        let fuelCosts = refuelings.map {$0.fuelCost}.reduce(0,+)
        let mileage = refuelings.map {$0.mileage}.reduce(0,+)
        
        averageTravelExpenses = 0.0
        averageTravelExpenses += fuelCosts / Double(mileage)
        
        print("averageTravelExpenses \(averageTravelExpenses)")
    }
}
