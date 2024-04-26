//
// DisplayDish.swift



import SwiftUI


/// A view for displaying details of a dish.
struct DisplayDish: View {
    @ObservedObject private var dish: DishViewModel
    init(_ dish:DishViewModel) {
        self.dish = dish
    }
    
    
    var body: some View {        
        HStack {
//            Text("test")
            Text(dish.name )
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
            Text("\(dish.formatPrice())")
                .font(.callout)
                .foregroundColor(.primary)
                .fixedSize(horizontal: true, vertical: false)
                .frame(minWidth: 0, maxWidth: 50, alignment: .trailing)
                .lineLimit(1)
                .padding(.leading)
                .layoutPriority(1)
        }
        .contentShape(Rectangle()) // keep this code
    }
}

struct DisplayDish_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        DisplayDish(oneDish())
    }
    static func oneDish() -> DishViewModel {
        let dish = DishViewModel(from: Dish(context: context))
        dish.name = "Hummus"
        dish.price = "10"
        return dish
    }
}

