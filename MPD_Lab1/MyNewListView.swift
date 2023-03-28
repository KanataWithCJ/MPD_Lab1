//
//  MyListView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/27.
//

import SwiftUI

struct MyListHeader:View{
    @Environment(\.editMode) private var editMode
    @Binding var MyBlockLists:[MyBlockEntity]
    var body: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
            ForEach(MyBlockLists) { list in
                if list.isChosen == false{
                    switch list.title{
                    case "今天":
                        NavigationLink(destination: TodayView()){
                            CategoricalBlockView(title: list.title, symbol: list.symbol, foreGroundColor: list.foregroundcolor)
                        }
                    case "计划":
                        NavigationLink(destination: PlanView()){
                            CategoricalBlockView(title: list.title, symbol: list.symbol, foreGroundColor: list.foregroundcolor)
                        }
                    case "完成":
                        NavigationLink(destination: CompleteView()){
                            CategoricalBlockView(title: list.title, symbol: list.symbol, foreGroundColor: list.foregroundcolor)
                        }
                    case "全部":
                        NavigationLink(destination: AllView()){
                            CategoricalBlockView(title: list.title, symbol: list.symbol, foreGroundColor: list.foregroundcolor)
                        }
                    default:
                        Text("No Item")
                    }
                }
            }
        }.frame(minWidth: 385)
    }
}

struct MyNewListView: View {
    @State var MyNewList:[MyListEntity] = [
        MyListEntity(id: 0, EntityTitle: "Remind", EntityColor: .blue, EntityNum: 0,NavColor: .Blue),
        MyListEntity(id: 1, EntityTitle: "Camping", EntityColor: .green, EntityNum: 1,NavColor: .Green),
        MyListEntity(id: 2, EntityTitle: "Camping", EntityColor: .orange, EntityNum: 1,NavColor: .Green),
        MyListEntity(id: 3, EntityTitle: "Camping", EntityColor: .yellow, EntityNum: 1,NavColor: .Green),
        MyListEntity(id: 4, EntityTitle: "Camping", EntityColor: .purple, EntityNum: 1,NavColor: .Green),
        MyListEntity(id: 5, EntityTitle: "Camping", EntityColor: .gray, EntityNum: 1,NavColor: .Green)
    ]
    
    @State var MyBlockLists = [
        MyBlockEntity(id: 0, title: "今天", symbol: "calendar.circle.fill", foregroundcolor: .blue),
        MyBlockEntity(id: 1, title: "计划", symbol: "calendar.circle.fill", foregroundcolor: .red),
        MyBlockEntity(id: 2, title: "完成", symbol: "tray.circle.fill", foregroundcolor: .gray),
        MyBlockEntity(id: 3, title: "全部", symbol: "checkmark.circle.fill", foregroundcolor: .cyan)
    ]
    @Environment(\.editMode) private var editMode
    var body: some View {
        Form{
            if editMode?.wrappedValue.isEditing == false{
                Section(header:MyListHeader(MyBlockLists: self.$MyBlockLists)){}
            }else{
                List{
                    ForEach(0..<MyBlockLists.count) { i in
                        HStack{
                            Button(action:{MyBlockLists[i].isChosen.toggle()}){
                                if MyBlockLists[i].isChosen{
                                    Image(systemName: "circle").resizable().frame(width: 30,height: 30)
                                }else{
                                    Image(systemName: "checkmark.circle.fill").resizable().frame(width: 30,height: 30)
                                }
                            }
                            Image(systemName: MyBlockLists[i].symbol).resizable().frame(width: 30,height: 30).foregroundColor(MyBlockLists[i].foregroundcolor)
                            Text(MyBlockLists[i].title)
                        }
                    }
                    .onMove{MyBlockLists.move(fromOffsets: $0, toOffset: $1)}
                    
                }
            }
            Section(header: Text("我的列表").foregroundColor(.black).font(.title).bold()){
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
                }.onDelete{MyNewList.remove(atOffsets:$0)}
                    .onMove{MyNewList.move(fromOffsets: $0, toOffset: $1)}
            }
            if self.editMode?.wrappedValue.isEditing == false{
                TagView()
            }
        }.animation(.default,value: editMode?.wrappedValue)
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
