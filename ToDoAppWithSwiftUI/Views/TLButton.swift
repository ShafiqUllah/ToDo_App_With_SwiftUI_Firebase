//
//  TLButton.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import SwiftUI

struct TLButton: View {
    var title: String
    var color: Color
    var action : ()->()
    
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            // Do UI staff here
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                    .frame(width: 300 , height: 80, alignment: .center)
                   
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    
                    
                
            }
            .aspectRatio( contentMode: .fit)
            .padding()
            
        })
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "title", color: .blue){
            // action here
        }
    }
}
