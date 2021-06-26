//
//  RefuelingListView.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 25/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct RefuelingListView: View {
    
    @ObservedObject var viewModel: RefuelingListViewModel
    var vehicle: Vehicle
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(vehicle.name)
            .font(.system(size: 24))
            .bold()
            .frame(width: 380, height: 60, alignment: .topLeading)
            .padding(.top, -20)
            .padding(.leading, 10)
                .onAppear {
                    self.viewModel.vehicle = self.vehicle.name
            }
        
        List(viewModel.refuelings) { refueling in
            RefuelingListRow(refueling: refueling)
        }
        .onAppear(perform: {
           // UITableView.appearance()//.separatorStyle = .none
            self.viewModel.fetchRefuelings()
        })
        }
    }
}

