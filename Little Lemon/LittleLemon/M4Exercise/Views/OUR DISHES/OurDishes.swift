import SwiftUI
import CoreData

/// A view displaying a list of dishes available for ordering.
struct OurDishes: View {
    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var dishesViewModel = OurDishesViewModel()
    @State private var showAlert = false
    @State var searchText = ""
    @State private var viewDidLoad = false
    
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.bottom, 10)
                .padding(.top, 50)
            
            Text ("Tap to order")
                .foregroundColor(.black)
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color("approvedYellow"))
                .cornerRadius(20)
            NavigationView {
                List {
                    ForEach(dishesViewModel.menuItems.filter { dishViewModel in
                        return searchText.isEmpty || dishViewModel.name.localizedCaseInsensitiveContains(searchText)
                    }.sorted { dishViewModel1, dishViewModel2 in
                        return dishViewModel1.name < dishViewModel2.name
                    }) { dishViewModel in
                        Button(action: {
                            showAlert.toggle()
                        }) {
                            DisplayDish(dishViewModel)
                        }
                    }
                }

                
            }.searchable(text: $searchText, prompt: "browse orders...")

            // runs when the view appears
                .task {
                    if viewDidLoad == false {
                        viewDidLoad = true
                        await dishesViewModel.prepareData(refresh: true, coreDataContext: viewContext)
                    } else {
                        await dishesViewModel.prepareData(refresh: false, coreDataContext: viewContext)
                    }
                }
                .padding(.top, -10)//

                .alert("Order placed, thanks!",
                       isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
            // makes the list background invisible, default is gray
                       .scrollContentBackground(.hidden)

        }
    }
    
    func buildPredicate(searchText: String) -> NSPredicate {
        guard !searchText.isEmpty else {
            return NSPredicate(value: true)
        }
        
        return NSPredicate(format: "name CONTAINS[cd] %@", searchText)
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "name", ascending: true)]
    }
    
    struct OurDishes_Previews: PreviewProvider {
        static var previews: some View {
            OurDishes()
        }
    }
    
}
