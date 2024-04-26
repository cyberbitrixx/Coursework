import Foundation
import SwiftUI
import CoreData


/// A SwiftUI view that fetches objects from Core Data and displays them using a custom content view.
///
/// This view automatically fetches objects of type `T` from Core Data based on the provided predicate and sort descriptors,
/// and then renders them using the provided content view.
///
/// - Parameters:
///   - predicate: A predicate to filter the fetched objects.
///   - sortDescriptors: An array of sort descriptors to sort the fetched objects.
///   - content: A closure that constructs a view from an array of fetched objects.
struct FetchedObjects<T, Content>: View where T : NSManagedObject, Content : View {
    
  let content: ([T]) -> Content

  var request: FetchRequest<T>
  var results: FetchedResults<T> {
      request.wrappedValue
  }
    
  init(
    predicate: NSPredicate = NSPredicate(value: true),
    sortDescriptors: [NSSortDescriptor] = [],
    @ViewBuilder content: @escaping ([T]) -> Content
  ) {
    self.content = content
    self.request = FetchRequest(
      entity: T.entity(),
      sortDescriptors: sortDescriptors,
      predicate: predicate
    )
  }
  
  
  var body: some View {
    self.content(results.map { $0 })
  }
  
  
}
