//
//  InfoPage.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/28.
//

import SwiftUI

struct InfoPageView: View {
    @State var isDateOn:Bool = false
    @State var isTimeOn:Bool = false
    @State var isSendMsg:Bool = false
    @State var isFlagOn:Bool = false
    @State var URL:String = ""
    var body: some View {
        Form{
            Section{
                Toggle(isOn: self.$isDateOn){
                    HStack{
                        Image(systemName: "calendar").resizable().frame(width: 30,height: 30).foregroundColor(.red)
                        Text("日期")
                    }
                }
                Toggle(isOn: self.$isTimeOn){
                    HStack{
                        Image(systemName: "clock").resizable().frame(width: 30,height: 30).foregroundColor(.blue)
                        Text("时间")
                    }
                }
            }
            Section{
                HStack{
                    Image(systemName: "number.square.fill").resizable().frame(width: 30,height: 30).foregroundColor(.gray)
                    Text("标签")
                }
            }
            Section(footer:Text("如选择此选项，当你在\"信息“中与人聊天时，将显示提醒事项通知")){
                Toggle(isOn: self.$isSendMsg){
                    HStack{
                        Image(systemName: "bubble.left").resizable().frame(width: 30,height: 30).foregroundColor(.green)
                        Text("发消息时")
                    }
                }
                if isSendMsg{
                    Button("选取联系人"){}
                }
            }
            Section{
                Toggle(isOn: self.$isFlagOn){
                    HStack{
                        Image(systemName: "flag.square.fill").resizable().frame(width: 30,height: 30).foregroundColor(.orange)
                        Text("旗杆")
                        
                    }
                }
            }
            Section{
                Text("优先级")
            }
            Section{
                Button("添加图像"){}
            }
            Section{
                TextField("URL",text: self.$URL)
            }
        }
    }
}

