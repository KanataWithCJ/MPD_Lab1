//
//  AddListSheetView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/23.
//

import SwiftUI

struct NewRemindSheetView: View {
    @State var ititle:String=""
    @State var inote:String=""
    @Binding var isSheetPresented:Bool
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    GeometryReader{_ in
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                        VStack{
                            TextField("title",text: self.$ititle)
                            Divider()
                            TextField("note",text: self.$inote)
                        }.padding(.leading,10)
                    }
                }.padding(.horizontal,25).frame(height: 150)
                
                Form{
                    Section{
                        NavigationLink(destination:{InfoPageView()}){Text("详细信息")}
                    }
                    Section{
                        NavigationLink(destination:{ListPageView()}){Text("列表")}
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement:.navigationBarLeading){
                    Button("取消"){self.isSheetPresented = false}
                }
                ToolbarItem(placement:.navigationBarTrailing){
                    Button("添加"){}
                }
            }
            .navigationTitle("新提醒事项")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(red: 0.949, green: 0.949, blue: 0.971))
        }
    }
}
//
//struct AddListSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddListSheetView()
//    }
//}
