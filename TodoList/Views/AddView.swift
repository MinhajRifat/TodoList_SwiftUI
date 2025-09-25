import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode // for go back from add more items
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showwAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Write your task...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color (UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Button(action:{
                    saveButtonPressed()
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
        .navigationTitle("Add more items 🖊️")
        .alert(isPresented: $showwAlert, content: getAlert)
    }
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addNewItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            showwAlert.toggle()
            alertTitle = "You task character must be atleast 3"
            return false
        }else{
            return true
        }
    }
    
    func getAlert() -> Alert{
        
        return Alert(title: Text (alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()

    }
    .environmentObject(ListViewModel())
}
