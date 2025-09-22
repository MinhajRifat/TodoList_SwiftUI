
import SwiftUI

struct Listview: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first item!", isCompleted: false),
        ItemModel(title: "This is the second item!", isCompleted: true),
        ItemModel(title: "This is the third item!", isCompleted: false)
    ]
    
    var body: some View {
        List{
            ForEach(items){ item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Todo List📝"))
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView()))
    }
}

#Preview {
    NavigationView{
        Listview()
    }
}


