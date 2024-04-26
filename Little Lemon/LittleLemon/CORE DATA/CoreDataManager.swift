//
//  CoreDataManager.swift
//  M4Exercise
//
//  Created by Sofia Shchukina on 29.07.2023.
//

import Foundation
import CoreData

/// A singleton class responsible for managing Core Data operations related to dishes.

final class CoreDataManager {

    static var shared = CoreDataManager()

    private func dishExists(withName name: String, in context: NSManagedObjectContext) -> Bool {
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Error if dish exists: \(error)")
            return false
        }
    }

    func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for menuItem in menuItems {
            let name = menuItem.title
            let price = menuItem.price

            //Check if dish with the same name already exists
            if dishExists(withName: name, in: context) {
                continue
            }

            //Create a new dish object
            let dish = Dish(context: context)
            dish.name = name
            dish.price = price

            //Save the context to persist the changes
            do {
                try context.save()
            } catch {
                print("Error creating dish: \(error)")
            }
        }
    }

    func getDishes(context: NSManagedObjectContext) -> [Dish] {
        let request = Dish.fetchRequest() //FetchRequest(entity: Dish.entity(), sortDescriptors: [], predicate: [])
        do {
            let dishes = try context.fetch(request)
            return dishes
        } catch {
            print("Unable to Fetch dishes, (\(error))")
            return []
        }
    }

}

