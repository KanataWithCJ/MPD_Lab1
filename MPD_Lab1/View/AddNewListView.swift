//
//  AddNewListView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/23.
//

import SwiftUI

struct AddNewListView: View {
    @Binding var isSheet:Bool
    var colorlist:[Color] = [.red,.orange,.yellow,.green,.blue,.purple,.brown]
    @ObservedObject var newListviewmodel = NewListViewModel()
    @State var inputListName:String = ""
    var body: some View {
        NavigationStack{
            GeometryReader{_ in
                VStack{
                    HStack{
                        Button("cancel"){self.isSheet = false}
                        Spacer()
                        Text("New List")
                        Spacer()
                        Button("Add"){}
                    }.padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                        VStack{
                            Image(systemName: "list.bullet.circle.fill").resizable().frame(width: 100,height: 100).foregroundColor(newListviewmodel.chooseColor.opacity(0.7)).shadow(radius: 2).padding().offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
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
//                                    Button(action:{
//                                        newListviewmodel.chooseColor(self.colorlist[i])
//                                    } ){
//                                        CircleItem(forecolor: self.colorlist[i],ChosenColor:newListviewmodel.chooseColor)
//                                    }
                                    CircleItem(forecolor: self.colorlist[i],ChosenColor:newListviewmodel.chooseColor)
                                        .onTapGesture {
                                            newListviewmodel.chooseColor(self.colorlist[i])
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
    var ChosenColor:Color = .red
    var body: some View{
        if forecolor != ChosenColor{
            Circle().foregroundColor(forecolor).padding(.horizontal,5)
        }else{
            ZStack{
                Circle().stroke(lineWidth: 10).foregroundColor(.gray)
                Circle().foregroundColor(forecolor)
            }.padding(.horizontal,5)
        }
    }
}

//struct AddNewListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewListView()
//    }
//}

