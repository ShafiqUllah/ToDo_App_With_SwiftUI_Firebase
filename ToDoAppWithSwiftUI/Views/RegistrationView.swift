//
//  RegistrationView.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewViewModel()
    
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register", subTitle: "Start orginizing today", angle: -15, backgroundColor: .orange, offset: CGSize(width: 0, height: -190))
            
            
            // Body or Form
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                    
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $viewModel.password)
                
                TLButton(title: "Create Account", color: .green){
                    // Action here
                    viewModel.register()
                    
                }
                
            }
            .offset(y:-15)
            
            
            Spacer()
        }
        
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
