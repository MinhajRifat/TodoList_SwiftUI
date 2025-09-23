import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                Listview()

            }
            .environmentObject(listViewModel)
            //Now list view model an as well as other views have access to this list view model
        }
    }
}
