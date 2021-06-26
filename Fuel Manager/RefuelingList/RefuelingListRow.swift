//
//  RefuelingListRow.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 09/06/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct RefuelingListRow: View {
    
    private let refueling: Refueling
    
    init(refueling: Refueling) {
        self.refueling = refueling
    }
    
    var body: some View {
        VStack {
            Text(refueling.date)
            .frame(width: 200, height: 30, alignment: .leading)
            
            Text("\(String(format: "%.2f", refueling.fuelCost)) zł/l")
                .padding(.top, 5)
                .frame(width: 200, height: 30, alignment: .leading)
            
            Text("\(refueling.capacity) l")
            .padding(.top, 5)
                .padding(.bottom, 5)
                .frame(width: 200, height: 30, alignment: .leading)
        }
    }
}
