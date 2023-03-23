//
//  MyListView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/21.
//

import SwiftUI

struct MyListItemView:View{
    var listItem:MainModel.RemindListItem
    var body: some View{
        List{
            HStack {
                Image(systemName:listItem.img)
                    .resizable()
                    .frame(width:30,height:30)
                    .foregroundColor(listItem.foreGroundColor)
                Text(listItem.name)
                Spacer()
                Text(String(listItem.num))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct MyListView:View{
    var MyList:[MainModel.RemindListItem]
//    let geometry:GeometryProxy
    var body: some View{
        Form{
//            List{
                Section(header:Text("My List").bold().font(.title).foregroundColor(.black)){
                    ForEach(MyList) { list in
                        if(list.name == "Camping"){
                            NavigationLink(destination:CampingView()){MyListItemView(listItem: list)}
                        }else{
                            NavigationLink(destination:RemindView()){MyListItemView(listItem: list)}
                        }
                    }
                }
//            }.scrollDisabled(true)
        }
    }
}
