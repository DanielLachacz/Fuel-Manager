//
//  DataManager.swift
//  Fuel Manager
//
//  Created by Daniel Łachacz on 19/05/2021.
//  Copyright © 2021 Daniel Łachacz. All rights reserved.
//

import RealmSwift

enum RuntimeError: Error {
    
    case NoRealmSet
}

protocol PersistenceServiceProtocol {
    func fetchVehicles() throws -> Results<Vehicle>
    func fetchRefuelingsByVehicle(name: String) throws -> Results<Refueling>
    func addVehicle(vehicle: Vehicle) throws
    func addRefueling(refueling: Refueling) throws
}

final class PersistenceService: PersistenceServiceProtocol {
    
    var realm: Realm?
    
    func fetchVehicles() throws -> Results<Vehicle> {
        do {
        realm = try Realm()
            return realm!.objects(Vehicle.self)
        }
        catch {
            throw RuntimeError.NoRealmSet
        }
    }
    
    func fetchRefuelingsByVehicle(name: String) throws -> Results<Refueling> {
        do {
        realm = try Realm()
            return realm!.objects(Refueling.self).filter("vehicle == %@", name)
        }
        catch {
            throw RuntimeError.NoRealmSet
        }
    }
    
    func addVehicle(vehicle: Vehicle) throws {
        autoreleasepool {
            do {
                realm = try Realm()
                try realm!.write {
                    realm!.add(vehicle)
                }
            }
            catch RuntimeError.NoRealmSet
            {
                print("PERSISTENCE SERVICE: No Realm Database addVehicle")
            }
            catch let error as NSError
            {
                print(error.localizedDescription)
            }
        }
    }
    
    func addRefueling(refueling: Refueling) throws {
           autoreleasepool {
               do {
                   realm = try Realm()
                   try realm!.write {
                       realm!.add(refueling)
                   }
               }
               catch RuntimeError.NoRealmSet
               {
                   print("PERSISTENCE SERVICE: No Realm Database addRefueling")
               }
               catch let error as NSError
               {
                   print(error.localizedDescription)
               }
           }
       }
}
