//
//  StartViewModel.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 19/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import Foundation

class StartViewModel: ObservableObject {
    
    @Published var vehicles = [Vehicle]()
    
    private let persistenceService: PersistenceServiceProtocol
    
    init(persistenceService: PersistenceServiceProtocol) {
        self.persistenceService = persistenceService
    }
    
    func fetchVehicles() {
        do {
            vehicles.removeAll() //refresh the vehicles list
            vehicles += try persistenceService.fetchVehicles()
        } catch {
            print("ERROR StartViewModel fetchVehicles")
        }
        
    }
}
