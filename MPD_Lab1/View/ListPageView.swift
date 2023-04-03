//
//  ListPageView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/30.
//

import SwiftUI

struct ListPageView: View {
    var ListPage =
    [ListItem(id: 0, buttonColor: .blue, title: "Remind"),
     ListItem(id: 1, buttonColor: .green, title: "Camping")]
    var body: some View {
        VStack{
            Text("将在list1中创建提醒事项").bold().padding(.bottom,30)
            VStack(alignment:.center){
                HStack{
                    Text("iCloud").bold().font(.title)
                    Spacer()
                }.padding()
            }
            ForEach(self.ListPage){
                list in
                ListItemView(buttonColor: list.buttonColor, title: list.title)
            }
            Spacer()
        }.navigationTitle("列表").navigationBarTitleDisplayMode(.inline)
    }
}

struct ListItem:Identifiable{
    var id: Int
    var buttonColor:Color
    var title:String
}

struct ListItemView:View{
    var buttonColor:Color
    var title:String
    var body: some View{
        HStack{
            Image(systemName: "list.bullet.circle.fill")
                .resizable().frame(width: 30,height: 30).foregroundColor(self.buttonColor).offset(y:-5)
            VStack{
                HStack{
                    Text(self.title)
                    Spacer()
                    Button(action:{}){
                        Image(systemName:"checkmark")
                    }
                }
                Divider()
            }
            .padding(.trailing)
        }.padding(.leading)
    }
}


struct ListPageView_Previews: PreviewProvider {
    static var previews: some View {
        ListPageView()
    }
}
