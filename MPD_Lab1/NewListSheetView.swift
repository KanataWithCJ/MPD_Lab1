//
//  AddNewListView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/23.
//

import SwiftUI

struct NewListSheetView: View {
    @Binding var isSheetPresented:Bool
    var colorlist:[Color] = [.red,.orange,.yellow,.green,.blue,.purple,.brown]
    @State var ChosenColorid:Int = 0
    @State var inputListName:String = ""
    @ObservedObject var mylistViewModel:MyListViewModel
    var body: some View {
        NavigationStack{
            GeometryReader{_ in
                VStack{
                    HStack{
                        Button("cancel"){self.isSheetPresented = false}
                        Spacer()
                        Text("New List")
                        Spacer()
                        Button("Add"){
                            mylistViewModel.Append(title: self.inputListName, EntityColor: self.colorlist[self.ChosenColorid], Num: 0)
                            self.isSheetPresented = false
                        }
                    }.padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                        VStack{
                            Image(systemName: "list.bullet.circle.fill").resizable().frame(width: 100,height: 100).foregroundColor(self.colorlist[self.ChosenColorid].opacity(0.7)).shadow(radius: 2).padding().offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            ZStack(alignment:.center){
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.trailing,10)
                                    .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
                                    .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                TextField("List Name", text: self.$inputListName)
                                    .offset(x: 145, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            }.padding(.bottom,10)
                        }.padding(.leading,10)
                    }.padding(.horizontal,25).frame(height: 200)
                    GeometryReader{_ in
                        ZStack{
                            RoundedRectangle(cornerRadius: 15).foregroundColor(.white)
                            HStack{
                                ForEach(0..<7){i in
                                    if self.ChosenColorid == i{
                                        CircleItem(forecolor: colorlist[i],isChosen: true)
                                    }else{
                                        CircleItem(forecolor: colorlist[i],isChosen: false).onTapGesture {
                                            self.ChosenColorid = i
                                        }
                                    }
                                }
                            }
                        }
                    }.padding(.horizontal,23).frame(height: 100)
                }
            }.background(Color(red: 0.949, green: 0.949, blue: 0.971))
        }
    }
}

struct CircleItem:View{
    var forecolor:Color = .red
    @State var isChosen:Bool = false
    var body: some View{
        if self.isChosen == false{
            Circle().foregroundColor(forecolor).padding(.horizontal,5)
        }else{
            ZStack{
                Circle().stroke(lineWidth: 5).frame(width: 50,height: 50).foregroundColor(.gray)
                Circle().frame(width: 35,height: 35).foregroundColor(forecolor)
            }.padding(.horizontal,5)
        }
    }
}

//struct AddNewListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewListView()
//    }
//}

