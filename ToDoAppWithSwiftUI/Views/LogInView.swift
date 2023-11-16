//
//  LogInView.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import SwiftUI

struct LogInView: View {
    
    @StateObject var viewModel = LogInViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do App", subTitle: "Time to be active", angle: 15, backgroundColor: .pink,offset: CGSize(width: 0, height: -190))
                
                //Login form
                
                Form{
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email address", text: $viewModel.email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.roundedBorder)
                    
                    TLButton(title: "Log in", color: .blue){
                        viewModel.login()
                    }
                        
                }.offset(y: -90)
                
                
                //create account
                
                VStack{
                    Text("Don't have an account?")
                    
                    
                    // new account action logic goes here
                    NavigationLink(destination: RegistrationView(), label:{
                        VStack {
                            Text("Create An account")
                        }
                    })
                    
                }
                
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
