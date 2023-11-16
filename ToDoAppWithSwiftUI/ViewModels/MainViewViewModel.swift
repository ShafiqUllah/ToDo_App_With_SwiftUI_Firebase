//
//  MainViewViewModel.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import Foundation
import FirebaseAuth

class MainViewViewModel:ObservableObject{
    @Published var currentUserId:String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in // we can use auth as _ because it never used
            
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }
    
    public var isSignedIn:Bool {
        if Auth.auth().currentUser != nil{
            return true
        }
            
        return false
    }
}
