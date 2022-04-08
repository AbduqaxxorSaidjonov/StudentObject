//
//  TaskCell.swift
//  StudentObject
//
//  Created by Abduqaxxor on 8/4/22.
//

import SwiftUI

struct TaskCell: View {
    
    var task: Task
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading,spacing: 20){
                HStack{
                    Text(task.firstname!).fontWeight(.bold)
                    Text(task.lastname!).fontWeight(.bold)
                }
                HStack(spacing: 20){
                    Text(task.phoneNumber!)
                    Text("|")
                    Text(task.email!)
                }
                Text(task.address!)
            }
            Spacer()
            Text(task.gender!).foregroundColor(.red)
        }.padding(.top,10).padding(.bottom,10)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task())
    }
}
