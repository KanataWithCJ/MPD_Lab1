//
//  MyListView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/27.
//

import SwiftUI

struct MyListHeader:View{
    @Environment(\.editMode) private var editMode
//    @Binding var MyBlockLists:[MyBlockEntity]
    @ObservedObject var myblocklistViewModel:MyBlockListViewModel
    var body: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
            ForEach(myblocklistViewModel.myBlockList) { list in
                if list.isChosen == false{
                    switch list.title{
                    case "今天":
                        NavigationLink(destination: TodayView(myblocklistViewModel: self.myblocklistViewModel)){
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
    @ObservedObject var mylistViewModel:MyListViewModel
    @ObservedObject var myblocklistViewModel:MyBlockListViewModel = MyBlockListViewModel()
    @Environment(\.editMode) private var editMode
    var body: some View {
        Form{
            if editMode?.wrappedValue.isEditing == false{
                Section(header:MyListHeader(myblocklistViewModel: self.myblocklistViewModel)){}
            }else{
                List{
                    ForEach(myblocklistViewModel.myBlockList) { block in
                        HStack{
                            Button(action:{myblocklistViewModel.Toggle(idx: block.id)}){
                                if block.isChosen{
                                    Image(systemName: "circle").resizable().frame(width: 30,height: 30)
                                }else{
                                    Image(systemName: "checkmark.circle.fill").resizable().frame(width: 30,height: 30)
                                }
                            }
                            Image(systemName: block.symbol).resizable().frame(width: 30,height: 30).foregroundColor(block.foregroundcolor)
                            Text(block.title)
                        }
                    }
                    .onMove{self.myblocklistViewModel.Move(from: $0, to: $1)}
                    
                }
            }
            Section(header: Text("我的列表").foregroundColor(.black).font(.title).bold()){
                ForEach(mylistViewModel.myListEntities) { list in
                    NavigationLink(destination:RemindPageView(title: list.EntityTitle,ButtonColor: list.EntityColor,inputItemViewModel:mylistViewModel.myInputItems[list.id]))
                    {
                        MyListEntityView(EntityColor: list.EntityColor, EntityTitle: list.EntityTitle,inputItemViewModel: mylistViewModel.myInputItems[list.id])
                    }
                }.onDelete{mylistViewModel.Remove(index:$0)}
                    .onMove{mylistViewModel.Move(from: $0, to: $1)}
            }
            TagView()
        }.animation(.default,value: editMode?.wrappedValue)
    }
}


struct MyListEntityView:View{
    let EntityColor:Color
    let EntityTitle:String
    @ObservedObject var inputItemViewModel:MyInputItemViewModel
    var body: some View{
        HStack{
            Image(systemName: "list.bullet.circle.fill").resizable().frame(width: 30,height: 30).foregroundColor(self.EntityColor)
            Text(self.EntityTitle)
            Spacer()
            Text("\(self.inputItemViewModel.ItemNum)").foregroundColor(.gray)
        }
    }
}

//    struct MyListView_Previews: PreviewProvider {
//        static var previews: some View {
//            MyNewListView()
//        }
//    }
