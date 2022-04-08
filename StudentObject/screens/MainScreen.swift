
import SwiftUI

struct MainScreen: View {
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) var tasks: FetchedResults<Task>
    @State var isModel: Bool = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks, id: \.id){task in
                    TaskCell(task: task)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.isModel = true
            }, label: {
                Text("Add")
            }).sheet(isPresented: $isModel, content: {
                DetailScreen()
            })
            )
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("Student List"),displayMode: .inline)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
