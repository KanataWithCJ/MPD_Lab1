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
    dayItem(name: "Today",Dfont: .title),
    dayItem(name: "Tomorrow", Dfont: .title),
    dayItem(name: "Day after tomorrow", Dfont: .body),
    dayItem(name: "3.25 Saturday", Dfont: .body),
    dayItem(name: "3.26 Sunday", Dfont: .body),
    dayItem(name: "3.27 Monday", Dfont: .body),
    dayItem(name: "3.28 Tuesday", Dfont: .body),
    dayItem(name: "Rest of time in March", Dfont: .title),
    dayItem(name: "April", Dfont: .title),
    dayItem(name: "May", Dfont: .title),
    dayItem(name: "June", Dfont: .title),
    dayItem(name: "July", Dfont: .title),
    dayItem(name: "August", Dfont: .title),
    dayItem(name: "September", Dfont: .title),
    dayItem(name: "October", Dfont: .title),
    dayItem(name: "November", Dfont: .title),
    dayItem(name: "December", Dfont: .title),
    dayItem(name: "2024 January", Dfont: .title),
    dayItem(name: "2024 Feburary", Dfont: .title)
]

struct PlanView: View {
    var body: some View {
        GeometryReader{g in
            ScrollView{
                VStack(alignment: .leading){
                    Text("Plan").bold().font(.largeTitle).foregroundColor(.red).frame(height: 40)
                    Group{
                        ForEach(dayList) { list in
                            dayTimeView(timeName: list.name,dFont: list.Dfont,
                                        buttonColor: .red)
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
