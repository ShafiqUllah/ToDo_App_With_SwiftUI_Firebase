//
//  ProfileView.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                }else{
                    Text("Loading profile ....")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user:User) ->some View {
        //Avater image
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio( contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125, alignment: .center)
        
        // User info like name,email member since,
        
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                Text(user.name)
            }
            .padding()
            
            HStack{
                Text("Email: ")
                Text(user.email)
            }
            .padding()
            
            HStack{
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        
        
        //Sign out button
        TLButton(title: "Log out", color: .red){
            viewModel.logout()
        }
        
        Spacer()
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
