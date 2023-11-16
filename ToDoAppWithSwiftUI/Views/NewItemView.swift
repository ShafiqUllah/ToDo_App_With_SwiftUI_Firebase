//
//  NewItemView.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject private var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented:Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 100)
            
            Form{
                // title
                TextField("Title", text: $viewModel.title)
                
                
                // due date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                
                // button
                TLButton(title: "Save", color: .pink){
                    //button action
                    if viewModel.canSave {
                        viewModel.saveItem()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                    
                    
                }
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Erorr"), message: Text("Please fill all the field"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
