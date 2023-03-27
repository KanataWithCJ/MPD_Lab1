//
//  MainModel.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/21.
//

import SwiftUI

var remindList = [
    MainModel.RemindListItem(
        name:"Camping",
        img:"list.bullet.circle.fill",
        num: 4,
        foreGroundColor: .green),
    MainModel.RemindListItem(
        name:"Remind",
        img:"list.bullet.circle.fill",
        num: 1,
        foreGroundColor: .blue),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .orange),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
////    MainModel.RemindListItem(
//        name:"Remind",
//        img:"list.bullet.circle.fill",
//        num: 1,
//        foreGroundColor: .purple),
//    
]

struct MainModel{
    private(set) var RemindList:[RemindListItem] = remindList

    
    func addToList(item:RemindListItem){
        
    }
    struct RemindListItem:Identifiable{
        var id = UUID()
        var name:String
        var img:String
        var num:Int
        var foreGroundColor:Color
    }
}
