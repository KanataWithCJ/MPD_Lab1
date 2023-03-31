//
//  MyBlockListViewModel.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/30.
//

import Foundation
import SwiftUI
class MyBlockListViewModel:ObservableObject{
    @Published var myBlockList:[MyBlockEntity] = [
        MyBlockEntity(id: 0, title: "今天", symbol: "calendar.circle.fill", foregroundcolor: .blue),
        MyBlockEntity(id: 1, title: "计划", symbol: "calendar.circle.fill", foregroundcolor: .red),
        MyBlockEntity(id: 2, title: "完成", symbol: "tray.circle.fill", foregroundcolor: .gray),
        MyBlockEntity(id: 3, title: "全部", symbol: "checkmark.circle.fill", foregroundcolor: .cyan)
    ]
    func Toggle(idx:Int){
        myBlockList[idx].isChosen.toggle()
    }
    
    func Append(title:String,symbol:String,foregroundColor:Color){
        self.myBlockList.append(MyBlockEntity(id:self.myBlockList.count,title: title,symbol: symbol,foregroundcolor: foregroundColor))
    }
    
    func Remove(index:IndexSet){
        self.myBlockList.remove(atOffsets: index)
    }
    
    func Move(from:IndexSet,to:Int){
        self.myBlockList.move(fromOffsets: from, toOffset: to)
    }
}
