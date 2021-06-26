//
//  DetailView.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 23/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var vehicle: Vehicle
    var addRefuelingViewModel: AddRefuelingViewModel
    var refuelingListViewModel: RefuelingListViewModel
    var dataViewModel: DataViewModel
    
    var body: some View {
        
        TabView {
            DataView(vehicle: vehicle, addRefuelingViewModel: addRefuelingViewModel, viewModel: dataViewModel)
            .tabItem {
                Text("Dane")
                Image(systemName: "folder")
                
            }
            
            RefuelingListView( viewModel: refuelingListViewModel, vehicle: vehicle)
                .tabItem {
                    Text("Wpisy")
                    Image(systemName: "list.bullet")
            }
        }
        .onAppear() {
            UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 16)], for: [])
        }
        
    }
}

