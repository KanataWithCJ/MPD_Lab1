//
//  MyListEntity.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/27.
//

import SwiftUI
import Foundation

struct MyListEntity:Identifiable,Hashable{
    var id: Int
    var EntityTitle:String
    var EntityColor:Color
    var EntityNum:Int
    var NavColor:NavPage
    enum NavPage{
        case Blue,Green
    }
}
