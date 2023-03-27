//
//  MainPageView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/27.
//

import SwiftUI

struct MainPageView: View {
    @State var isNewRemindItemSheetOn:Bool = false
    @State var isNewListSheetOn:Bool = false
    @State var isEditMode = false
    @State var searchInfo:String = ""
    
    var body: some View {
        NavigationStack{
            VStack(){
                HStack{
                    Image(systemName: "magnifyingglass").foregroundColor(.gray).padding(.leading,5)
                    TextField("搜索", text: $searchInfo)
                }
                .frame(height: 35)
                .background(Color(red: 0.949, green: 0.949, blue: 0.971))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                
                // My List View
                MyNewListView()
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement:.automatic){
                    EditButton()
                }
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        Button(action: {self.isNewRemindItemSheetOn = true}){
                            HStack{
                                Image(systemName: "plus.circle.fill").resizable().frame(width: 30,height: 30)
                                Text("新提醒事项").font(.title2).bold()
                            }
                        }
                        .sheet(isPresented: self.$isNewRemindItemSheetOn){
                           NewRemindSheetView(isSheetPresented: self.$isNewRemindItemSheetOn)
                        }
                        Spacer()
                        Button(action: {self.isNewListSheetOn = true}){
                            Text("添加列表").font(.title2)
                        }.sheet(isPresented: self.$isNewListSheetOn){
                           NewListSheetView(isSheetPresented: self.$isNewListSheetOn)
                        }
                    }
                }
            }
        }.navigationTitle("列表")
    }
}





struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
