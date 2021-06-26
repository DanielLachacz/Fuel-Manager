//
//  AddVehicleView.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 21/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct AddVehicleView: View {
    
    @ObservedObject var viewModel: AddVehicleViewModel
    @State private var selected = 0
    @State private var showingAlert = false
    
    init(viewModel: AddVehicleViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance()
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Dodaj nowy pojazd")
                .font(.system(size: 26, weight: .medium))
                .padding(.top, -30)
                .padding(.leading, 20)
            
            VStack {
                
                TextField("Marka/Model etc", text: $viewModel.name)
                    .padding(.top, 10)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .font(.system(size: 20))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Przebieg", text: $viewModel.mileage)
                    .padding(.top, 30)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .font(.system(size: 20))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Pojemność baku w litrach", text: $viewModel.tankCapacity)
                    .padding(.top, 30)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .font(.system(size: 20))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Form {
                    Section {
                        Picker("Paliwo", selection: $viewModel.fuelType) {
                            ForEach(0 ..< viewModel.fuels.count) {
                                Text(self.viewModel.fuels[$0]).tag($0)
                                    .padding(.leading, 5)
                                    .padding(.trailing, 5)
                            }
                        }
                    }
                }
                .padding(.leading, 5)
                .padding(.trailing, 5)
                
                Button("Dodaj") {
                    if self.viewModel.name.isEmpty && self.viewModel.tankCapacity.isEmpty && self.viewModel.mileage.isEmpty {
                        self.showingAlert = true
                    }
                    else {
                        self.viewModel.saveVehicle()
                        self.viewModel.name = ""
                        self.viewModel.tankCapacity = ""
                        self.viewModel.mileage = ""
                    }
                    
                }
                .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .font(.system(size: 20, design: .default))
                    .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(.top, -350)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Uwaga!"), message: Text("Wypełnij pola"))
                }
            }
            Spacer()
            
        }
    }
}

