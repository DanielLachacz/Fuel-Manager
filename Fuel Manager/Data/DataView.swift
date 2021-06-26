//
//  DataView.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 25/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct DataView: View {
    
    var vehicle: Vehicle
    @State var showSheetView = false
    var addRefuelingViewModel: AddRefuelingViewModel
    @ObservedObject var viewModel: DataViewModel

    
    var body: some View {
        
        VStack() {
            
            VStack(alignment: .leading) {
                
                Text(vehicle.name)
                    .font(.system(size: 24))
                    .bold()
                    .frame(width: 380, height: 60, alignment: .topLeading)
                    .padding(.top, -20)
                    .padding(.leading, 10)
                    .onAppear {
                        self.viewModel.vehicle = self.vehicle.name
                        self.viewModel.calculateAvarageFuelConsumption()
                        self.viewModel.calculateAverageTravelExpenses()
                }
                
                HStack {
                    
                Text("Średnio")
                    .padding(.horizontal, 15)
                    .frame(width: 120)

                    Spacer()

                    Text("Ostatnio")
                        .padding(.trailing, 15)
                    .frame(width: 120)
                }

                HStack {

                    Text("\(String(format: "%.2f", viewModel.averageFuelConsumption))")
                        .multilineTextAlignment(.center)
                        .padding()
                    .frame(width: 100, height: 100)
                        .background(Circle().fill(Color.blue).shadow(radius: 2))
                        .font(.system(size: 21))
                        .foregroundColor(.white)

                    Spacer()

                    Text("SPALANIE")
                        .font(.system(size: 20))

                    Spacer()

                    Text("0,00") //TODO
                        .multilineTextAlignment(.center)
                        .padding()
                    .frame(width: 100, height: 100)
                    .background(Circle().fill(Color.green).shadow(radius: 2))
                    .font(.system(size: 21))
                        .foregroundColor(.white)
                }
                .padding(.all, 10)
               
                HStack {

                Text("L/100km")
                    .padding(.horizontal, 15)
                    .frame(width: 120)

                    Spacer()

                    Text("L/100km")
                        .padding(.trailing, 15)
                    .frame(width: 120)
                }

               HStack {

                Text("Średnio")
                    .padding(.horizontal, 15)
                    .frame(width: 120)

                    Spacer()

                    Text("Ostatnio")
                        .padding(.trailing, 15)
                    .frame(width: 120)
                }
                .padding(.top, 30)
                
                HStack {

                    Text("\(String(format: "%.2f", viewModel.averageTravelExpenses))")
                        .multilineTextAlignment(.center)
                        .padding()
                    .frame(width: 100, height: 100)
                        .background(Circle().fill(Color.blue).shadow(radius: 2))
                        .font(.system(size: 21))
                        .foregroundColor(.white)

                    Spacer()

                    Text("KOSZT PODRÓŻY")
                        .font(.system(size: 20))

                    Spacer()

                    Text("0,00") //TODO
                        .multilineTextAlignment(.center)
                        .padding()
                    .frame(width: 100, height: 100)
                    .background(Circle().fill(Color.green).shadow(radius: 2))
                    .font(.system(size: 21))
                        .foregroundColor(.white)
                }
                .padding(.all, 10)
                
                HStack {

                Text("zł/km")
                    .padding(.horizontal, 15)
                    .frame(width: 120)

                    Spacer()

                    Text("zł/km")
                        .padding(.trailing, 15)
                    .frame(width: 120)
                }
        
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
            Button(action: {
                self.showSheetView.toggle()
            }, label: {
                
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .background(Color.blue)
                .clipShape(Circle())
                    .foregroundColor(.white)
            })
                .sheet(isPresented: $showSheetView) {
                    AddRefuelingView(viewModel: self.addRefuelingViewModel, vehicle: self.vehicle)
            }
            .padding()
            .shadow(radius: 2)
            }
            .foregroundColor(.gray)
                
            }
        
        }
    }
    
}



