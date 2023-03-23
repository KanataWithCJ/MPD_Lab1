//
//  NewListViewModel.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/23.
//
import SwiftUI
import Foundation

class NewListViewModel:ObservableObject{
    @Published var chooseColor:Color = .blue
    func chooseColor(_ color:Color){
        self.chooseColor = color
    }
}
