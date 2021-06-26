//
//  AddRefuelingView.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 25/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct AddRefuelingView: View {
    
    @ObservedObject var viewModel: AddRefuelingViewModel
    @State private var showingAlert = false
    var vehicle: Vehicle
    
    init(viewModel: AddRefuelingViewModel, vehicle: Vehicle) {
        self.viewModel = viewModel
        self.vehicle = vehicle
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance()
    }
    
    var body: some View {
        
        VStack() {
            
            Form {
                Text("Dodaj tankowanie")
                    .font(.system(size: 30))
                    .bold()
                
                Text(vehicle.name)
                    .font(.system(size: 24))
                    .bold()
                    .frame(width: 380, height: 60, alignment: .topLeading)
                    .onAppear {
                        self.viewModel.vehicle = self.vehicle.name
                }
                
                DatePicker("Data", selection: $viewModel.date, displayedComponents: [.date])
                    .padding(.top, 10)
                
                TextField("Przebieg", text: $viewModel.mileage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Objętość", text: $viewModel.capacity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Koszt paliwa 0.0", text: $viewModel.fuelCost)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    
                    Spacer()
                    
                    Button("Dodaj") {
                        if (self.viewModel.mileage.isEmpty ||
                            self.viewModel.capacity.isEmpty ||
                            self.viewModel.fuelCost.isEmpty)
                            {
                            self.showingAlert = true
                        }
                        else {
                            self.viewModel.saveRefueling()
                            self.viewModel.mileage = ""
                            self.viewModel.capacity = ""
                            self.viewModel.fuelCost = ""
                            
                        }
                    }
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .font(.system(size: 20, design: .default))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 80)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Uwaga!"), message: Text("Wypełnij pola"))
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

