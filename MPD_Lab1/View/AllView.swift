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
                    .frame(height: 40).padding(5)
//                Text("Remind").padding(5).foregroundColor(.blue).bold()
                dayTimeView(timeName: "Remind", dFont: .body, buttonColor: .blue,textColor: .blue,inputItemList: MyInputItemViewModel())
                Divider()
//                Text("Camping").padding(5).foregroundColor(.green).bold()
                dayTimeView(timeName: "Camping", dFont: .body, buttonColor: .green,textColor: .green,inputItemList: MyInputItemViewModel())
                Divider()
            }
        }
    }
}

struct AllView_Previews: PreviewProvider {
    static var previews: some View {
        AllView()
    }
}
