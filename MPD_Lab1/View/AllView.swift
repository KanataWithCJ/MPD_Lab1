//
//  AllView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/23.
//

import SwiftUI

struct AllView: View {
    var body: some View {
        GeometryReader{g in
            VStack(alignment: .leading){
                Text("All").bold().font(.largeTitle)
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

struct AllView_Previews: PreviewProvider {
    static var previews: some View {
        AllView()
    }
}
