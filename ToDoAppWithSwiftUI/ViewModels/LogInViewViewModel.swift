//
//  LogInViewViewModel.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import Foundation
import Firebase

class LogInViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login(){
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate()->Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty , !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "fill all the fileds!!!"
            return false
        }
        
        guard email.contains("@"), email.contains(".") else{
            errorMessage = "Enter valid email"
            return false
        }
        
        return true
    }
}
