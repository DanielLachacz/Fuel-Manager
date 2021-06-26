//
//  ContentView.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 18/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct StartView: View {
    
    @ObservedObject var viewModel: StartViewModel
    var addVehicleViewModel: AddVehicleViewModel
    var addRefuelingViewModel: AddRefuelingViewModel
    var refuelingListViewModel: RefuelingListViewModel
    var dataViewModel: DataViewModel
    @State private var showSheetView = false
    @State private var showDetailView = false
    
    var body: some View {
       
        NavigationView {
            
            List(viewModel.vehicles) { vehicle in
                NavigationLink(destination: DetailView(vehicle: vehicle, addRefuelingViewModel: self.addRefuelingViewModel, refuelingListViewModel: self.refuelingListViewModel, dataViewModel: self.dataViewModel)) {
                    StartRow(vehicle: vehicle)
                }
            }
            .navigationBarTitle("Pojazdy")
            .onAppear(perform: {
                UITableView.appearance().separatorStyle = .none
                self.viewModel.fetchVehicles()
            })
        .navigationBarItems(trailing:

            NavigationLink(destination: AddVehicleView(viewModel: addVehicleViewModel), label: {
                Text("+").font(.system(size: 43)) })

            )
        }
        
    }
}

