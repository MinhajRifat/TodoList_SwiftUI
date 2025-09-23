import Foundation
//CRUD function
class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = [] {
        didSet{//Whenever items will be update didset func will be called
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "This is the first item!", isCompleted: false),
//            ItemModel(title: "This is the second item!", isCompleted: true),
//            ItemModel(title: "This is the third item!", isCompleted: false)
//            
//        ]
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)

        else{ return }
        //put data from function into items
       // items.append(contentsOf: newItems)
        self.items = savedItems

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
    
    func saveItems () {
        if let encodedData = try? JSONEncoder().encode(items){
            
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
