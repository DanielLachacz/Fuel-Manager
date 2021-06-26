//
//  StartRow.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 19/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct StartRow: View {
    
    private let vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    var body: some View {
        VStack {
            
            Text(vehicle.name)
                .font(.system(size: 23))
                .padding(.top, 20)
        
        }
    }
}
