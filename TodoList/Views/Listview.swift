
import SwiftUI

struct Listview: View {

    @EnvironmentObject var listViewModel: ListViewModel
    

    
    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation{
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            //dlt function to delete items in the list
            .onDelete(perform: listViewModel.deleteItem)
            //onMove function to sort usind slide
            .onMove(perform: listViewModel.moveItem)
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
    .environmentObject(ListViewModel())
}


