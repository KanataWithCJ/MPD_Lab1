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
                Text("今天").bold().font(.largeTitle).foregroundColor(.blue)
                Divider()
                dayTimeView(timeName: "上午",buttonColor: .blue,inputItemList: MyInputItemViewModel())
                Divider()
                dayTimeView(timeName: "下午",buttonColor: .blue,inputItemList: MyInputItemViewModel())
                Divider()
                dayTimeView(timeName: "今晚",buttonColor: .blue,inputItemList: MyInputItemViewModel())
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
