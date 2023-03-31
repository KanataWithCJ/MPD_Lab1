//
//  MyInputItemViewModel.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/30.
//

import Foundation
class MyInputItemViewModel:ObservableObject{
    @Published var inputItem:[inputItemEntity] = []
    @Published var ItemNum:Int = 0
    func Append(text:String,note:String){
        self.inputItem.append(inputItemEntity(id: inputItem.count, text: text, note: note))
        ItemNum+=1
    }
    
    func Remove(index:Int){
        self.inputItem.remove(at: index)
        ItemNum-=1
    }
    
    func Move(from:IndexSet,to:Int){
        self.inputItem.move(fromOffsets: from, toOffset: to)
    }
}
