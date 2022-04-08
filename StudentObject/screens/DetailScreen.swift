//
//  DetailScreen.swift
//  StudentObject
//
//  Created by Abduqaxxor on 8/4/22.
//

import SwiftUI

struct DetailScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var address: String = ""
    @State var gender: String = ""
    let types = ["Male","Female"]
    
    func saveTask(firstname: String,lastname: String,phoneNumber: String,email: String,address: String,gender: String){
        let task = Task(context: self.moc)
        task.id = UUID()
        task.firstname = firstname
        task.lastname = lastname
        task.phoneNumber = phoneNumber
        task.email = email
        task.address = address
        task.gender = gender
        try? self.moc.save()
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Fistname",text: $firstname)
                    TextField("Lastname",text: $lastname)
                    Picker("Gender",selection: $gender){
                        ForEach(types, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    TextField("Phone Number",text: $phoneNumber)
                    TextField("Email",text: $email)
                    TextField("Address",text: $address)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                 saveTask(firstname: firstname, lastname: lastname, phoneNumber: phoneNumber, email: email, address: address, gender: gender)
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            })
            )
            .navigationBarTitle("Add Student",displayMode: .inline)
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
