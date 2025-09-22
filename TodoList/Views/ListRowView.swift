import SwiftUI

struct ListRowView: View {
    let title: String
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
        }
    }
}

#Preview {
    ListRowView(title: "This is first item")
}
