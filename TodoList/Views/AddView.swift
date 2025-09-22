import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView{
            VStack{
                TextField("Write your task...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.gray.opacity(15/100))
                    .cornerRadius(10)
                Button(action:{
                    
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
                    .padding()
            }
        }
    }
}

#Preview {
    NavigationView{
        AddView()

    }
}
