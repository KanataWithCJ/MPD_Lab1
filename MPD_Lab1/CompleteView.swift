//
//  CompleteView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/22.
//

import SwiftUI

struct CompleteView: View {
    var body: some View {
        ZStack{
            Text("No Item").font(.title2).foregroundColor(.gray)
            GeometryReader{_ in
                VStack(alignment: .leading){
                    Group{
                        Text("Plan").bold().font(.largeTitle).frame(height: 40)
                        HStack{
                            Text("O completed ·").foregroundColor(.primary)
                            Text("clear").foregroundColor(.gray)
                        }
                        Divider()
                    }.padding(.leading,10)
                }
            }
        }
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
