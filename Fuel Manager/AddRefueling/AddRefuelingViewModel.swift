//
//  AddRefuelingViewModel.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 06/06/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import Foundation

class AddRefuelingViewModel: ObservableObject {
    
    @Published var date = Date()
    @Published var vehicle = ""
    @Published var mileage = "" {
        didSet {
            mileageInt = Int(mileage) ?? 0
        }
    }
    private var mileageInt = 0
    
    @Published var capacity = "" {
        didSet {
            capacityInt = Int(capacity) ?? 0
        }
    }
    private var capacityInt = 0
    
    @Published var fuelCost = "" {
        didSet {
            fuelCostDouble = Double(fuelCost) ?? 0.0
        }
    }
    private var fuelCostDouble = 0.0
    private let persistenceService: PersistenceServiceProtocol
    
    init(persistenceService: PersistenceServiceProtocol) {
        self.persistenceService = persistenceService
    }
    
    func saveRefueling() {
    
        let formatingDate = getFormattedDate(date: Date(), format: "dd.MMM.yyyy")
        
        let refueling = Refueling(vehicle: vehicle, date: String(describing: formatingDate), capacity: capacityInt, fuelCost: fuelCostDouble, mileage: mileageInt)
        
        do {
            try self.persistenceService.addRefueling(refueling: refueling)
        }
        catch {
            print("Error AddRefuelingViewModel saveRefueling")
        }
      
    }
    
    func getFormattedDate(date: Date, format: String) -> String {
            let dateformat = DateFormatter()
            dateformat.dateFormat = format
            return dateformat.string(from: date)
    }
}
