
import SwiftUI

struct NoItemsView: View {
    @State var animate:Bool = false
    let secondaryColor = Color("SecondaryColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("If you are trying to search for something, please try again with different keywords. If you think this is a bug, please contact us.")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(),
                    label:{
                        Text("Add Item")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.red : Color.accentColor)
                            .cornerRadius(25)
                    })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryColor.opacity(0.7) : Color.accentColor,
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -10 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        //If animate is false then call animation elements because we do not want to call this to open multiple time
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView{
        NoItemsView()
            .navigationTitle("Title")

    }
}
