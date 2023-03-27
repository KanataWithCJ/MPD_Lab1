//
//  MyListView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/27.
//

import SwiftUI

var MyNewList:[MyListEntity] = [
    MyListEntity(id: 0, EntityTitle: "Remind", EntityColor: .blue, EntityNum: 0,NavColor: .Blue),
    MyListEntity(id: 1, EntityTitle: "Camping", EntityColor: .green, EntityNum: 1,NavColor: .Green)
]

struct MyListHeader:View{
    var body: some View{
        VStack(alignment:.leading){
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
                NavigationLink(destination: TodayView()){
                    CategoricalBlockView(title: "今天", symbol: "calendar.circle.fill", foreGroundColor: .blue)
                }
                NavigationLink(destination: PlanView()){
                    CategoricalBlockView(title: "计划", symbol: "calendar.circle.fill", foreGroundColor: .red)
                }
                NavigationLink(destination: AllView()){
                    CategoricalBlockView(title: "全部", symbol: "tray.circle.fill", foreGroundColor: .gray)
                }
                NavigationLink(destination: CompleteView()){
                    CategoricalBlockView(title: "完成", symbol: "checkmark.circle.fill", foreGroundColor: .mint)
                }
            }
            Text("我的列表").foregroundColor(.black).font(.title).bold()
        }.frame(minWidth: 385)
    }
}

struct MyNewListView: View {
    var body: some View {
        Form{
            Section(header:MyListHeader()){
                ForEach(MyNewList) { list in
                    switch list.NavColor{
                    case .Blue:
                        NavigationLink(destination:RemindPageView()){
                            MyListEntityView(EntityColor: list.EntityColor, EntityTitle: list.EntityTitle, EntityNum: list.EntityNum)
                        }
                    case .Green:
                        NavigationLink(destination:CampingPageView()){
                            MyListEntityView(EntityColor: list.EntityColor, EntityTitle: list.EntityTitle, EntityNum: list.EntityNum)
                        }
                    }
                }
            }
        }
    }
}


struct MyListEntityView:View{
    let EntityColor:Color
    let EntityTitle:String
    @State var EntityNum:Int
    var body: some View{
        HStack{
            Image(systemName: "list.bullet.circle.fill").resizable().frame(width: 30,height: 30).foregroundColor(self.EntityColor)
            Text(self.EntityTitle)
            Spacer()
            Text("\(self.EntityNum)").foregroundColor(.gray)
        }
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyNewListView()
    }
}
