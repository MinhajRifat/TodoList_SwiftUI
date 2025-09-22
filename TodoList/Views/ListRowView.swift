import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack{
            //If task is complete tick if not only circle
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
            //if complete color will be green
                .foregroundColor(item.isCompleted ? Color.green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.headline)
        .padding(.vertical, 8)
    }
}

#Preview {
    var item1: ItemModel = ItemModel(title: "Test", isCompleted: false)
    var item2: ItemModel = ItemModel(title: "Test2", isCompleted: true)
    
    Group{
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
    //ListRowView(item.title)
}
