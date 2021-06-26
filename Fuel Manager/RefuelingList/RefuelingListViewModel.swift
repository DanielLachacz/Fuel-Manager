//
//  RefuelingListViewModel.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 06/06/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import Foundation

class RefuelingListViewModel: ObservableObject {
    
    @Published var refuelings = [Refueling]()
    @Published var vehicle = ""
    
    private let persistenceService: PersistenceServiceProtocol
    
    init(persistenceService: PersistenceServiceProtocol) {
        self.persistenceService = persistenceService
    }
    
    func fetchRefuelings() {
        refuelings.removeAll()
        do {
            refuelings += try persistenceService.fetchRefuelingsByVehicle(name: vehicle)
        } catch {
            print("ERROR RefuelingListViewModel fetchRefuelings")
        }
    }
}
