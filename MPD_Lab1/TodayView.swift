//
//  TodayView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/21.
//

import SwiftUI

struct TodayView: View {
    @ObservedObject var myblocklistViewModel:MyBlockListViewModel
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Today").bold().font(.largeTitle).foregroundColor(.blue)
                Divider()
                dayTimeView(timeName: "morning",buttonColor: .blue,inputItemList: MyInputItemViewModel())
                Divider()
                dayTimeView(timeName: "noon",buttonColor: .blue,inputItemList: MyInputItemViewModel())
                Divider()
                dayTimeView(timeName: "afternoon",buttonColor: .blue,inputItemList: MyInputItemViewModel())
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button(action: {}){
                        Text("完成")
                    }
                }
            }
        }
    }
}


//struct TodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayView()
//    }
//}
