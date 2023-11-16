//
//  HeaderView.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var subTitle: String
    var angle: Double
    var backgroundColor: Color
    var offset:CGSize
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
                
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 50))
                
                Text(subTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 30)
            
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 300, alignment: .top)
        //.offset(x: 0, y: -190)
        .offset(offset)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title", subTitle: "Subtitle", angle: 15, backgroundColor: .blue, offset: CGSize(width: 0, height: -190))
    }
}
