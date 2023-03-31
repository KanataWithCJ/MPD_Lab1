//
//  MyListViewModel.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/30.
//

import Foundation
import SwiftUI
class MyListViewModel:ObservableObject{
    @Published var myListEntities:[MyListEntity] = []
    @Published var myInputItems:[MyInputItemViewModel] = []
    func Append(title:String,EntityColor:Color,Num:Int){
        self.myListEntities.append(MyListEntity(id: myListEntities.count, EntityTitle: title, EntityColor: EntityColor, EntityNum: Num))
        self.myInputItems.append(MyInputItemViewModel())
    }
    
    func Remove(index:IndexSet){
        self.myListEntities.remove(atOffsets: index)
        self.myInputItems.remove(atOffsets: index)
    }
    
    func Move(from:IndexSet,to:Int){
        self.myListEntities.move(fromOffsets: from, toOffset: to)
        self.myInputItems.move(fromOffsets: from, toOffset: to)
    }
}
