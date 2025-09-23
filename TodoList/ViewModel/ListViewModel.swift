import Foundation
//CRUD function
class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "This is the first item!", isCompleted: false),
            ItemModel(title: "This is the second item!", isCompleted: true),
            ItemModel(title: "This is the third item!", isCompleted: false)
        ]
        //put data from function into items
        items.append(contentsOf: newItems)

    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addNewItem(title: String){
        let newItem = ItemModel (title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){

      if let index = items.firstIndex(where: { $0.id == item.id }){   // Select which item want to update
            items[index] = item.updateIsCompletion()
        }
    }
}
