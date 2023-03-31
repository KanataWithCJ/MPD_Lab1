//
//  MyBlockEntity.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/27.
//

import Foundation
import SwiftUI
struct MyBlockEntity:Hashable,Identifiable{
    var id:Int
    var title:String
    var symbol:String
    var foregroundcolor:Color
    var isChosen:Bool = false
    mutating func Toggle(){
        self.isChosen.toggle()
    }
}
