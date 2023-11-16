//
//  ToDoListItemView.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel =  ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    init(item:ToDoListItem){
        self.item = item
        print(item)
    }
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .bold()
                    .font(.title)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item:item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "id", title: "title", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
    }
}
