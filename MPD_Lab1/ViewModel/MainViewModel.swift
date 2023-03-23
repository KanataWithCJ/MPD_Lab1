//
//  MainViewModel.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/21.
//

import Foundation

class MainViewModel:ObservableObject{
    @Published var mainModel = MainModel()
    func getRemindList()->[MainModel.RemindListItem]{
        mainModel.RemindList
    }
}
