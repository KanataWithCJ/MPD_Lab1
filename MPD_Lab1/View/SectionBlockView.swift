//
//  SectionBlockView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/21.
//

import SwiftUI

struct SectionBlockView:View{
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
                        .foregroundColor(foreGroundColor)
                        .font(.largeTitle)
                    Spacer()
                    Text("\(number)")
                        .font(.title)
                        .bold()
                        .padding(.trailing, 10.0)
                        .foregroundColor(.black)
                }
                .padding([.leading, .trailing], 5)
                Text(title)
                    .bold()
                    .foregroundColor(.gray)
                    .frame(width:150,alignment: .bottomLeading)
                    .padding([.top],1)
            }
        }
        .aspectRatio(2,contentMode: .fill)
        .padding(10)
    }
}
