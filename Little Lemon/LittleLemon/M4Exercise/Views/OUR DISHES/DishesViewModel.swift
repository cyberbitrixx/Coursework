//
//  DishesViewModel.swift
//  M4Exercise
//
//  Created by Sofia Shchukina on 29.07.2023.
//

import Foundation
import CoreData

/// A view model for displaying details of a dish.
class DishViewModel: ObservableObject, Identifiable {
    var name: String
    var price: String

    init(from bdModel: Dish) {
        self.name = bdModel.name ?? ""
        self.price = bdModel.price
    }

    func formatPrice() -> String {
        let floatValue = Float(price) ?? 0.0
        let spacing = floatValue < 10 ? " " : ""
        return "$ " + spacing + String(format: "%.2f", floatValue)
    }
}

@MainActor
class OurDishesViewModel: ObservableObject {
    @Published var menuItems = [DishViewModel]()

    func prepareData(refresh: Bool, coreDataContext: NSManagedObjectContext) async {
        if refresh {
            let dishes = await ServerManager.shared.getDishes()
            CoreDataManager.shared.createDishesFrom(menuItems: dishes, coreDataContext)
            let dishesFromDB = CoreDataManager.shared.getDishes(context: coreDataContext)
            let dishesVM = dishesFromDB.map( { DishViewModel(from: $0)})
            self.menuItems = dishesVM
        } else {
            let dishesFromDB = CoreDataManager.shared.getDishes(context: coreDataContext)
            let dishesVM = dishesFromDB.map( { DishViewModel(from: $0)})
            self.menuItems = dishesVM
        }
    }
}
