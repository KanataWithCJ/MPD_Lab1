//
//  PlanView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/22.
//

import SwiftUI

struct dayItem:Identifiable{
    var id = UUID()
    var name:String
    var Dfont:Font
}

var dayList = [
    dayItem(name: "今天",Dfont: .title),
    dayItem(name: "明天", Dfont: .title),
    dayItem(name: "后天", Dfont: .body),
    dayItem(name: "3月25日 周日", Dfont: .body),
    dayItem(name: "3月26日 周六", Dfont: .body),
    dayItem(name: "3月27日 周一", Dfont: .body),
    dayItem(name: "3月28日 周二", Dfont: .body),
    dayItem(name: "三月剩余时间", Dfont: .title),
    dayItem(name: "四月", Dfont: .title),
    dayItem(name: "五月", Dfont: .title),
    dayItem(name: "六月", Dfont: .title),
    dayItem(name: "七月", Dfont: .title),
    dayItem(name: "八月", Dfont: .title),
    dayItem(name: "九月", Dfont: .title),
    dayItem(name: "十月", Dfont: .title),
    dayItem(name: "十一月", Dfont: .title),
    dayItem(name: "十二月", Dfont: .title),
    dayItem(name: "2024年一月", Dfont: .title),
    dayItem(name: "2024年二月", Dfont: .title)
]

struct PlanView: View {
    var body: some View {
        GeometryReader{g in
            ScrollView{
                VStack(alignment: .leading){
                    Text("计划").bold().font(.largeTitle).foregroundColor(.red).frame(height: 40)
                    Group{
                        ForEach(dayList) { list in
                            dayTimeView(timeName: list.name,dFont: list.Dfont,
                                        buttonColor: .red,inputItemList: MyInputItemViewModel())
                            Divider()
                        }
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem(placement:.automatic){
                Button("完成"){}
            }
        }
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
