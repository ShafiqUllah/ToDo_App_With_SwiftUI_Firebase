//
//  ToDoListViewViewModel.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import Foundation
import FirebaseFirestore


class ToDoListViewViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    private var userId : String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete ToDo list item
    /// - Parameter id: item id to delete
    func deleteItemBy(id:String){
        print("Delete button pressed")
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
