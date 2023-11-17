//
//  ToDoListItemViewViewModel.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject{
    init(){
        
    }
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
    
    deinit {
        print("Deallocation called for ToDoListItemViewViewModel")
    }
}
