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
            GeometryReader{_ in
                VStack(alignment: .leading){
                    Group{
                        Text("完成").bold().font(.largeTitle).frame(height: 40)
                        HStack{
                            Text("5项完成 ·").foregroundColor(.primary)
                            Button("清除"){}
                        }
                        Divider()
                        HStack{
                            Text("3月31日")
                            Text("周六").bold()
                        }
                        completelistItemView(title:"hello", timetag: "Remind-2023/3/28", completetime:"2023/3/30 16:23")
                        completelistItemView(title:"hello", timetag: "Remind-2023/3/28", completetime:"2023/3/30 16:23")
                        completelistItemView(title:"hello", timetag: "Remind-2023/3/28", completetime:"2023/3/30 16:23")
                        completelistItemView(title:"hello", timetag: "Remind-2023/3/28", completetime:"2023/3/30 16:23")
                        completelistItemView(title:"hello", timetag: "Remind-2023/3/28", completetime:"2023/3/30 16:23")

                        
                    }.padding(.leading,10)
                }
            }
        }
    }
}

struct completelistItemView:View{
    @State var title:String
    var timetag:String
    var completetime:String
    var body: some View{
        HStack{
            ZStack{
                Circle().stroke().frame(width: 20)
                Circle().frame(width: 15)
            }.frame(height: 80,alignment: .top).padding(5)
            VStack(alignment:.leading){
                TextField("", text: self.$title)
                Text(self.timetag)
                Text("完成日期：\(self.completetime)")
                Divider()
            }.foregroundColor(.gray)
        }
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
