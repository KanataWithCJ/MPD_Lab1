//
//  SectionBlockView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/21.
//

import SwiftUI

struct CategoricalBlockView:View{
    let title:String
    let symbol:String
    let foreGroundColor:Color
    var number:Int = 0
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
            VStack{
                HStack{
                    Image(systemName: symbol)
                        .resizable()
                        .frame(width: 40,height: 40)
                        .padding(.leading,10)
                        .foregroundColor(foreGroundColor)
                    Spacer()
                    Text("\(number)")
                        .font(.title)
                        .bold()
                        .padding(.trailing, 10.0)
                        .foregroundColor(.black)
                }
                Text(title)
                    .bold()
                    .foregroundColor(.gray)
                    .frame(width:150,alignment: .bottomLeading)
                    .padding([.top],1)
            }
        }
        .aspectRatio(2,contentMode: .fit)
        
    }
}
