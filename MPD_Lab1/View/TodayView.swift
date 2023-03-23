//
//  TodayView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/21.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        GeometryReader{g in
            VStack(alignment: .leading){
                Text("Today").bold().font(.largeTitle).foregroundColor(.blue)
                    .frame(height: 40)
                Divider()
                dayTimeView(timeName: "morning")
                Divider()
                dayTimeView(timeName: "noon")
                Divider()
                dayTimeView(timeName: "afternoon")
                
            }
        }
    }
}


struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
