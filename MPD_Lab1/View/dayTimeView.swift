//
//  dayTimeView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/22.
//

import SwiftUI

struct dayTimeView:View{
    let timeName:String
    var dFont:Font = .caption
    var body: some View{
        Text(timeName).foregroundColor(.gray).font(dFont).padding([.leading],10)
    }
}

struct dayTimeView_Previews: PreviewProvider {
    static var previews: some View {
        dayTimeView(timeName: "Today")
    }
}
